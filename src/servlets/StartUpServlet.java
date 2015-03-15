package servlets;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import util.HourlyInitializationSchedule;


/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2003</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */

public class StartUpServlet extends HttpServlet {
  private static final String CONTENT_TYPE = "text/html; charset=GBK";
  //Initialize global variables
  public void init() throws ServletException {
  	
   //服务器启动时，执行初始化程序HourlyInitializationSchedule.start();
    HourlyInitializationSchedule.getInstance().start();
  	
  }

  //Clean up resources
  public void destroy() {
  }
}