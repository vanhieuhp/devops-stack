import io.prometheus.client.Counter;
import io.prometheus.client.Gauge;
import io.prometheus.client.exporter.HTTPServer;

public class Prometheus {

    static final Counter counter = Counter.build()
            .name("java_random_counter_total")
            .help("JAVA RANDOM COUNTER")
            .labelNames("foo", "bar")
            .register();

    static final Gauge gauge = Gauge.build()
            .name("java_random_gauge")
            .help("JAVA RANDOM GAUSE")
            .register();

    public static void main(String[] args) throws Exception {
        counter.labels("1", "2").inc();

        gauge.set(100);
        gauge.inc(10);
        gauge.dec(5);

        HTTPServer server = new HTTPServer.Builder()
                .withPort(8090)
                .build();
    }
}
