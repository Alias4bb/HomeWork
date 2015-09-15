<%@ page language="java" import="java.util.*,Utils.*,java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'myhomepage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <%String id=(String)session.getAttribute("u_id");
  String sql="select u_headimage from user where u_id='"+id+"'";
  DBConn db=new DBConn();
  ResultSet rs=db.doSelect(sql);
  String image="";
  if(rs.next()){
   image=rs.getString("u_headimage");
   }
%>
 
<script src="jquery.min.js"></script>
 
 <link type="text/css"  href="dist/css/bootstrap.min.css" rel="stylesheet">
 <link type="text/css"  href="sweetalert-master/lib/sweet-alert.css" rel="stylesheet">
  <link type="text/css"  href="Main.css" rel="stylesheet">
 <script src="dist/js/bootstrap.min.js"></script>
 <script src="sweetalert-master/lib/sweet-alert.min.js"></script>
  </head>
 
  <body>
     <div class="container">
     <div class="row">
     <div class="col-md-5">
        <header class="page-header">
<h2>
<i class="glyphicon glyphicon-user"></i>
个人信息
</h2>
</header>
<form action="UpdateUser" class="form-horizontal" method="post" enctype="multipart/form-data">
  <div class="form-group "><label class="control-label col-sm-3">昵称</label>
   <div class="col-sm-8"><input class="form-control col-sm-4" type="text" size="20" maxlength="20"  placeholder="请输入您的姓名" name="name" required="required"/></div></div>
<div class="form-group "><label class="control-label col-sm-3">头像</label>
 <div class="col-sm-8"><img class="img-circle" width="80" height="80" src="head/<%=image %>"><input class="form-control file" type="file" id="file" name="file"/></div></div>

<div class="form-group "><label class="control-label col-sm-3">地区</label> <div class="col-sm-8"><input class="form-control" type="text"  name="area"/></div></div>
<div class="form-group "><label class="control-label col-sm-3">个人网站</label> <div class="col-sm-8"><input class="form-control" type="text" name="website"/></div></div>
<div class="form-group "><label class="control-label col-sm-3">自我描述</label> <div class="col-sm-8"><textarea name="description" class=" form-control"  placeholder="140 个字以内" maxlength="140" rows="5">爱贝贝~~</textarea></div></div>
<div class="form-group"><div class="col-sm-4"><input class="btn btn-default btn btn-primary" type="submit" value="保存" name="commit"></div></div>
</form>
     </div>
     </div>
     </div>
  </body>
</html>
