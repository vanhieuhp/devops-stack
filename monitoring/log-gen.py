import logging
import random
import time
from datetime import datetime
import os
from typing import Dict, List

# Constants
LOG_DIR = "log"
LOG_FILE = os.path.join(LOG_DIR, "loki-monitoring.log")
APP_NAME = "loki-monitoring"

# Ensure log directory exists
os.makedirs(LOG_DIR, exist_ok=True)

# Create a custom formatter for logfmt style
class LogfmtFormatter(logging.Formatter):
    def format(self, record):
        timestamp = datetime.now().isoformat(timespec='milliseconds')
        logfmt = (
            f'time="{timestamp}" '
            f'level={record.levelname} '
            f'app={APP_NAME} '
            f'component={record.__dict__.get("component", "unknown")} '
            f'msg="{record.getMessage()}"'
        )
        return logfmt

# Setup logger
logger = logging.getLogger(APP_NAME)
logger.setLevel(logging.DEBUG)

file_handler = logging.FileHandler(LOG_FILE)
file_handler.setFormatter(LogfmtFormatter())
logger.addHandler(file_handler)

# Define log components and messages
COMPONENTS: Dict[str, List[str]] = {
    "backend": [
        "User authentication successful",
        "API request processed",
        "Database connection established",
        "Cache updated successfully",
        "Background job completed",
        "Rate limit exceeded",
        "Invalid request parameters",
        "Service health check passed",
        "Memory usage threshold reached",
        "Request timeout occurred"
    ],
    # "database": [
    #     "Query execution time: {time}ms",
    #     "Connection pool exhausted",
    #     "Deadlock detected",
    #     "Index optimization completed",
    #     "Backup process started",
    #     "Replication lag: {lag}ms",
    #     "Query plan cache hit",
    #     "Transaction rollback required",
    #     "Connection timeout",
    #     "Database maintenance completed"
    # ],
    # "cache": [
    #     "Cache hit ratio: {ratio}%",
    #     "Cache eviction triggered",
    #     "Memory pressure detected",
    #     "Cache warming completed",
    #     "Invalid cache entry removed",
    #     "Cache cluster rebalanced",
    #     "Cache size limit reached",
    #     "Cache consistency check passed",
    #     "Cache partition created",
    #     "Cache statistics updated"
    # ],
    # "api": [
    #     "Rate limit: {current}/{max} requests",
    #     "API version deprecated",
    #     "Request validation failed",
    #     "OAuth token expired",
    #     "API gateway timeout",
    #     "Circuit breaker opened",
    #     "Request throttled",
    #     "API documentation updated",
    #     "New endpoint deployed",
    #     "API health check failed"
    # ]
}

LOG_LEVELS: Dict[str, float] = {
    "INFO": 0.8,
    # "DEBUG": 0.2,
    # "WARNING": 0.2,
    "ERROR": 0.2,
    # "CRITICAL": 0.05
}

LOG_LEVEL_MAPPING = {
    "DEBUG": logging.DEBUG,
    "INFO": logging.INFO,
    "WARNING": logging.WARNING,
    "ERROR": logging.ERROR,
    "CRITICAL": logging.CRITICAL
}

def get_log_level() -> str:
    rand = random.random()
    cumulative = 0
    for level, prob in LOG_LEVELS.items():
        cumulative += prob
        if rand <= cumulative:
            return level
    return "INFO"

def format_message(msg: str) -> str:
    if "{time}" in msg:
        return msg.format(time=random.randint(10, 1000))
    if "{lag}" in msg:
        return msg.format(lag=random.randint(1, 100))
    if "{ratio}" in msg:
        return msg.format(ratio=random.randint(70, 99))
    if "{current}" in msg and "{max}" in msg:
        return msg.format(current=random.randint(1, 100), max=100)
    return msg

def log_entry(component: str, message: str, level: str):
    """Generate a log entry and print to console with color."""
    extra = {"component": component}
    logger.log(LOG_LEVEL_MAPPING[level], format_message(message), extra=extra)
    
    # Console output with colors
    colors = {
        "DEBUG": "\033[36m",    # Cyan
        "INFO": "\033[32m",     # Green
        "WARNING": "\033[33m",  # Yellow
        "ERROR": "\033[31m",    # Red
        "CRITICAL": "\033[35m"  # Magenta
    }
    reset = "\033[0m"
    color = colors.get(level, reset)
    print(f"{color}[{component}] {level}: {message}{reset}")

def generate_logs(interval: float = 1.0):
    """Generate logs continuously until interrupted."""
    print(f"\nStarting continuous log generation -> {LOG_FILE}")
    print("Press Ctrl+C to stop\n")
    try:
        while True:
            component = random.choice(list(COMPONENTS.keys()))
            raw_msg = random.choice(COMPONENTS[component])
            level = get_log_level()
            log_entry(component, raw_msg, level)
            time.sleep(interval)
    except KeyboardInterrupt:
        print("\nLog generation stopped by user")
    except Exception as e:
        logger.error(f"Error: {e}", extra={"component": "logger"})

if __name__ == "__main__":
    generate_logs(interval=0.1)
