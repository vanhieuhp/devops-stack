from prometheus_client import start_http_server, Summary, Counter, Gauge
import time
import random

REQUEST_TIME = Summary('request_processing_second', 'Time spent processing a function')
MY_COUNTER = Counter('my_counter', 'A counter', ["name", "age"])
MY_GAUGE = Gauge('my_gauge', 'A gauge')

@REQUEST_TIME.time()

def process_request(t):
    MY_COUNTER.labels(name="joe", age=23).inc(3)
    MY_GAUGE.set(5)
    MY_GAUGE.inc(5)
    MY_GAUGE.dec(2)
    time.sleep(t)

if __name__ == "__main__":
    start_http_server(8080)

    # Simulate a request processing time between 0.1 and 2 seconds
    process_time = random.uniform(0.1, 2.0)
    process_request(process_time)
    print(f"Processed request in {process_time:.2f} seconds")

    while True:
        A=1
    print("Server end.");
    # Keep the server running

