<%@ page language="java" import="java.util.*,Utils.*,java.sql.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%String id=(String)session.getAttribute("u_id");
  String sql="select u_headimage from user where u_id='"+id+"'";
  DBConn db=new DBConn();
  ResultSet rs=db.doSelect(sql);
  String image="";
  if(rs.next()){
   image=rs.getString("u_headimage");
   }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>主页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="jquery.min.js"></script>
 
 <link type="text/css"  href="dist/css/bootstrap.min.css" rel="stylesheet">
 <link type="text/css"  href="sweetalert-master/lib/sweet-alert.css" rel="stylesheet">
  <link type="text/css"  href="Main.css" rel="stylesheet">
 <script src="dist/js/bootstrap.min.js"></script>
 <script src="sweetalert-master/lib/sweet-alert.min.js"></script>
 <script type="text/javascript"> $(function () 
      { if(<%=id%>==null){window.location.href="login.html";}  //未登陆没有权限访问该页面
      document.links[3].target="icontent";
      document.links[4].target="icontent";
       document.links[5].target="icontent";
       for(var i=7;i<document.links.length;i++){
               document.links[i].target="icontent";

       } });

 </script>
 </head>			
 <body class="post-template page-template page">
<div class="navbar navbar-tabs  navbar-fixed-top navbar-inverse " >
<div class="container">
   <div class="navbar-header">
      <a class="navbar-brand " >Alias's Universe</a>
   </div>
   <div>
      <ul class="nav navbar-nav ">
          <li class="active"><a href="Main.jsp">主页</a></li>
         <li class="dropdown">
             <a class="dropdown-toggle" data-toggle="dropdown">个人信息<span class="caret"></span></a>
              <ul class="dropdown-menu">
                
                 <li class="active"><a tabindex="-1" href="http://www.github.com/Alias4bb">Github</a></li>
                 <li><a tabindex="-1" href="http://www.weibo.com/Alias21">微博</a></li>
              </ul>

         </li>
         <li><a href="myprofile.html">关于</a></li>
     
      </ul>
   </div>

<ul class="nav navbar-nav navbar-right">
         <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown">
             <img src="head/<%=image%>" class="img-circle" alt="" width="25px" height="25px"/>  <span class="name"><%=session.getAttribute("name") %><span class="caret"></span></span> 
            </a>
            <ul class="dropdown-menu">
               <li><a href="my.jsp""><i class="glyphicon glyphicon-user"></i>  我的主页</a></li>
               <li><a href="myhomepage.jsp"><i class="glyphicon glyphicon-asterisk"></i> 设置</a></li>
                <li><a href="logout?clear=true"><i class="glyphicon glyphicon-log-out"></i>  退出</a></li>
            </ul>
         </li>
      </ul>
 
</div></div>
<header class="jumbotron subhead">
<div class="container">
<h1> J2EE HomeWork
</h1>
<p class="lead">以下为J2EE课程作业(有的作业集成在某些模块中了)</p>
</div>
</header> 
<div class="container">
  
<div class="row">
        <div class="col-sm-3 " >
        <div class="bc-sidebar " id="toc">
            <ul class="nav nav-pills nav-stacked">
                <li class="toc-active toc-h2 "><a href="readXML.jsp">XML</a></li>
                <li class="toc-h2"><a href="test.html"><i class="icon-chevron-right"></i>绘制表格</a></li>
                <li class="toc-h2"><a href="upload.html">上传照片</a></li>
                <li class="toc-h2"><a href="Caculator.jsp">计算器</a></li>
                <li class="toc-h2"><a href="index.jsp">网上购物</a></li>
                 <li class="toc-h2"><a href="photo.jsp">电子相册</a></li>
                  <li class="toc-h2"><a href="counter.html">页面局部刷新</a></li>
                   <li class="toc-h2"><a href="index2.html">动态下拉</a></li>
                    <li class="toc-h2"><a href="toolTip.html">工具提示</a></li>
                    <li class="toc-h2"><a href="search.html">访问Web服务</a></li>
                   <li ><a href="textMail.html">邮件发送</a></li> 
                   <li ><a href="shopping.jsp">网上书店</a></li>
                   <li ><a href="PortletTab.jsp">Portlet和TabPanel</a></li>
            </ul></div>
        </div>




<div class="col-sm-9">

<div class="panel panel-default panel-primary x">
 <div class="panel-heading">
    <h3 class="panel-title"><strong>J2EE</strong></h3>
  </div>
   <div class="panel-body">
<iframe src="" id="icontent" name="icontent" frameborder="0"></iframe>
   </div>
</div>

</div>
</div></div>
<footer class="footer">
<div class="row footer-top"></div>
<hr>
<div class="row footer-bottom">
<ul class="list-inline text-center"><li>&copy;Alias不会写Shell</li>
<li>--来自异世界的程序员</li>
</ul></div>

</footer>
 </body>	
</html>

