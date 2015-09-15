<%@ page language="java" import="java.util.*,java.sql.*,Utils.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <base href="<%=basePath%>">
 
        <title>购物车</title>
 
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
        <meta http-equiv="description" content="This is my page">
  <link type="text/css"  href="dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="dist/js/bootstrap.min.js"></script>
  <script src="jquery.min.js"></script>
		<% DBConn co=new DBConn();
    String sql="select * from shop";
ResultSet rs= co.doSelect(sql);
%>
  <body>
    <div align="center"><h2>在线购物</h2><hr>
    <table  class="table table-bordered table-striped" border="1" width="400">
      <tr bgcolor="#428bca">
        <td align="center" width="80">商品缩图</td>
        <td align="center">商品摘要</td>
        <td align="center" width="100">在线购买</td>
	     </tr>
<% 
	       String bm,name,price,info,img;
	       //将查询结果集中的记录输出到页面上
	       while (rs.next()){
	         //从当前记录中读取各字段的值
	         img = rs.getString("SP_PIC");
	         bm = rs.getString("SP_NO");
	         name = rs.getString("SP_NAME");
	         price = rs.getString("SP_PRICE");
	         info = rs.getString("SP_INFO");
	         out.println("<tr>");
	         out.println("<td><img src='"+ img +"' border=0 height=150 width=150></td>");
	         out.println("<td>");
	         out.println("商品编号："+ bm +"<br>");
	         out.println("商品名称："+ name +"<br>");
	         out.println("商品价格："+ price +"元<br>");
	         out.println("商品简介："+ info +"<br>");
	         out.println("</td>");
	         out.println("<td><a href='buy?op=add&bm="+bm+"'>放入购物车</a></td>");
	         out.println("</tr>");
	       }
		%>		
	   </table>
	   <br>
	  <a href="cart.jsp">查看购物车</a>&nbsp;&nbsp;
	   <a href="buy?op=clear">清空购物车</a>	       </div>
  </body>
</html>