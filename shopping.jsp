<%@ page language="java" import="java.util.*,Utils.*,java.sql.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>网上书店</title>
     <link type="text/css"  href="dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="dist/js/bootstrap.min.js"></script>
  <script src="jquery.min.js"></script>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <%  int pageSize=3;
               int pageNow=1;//当前页面
               int rowCount=0;//信息总条数
               int pageCount=0;//总页数
               //接受用户希望显示页数
               String s_pageNow= request.getParameter("pageNow");
               
               if(s_pageNow!=null){
                 pageNow=Integer.parseInt(s_pageNow);
               }
               
  
  DBConn db=new DBConn();
     String sql="select count(*) from book";
       String sql1="select * from book where book_id limit "+(pageNow-1)*pageSize+","+pageSize+"";
     ResultSet rs=db.doSelect(sql);
     	if(rs.next()){
      			   rowCount= rs.getInt(1);
      			   
      			}
      if(rowCount%pageSize==0){
                    pageCount=rowCount/pageSize;
                }else{
                     pageCount=rowCount/pageSize+1;
                }
      rs=db.doSelect(sql1);
   %>
  <body>
  <center>
  <h1 align="center">网上书店</h1>
  <table  class="table table-hover table-bordered" width="706" border="0">
    <tr align="center" valign="middle" bgcolor="#CCCCCC">
        <th  scope="col">书名</th>
        <th  scope="col">作者</th>
        <th  scope="col">出版社</th>
    <th  scope="col">价格</th>
    <th  scope="col">库存</th>
        <th  scope="col">数量</th>
        <th  scope="col">&nbsp;</th>
    </tr>  <%while(rs.next()){ %>
    <form name="shoppingForm" method="post" action="ShoppingServlet">
      <tr align="center" valign="middle">
            <td><%=rs.getString("book_name")%></td>
            <td> <%=rs.getString("book_author")%></td>
            <td><%=rs.getString("book_publisher")%></td>
            <td><%=rs.getString("book_price")%></td> 
             <td><%=rs.getString("book_count")%></td> 
            <td><input type="text" name="quantity" value="1" size="3"></td> 
            <td><input type="submit" class="btn btn-default"name="Submit" value="购买"></td>    
       </tr>
        <input type="hidden" name="name" value="<%=rs.getString("book_name")%>">
        <input type="hidden" name="author" value="<%=rs.getString("book_author")%>">
        <input type="hidden" name="publisher" value="<%=rs.getString("book_publisher")%>">
        <input type="hidden" name="price" value="<%=rs.getString("book_price")%>">
        <input type="hidden" name="action" value="ADD">
        <input type="hidden" name="pageNow" value="<%=s_pageNow%>">
     </form>
     <%} %>
    </table><ul class="pagination">

  <%
			   //显示超链接
			   
			   //上一页
			   if(pageNow!=1)
			   out.println("<li><a href= shopping.jsp?pageNow="+(pageNow-1)+">&laquo;</a></li>");
			   
			   
			   for(int i=1;i<=pageCount;i++){
			      out.println("<li><a href= shopping.jsp?pageNow="+i+">"+i+"</a></li>");
			   
			   
			   }
			   
			    //下一页
			    if(pageNow!=pageCount)
			   out.println("<li><a href= shopping.jsp?pageNow="+(pageNow+1)+">&raquo;</li>");
			    %>   

</ul>
   
    <form name="checkoutForm" method="post" action="ShoppingServlet">
      <input type="submit" class="btn btn-default"name="submit" value="结帐">
     
      <input type="hidden" name="action" value="CHECKOUT">
    </form>
   <center>
  </body>
</html>
