package controller.ContextListener;


import dal.MatchSeatDAO;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

public class MatchSeatUpdater implements Runnable {

    private static MatchSeatUpdater instance;

    public static MatchSeatUpdater getInstance() {
        if (instance == null) {
            instance = new MatchSeatUpdater();
        }
        return instance;
    }

    @Override
    public void run() {
        MatchSeatDAO.INSTANCE.updateMatchSeatQuantity();
    }

    public void startScheduler() {
        ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);
        scheduler.scheduleAtFixedRate(new MatchSeatUpdater(), 0, 1, TimeUnit.MINUTES);
    }
}
