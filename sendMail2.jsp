<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="mySend" class="homework.SendHtmlMail"/>
<jsp:setProperty name="mySend" property="*"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'sendMail2.jsp' starting page</title>
    
	<meta http-equiv="content-type" content="text/html; charset=utf-8">

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
