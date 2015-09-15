<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="com.jspsmart.upload.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'download_do.jsp' starting page</title>
    
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
	// 新建一个SmartUpload对象,此项是必须的
	SmartUpload myupload = new SmartUpload();
	myupload.initialize(pageContext); 	// 初始化,此项是必须的
	String op = request.getParameter("op");// 取得请求参数
	try{			
		// 设定contentDisposition为null以禁止浏览器自动打开文件，
		myupload.setContentDisposition(null);
		// 下载文件
		if (op.equals("en")){
			myupload.downloadFile("/WEB-INF/web.xml");
		}else{
			// 解决下载文件的中文问题
			String descFileName = "Web应用配置文件.xml";
			byte[] b = descFileName.getBytes();
			char[] c = new char[b.length];
			for (int x = 0; x < b.length; x++)c[x] = (char) (b[x] & 0x00FF);
			descFileName = new String(c);
			myupload.downloadFile("/WEB-INF/web.xml","text/xml",descFileName);
		}
	}catch(Exception ex){
		System.out.println("下载文件失败!<br>");
		out.println("下载文件失败!<br>");
		out.println("错误原因：<br>"+ex.toString());
	}
%>
  </body>
</html>
