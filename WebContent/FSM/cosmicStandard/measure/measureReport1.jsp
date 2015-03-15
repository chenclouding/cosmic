<%@ page contentType="application/msword;charset=GBK"%>
<jsp:useBean id="projectMeasureBean" scope="session" class="javaBeans.fsm.ProjectMeasureBean"/>
<%@ page import="business.FSM.MeasureReport" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<html>  
  
  <%  
      
      Integer productId = projectMeasureBean.getProductId();
       MeasureReport mr = new MeasureReport();
       String code = mr.exportMeasureReport(productId); 
      response.setHeader("Content-disposition","attachment; filename=measureReport.doc");
  %>          

 <%=code %>
  
</html>
