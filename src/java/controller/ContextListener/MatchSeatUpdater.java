package controller.ContextListener;

import dal.MatchSeatDAO;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

public class MatchSeatUpdater implements Runnable {

    private static MatchSeatUpdater instance;
    private final ScheduledExecutorService scheduler;

    private MatchSeatUpdater() {
        scheduler = Executors.newScheduledThreadPool(1);
    }

    public static synchronized MatchSeatUpdater getInstance() {
        if (instance == null) {
            instance = new MatchSeatUpdater();
        }
        return instance;
    }

    @Override
    public void run() {
        try {
            MatchSeatDAO.INSTANCE.updateMatchSeatAvailability();
        } catch (Exception e) {
            // Log the exception
            e.printStackTrace();
        }
    }

    public void startScheduler() {
        scheduler.scheduleAtFixedRate(this, 0, 1, TimeUnit.MINUTES);
    }

    public void stopScheduler() {
        scheduler.shutdown();
        try {
            if (!scheduler.awaitTermination(60, TimeUnit.SECONDS)) {
                scheduler.shutdownNow();
                if (!scheduler.awaitTermination(60, TimeUnit.SECONDS)) {
                    System.err.println("Scheduler did not terminate");
                }
            }
        } catch (InterruptedException ie) {
            scheduler.shutdownNow();
            Thread.currentThread().interrupt();
        }
    }

}
