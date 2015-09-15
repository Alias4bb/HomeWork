<%@ page language="java" import="java.util.*,Utils.*,java.sql.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <% DBConn db=new DBConn();
     String sql="select count(*) from photo";
     int count=0;
    ResultSet rs=db.doSelect(sql);
     if(rs.next()){
     count=rs.getInt(1);
     }
    %>
    <title>电子相册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script language="javascript">
var xmlHttp; //定义一个变量用于存放XMLHttpRequest对象
var selected=0;//当前相片号
function createXMLHttpRequest() {//创建一个XMLHttpRequest对象
	 if (window.ActiveXObject) 
	   xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	 else if (window.XMLHttpRequest) 
	   xmlHttp = new XMLHttpRequest();
}
function getPhoto(){//通过AJAX获取相片
    createXMLHttpRequest();//创建一个XMLHttpRequest对象
    xmlHttp.onreadystatechange = processor; //将状态触发器绑定到一个函数
    xmlHttp.open("GET", "GetPhoto?selected="+selected); //建立对服务器的调用
    xmlHttp.send(null); //发送请求
}

function processor() {//处理从服务器返回的结果
	 if(xmlHttp.readyState == 4) { //如果响应完成
	   if(xmlHttp.status == 200) {//如果返回成功
	     document.all.photo.src = "upload/"+xmlHttp.responseText; //更新相片文件
	   }
	 }
}
function prev(){//响应“上一张”
	 selected = (selected-1+<%=count%>)%<%=count%>;
	 getPhoto();
	
}
function next(){//响应“下一张” 
	 selected = (selected+1+<%=count%>)%<%=count%>;
	 getPhoto();
	
}
  
</script>	
<script src="jquery.min.js"></script>
  <script src="dist/js/bootstrap.min.js"></script>
 <link type="text/css"  href="dist/css/bootstrap.min.css" rel="stylesheet">
  </head>
  
  <body>
   <div class="container">
   	<div class="row"><div class="col-md-8 col-md-offset-2">
    <TABLE  class="table" border="0" bgcolor="#c0c0c0" width="300px" height="300px">
      <TR><TD colspan="2" align="center"><h2>电子相册</h2></TD></TR>
      <TR><TD colspan="2" align="center"><img id="photo" class=" img-rounded" width="250px" height="250x" src="upload/20150422170254940.jpg" /></TR>
      <TR><TD align="center"><span onmouseover="prev()" style="cursor:hand;">
                        <button class="btn btn-primary">上一张</button></span></TD>
                <TD align="center"><span onmouseover="next()" style="cursor:hand;">
                        <button class="btn btn-primary">下一张</button></span></TD>
      </TR>
    </TABLE></div></div></div>
  </body>
</html>
