<%@ page contentType="application/msword;charset=GBK"%>
<jsp:useBean id="projectMeasureBean" scope="session" class="javaBeans.fsm.ProjectMeasureBean"/>
<%@ page import="business.FSM.LayerMeasureReport" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<html>
  <%  
       Integer layerId = new Integer(request.getParameter("layerId"));//��ȡ��ҳ��layer.jsp���������layerId
       Integer productId = new Integer(request.getParameter("productId"));
       LayerMeasureReport lmr = new LayerMeasureReport();
       String code = lmr.exportMeasureReport(layerId);
        response.setHeader("Content-disposition","attachment; filename=layerMeasureReport.doc");          
  %>  
 <%=code %>
 
  <a href="/fsmch/FSM/cosmicStandard/strategy/layer.jsp?productId=<%=productId %>"> ����</a>
</html>
