<%@ page contentType="application/msword;charset=GBK"%>
<%@ page import="business.FSM.PeerCompMeasureReport" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<jsp:useBean id="projectMeasureBean" scope="session" class="javaBeans.fsm.ProjectMeasureBean"/>

<html>
  <%  
       Integer peerCompId = new Integer(request.getParameter("peerCompId"));//��ȡ��ҳ��peerComponent.jsp����addSubPeerComponent.jsp���������peerCompId
       Integer productId = new Integer(request.getParameter("productId"));
       PeerCompMeasureReport pcmr = new PeerCompMeasureReport();
       String code = pcmr.exportMeasureReport(peerCompId);
        response.setHeader("Content-disposition","attachment; filename=peerCompMeasureReport.doc");          
  %>  
 <%=code %>
  
</html>
