<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>计算器</title>
    
	<link type="text/css"  href="dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="dist/js/bootstrap.min.js"></script>
  <script src="jquery.min.js"></script>
<script>


//该函数用于创建一个XMLHttpRequest对象
function createXMLHttpRequest() {
   if (window.ActiveXObject) 
     xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
   else if (window.XMLHttpRequest) 
     xmlHttp = new XMLHttpRequest();
}
//这是一个启动AJAX异步通信的方法
function show(){
var first=document.getElementById("first").value;
var second=document.getElementById("second").value;
var select=document.getElementById("select").value;
   createXMLHttpRequest();//创建一个XMLHttpRequest对象
   xmlHttp.onreadystatechange = processor; //将状态触发器绑定到一个函数
   //通过GET方法向指定的URL建立服务器的调用
   xmlHttp.open("GET", "caculator?first="+first+"&second="+second+"&select="+select);
   xmlHttp.send(null); //发送请求
}
//这是一用来处理状态改变的函数
function processor () {
   //定义一个变量用于存放从服务器返回的响应结果
   var responseContext;
   if(xmlHttp.readyState == 4) { //如果响应完成
     if(xmlHttp.status == 200) {//如果返回成功
       //取出服务器的响应内容
       responseContext = xmlHttp.responseText;
       //如果注册名检查有效
      document.getElementById("span").innerHTML=responseContext;
         //显示注册用户名已被注册！更改那个div的属性为show
     }
   }
}

   </script>
  </head>
  
  <body><div class="container"><div class="row"><div class="col-md-4 col-md-offset-4"><h1>计算器</h1>
   <label class=" control-label">第一个数</label><input type=" text" name="first" id="first" class="form-control"/></br>
   <label class=" control-label">第二个数</label><input type="text" name="second" id="second" class="form-control"/></br>
  <label class=" control-label">运算符 </label><select name="select" id="select" class="form-control">
   <option value="1">+</option>
   <option value="2">-</option>
   <option value="3">*</option>
   <option value="4">/</option>
   </select>
   </br>
  <button onclick="show()" class="btn btn-block btn-primary">计算</button><br/>
  <label class=" control-label">你的计算结果：</label><span  id="span" class="label label-default label-success"></span></div></div></div>
  </body>
</html>
