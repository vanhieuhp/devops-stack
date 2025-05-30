from prometheus_client import push_to_gateway, CollectorRegistry, Gauge, registry

registry = CollectorRegistry()
gauge = Gauge("python_push_to_gateway", "python_push_to_gateway", registry=registry)


while True:
    gauge.set_to_current_time()
    push_to_gateway('192.111.33.110:9091', job='python-job', registry=registry)