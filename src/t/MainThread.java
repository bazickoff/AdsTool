package t;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

public class MainThread {
    private int corePoolSize = 1;
    private int maxPoolSize = 1;
    private long keepAlive = 5000L;
    private TimeUnit unit = TimeUnit.SECONDS;

    ExecutorService pool = Executors.newSingleThreadExecutor();

    public void addTask(Runnable runnable) {
        this.pool.submit(runnable);
    }

    public void shutdown() {
        this.pool.shutdown();
    }
}
