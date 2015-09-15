<%@ page language="java" import="java.util.*,Bean.BookBean" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <title>结账</title>
    

 <link type="text/css"  href="dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="dist/js/bootstrap.min.js"></script>
  <script src="jquery.min.js"></script>
  </head>
  
  <body>
   <h1 class="text-center">结帐信息</h1>
<table class="table table-hover">
<tr align="center" valign="middle" bgcolor="#CCCCCC">
    <th width="180" scope="col">书名</th>
    <th width="131" scope="col">作者</th>
    <th width="122" scope="col">出版社</th>
    <th width="85" scope="col">价格</th>
    <th width="65" scope="col">数量</th>
</tr>
<% Vector buyList= (Vector)session.getAttribute("shoppingcart");
  for(int i=0;i<buyList.size();i++){
    BookBean aBook=(BookBean)buyList.elementAt(i);
%>
<tr>
    <th width="180" scope="col"><%= aBook.getBook_name()%></th>
    <th width="131" scope="col"><%= aBook.getBook_author()%></th>
    <th width="122" scope="col"><%= aBook.getBook_publisher()%></th>
    <th width="85" scope="col"><%= aBook.getBook_price()%></th>
    <th width="65" scope="col"><%= aBook.getBook_quantity()%></th>
  </tr>
<%}%>
</table>
<h2>总金额为：
<%= session.getAttribute("amount")%></h2>
<form class="form-group" name="form1" method="post" action="shopping.jsp">
  <input type="submit" class="btn btn-primary"name="Submit2" value="继续购物">
</form>
  </body>
</html>
