<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%><jsp:useBean id="mySend" class="homework.SendTextMail"/>
<jsp:setProperty name="mySend" property="*"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'SendMail1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>


<%
	//注意这里我们通过JavaBean的自省机制完成了对其属性的赋值	
	boolean status = mySend.send();
	if (status){
	  out.println("恭喜您，邮件发送成功！");
	}else{
	  out.println("对不起，邮件发送失败！");
	}
%>
  </body>
</html>
