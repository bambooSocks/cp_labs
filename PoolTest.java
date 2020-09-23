import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.*;

class PoolTask implements Callable<String> {

    @Override
    public String call() throws Exception {
        System.out.println("there");
        Thread.sleep(10);
        return "hey";
    }
}

public class PoolTest {
    static ExecutorService exec = Executors.newCachedThreadPool();

    public static void main(String[] args) throws InterruptedException, ExecutionException {
        List<PoolTask> tasks = new LinkedList<>();
        for (int i = 0; i < 100; i++) {
            tasks.add(new PoolTask());
        }

        long start = System.nanoTime();

        List<Future<String>> results = exec.invokeAll(tasks);

        for (Future<String> fs : results) {
            System.out.println(fs.get());
        }

        System.out.printf("\ntook: %f s\n", (System.nanoTime() - start)/1e9);
    }

}
