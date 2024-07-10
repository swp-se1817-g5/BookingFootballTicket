package controller.ContextListener;

import jakarta.servlet.annotation.WebListener;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * Web application lifecycle listener.
 *
 * @author thuat
 */
@WebListener
public class FBTServletListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        MatchSeatUpdater.getInstance().startScheduler();
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        MatchSeatUpdater.getInstance().stopScheduler();
    }
}
