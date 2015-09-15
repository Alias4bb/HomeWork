<%@ page language="java" import="java.util.Date,Utils.*,java.sql.*,java.text.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";


%>
<jsp:useBean id="myParse" class="Bean.ParseXML"></jsp:useBean>
<%@ page import="org.dom4j.*, java.util.*" %>
<jsp:useBean id="myCreate" class="lesson8.CreateXML"></jsp:useBean>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>XML</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <center>
   <h2>创建个人资料XML文件</h2><hr>
	    <% String id=(String)session.getAttribute("u_id"); 
     String sql="select * from user where u_id='"+id+"'";
     DBConn db=new DBConn();
     ResultSet rs=db.doSelect(sql);
   String name="";
     String pass="";
     String contact="";
     String email="";
 
   
 
     while(rs.next()){
       name=rs.getString("u_name");
      pass=rs.getString("u_pass");
      contact=rs.getString("u_contact");
          email=rs.getString("u_email");
        
    
     }

	   StringBuffer text = new StringBuffer();
	     text.append("<Users>");
	     text.append("<User>");
	     text.append("<LoginName>"+name+"</LoginName>");
	  

	     text.append("<PassWord>"+pass+"</PassWord>");
	      text.append("<E-mail>"+email+"</E-mail>");
	       text.append("<Contact>"+contact+"</Contact>");
	
	     text.append("</User>");
	       
	     text.append("</Users>");
	     //以文本串为内容创建一个XML文档
	     String fileName2 = request.getRealPath("/")+"//mysecond.xml";
	     myCreate.create(fileName2,text.toString());	
	     //取得test.xml文件的绝对物理路径
	
	   %>   <iframe src="mysecond.xml"></iframe>  
	  <h2>读取并解析XML文件</h2><hr>
	   <%
	     //取得test.xml文件的绝对物理路径
	     String fileName = request.getRealPath("//mysecond.xml");
	     //读取XML文件，生成内存中的XML文档
	     myParse.read(fileName);
	     //递归遍历内存中的XML文档
		myParse.treeWalk();
	     //输出解析结果
	     out.println(myParse.getResult());
	   %>  </center> 
</html>
