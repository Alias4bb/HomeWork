<%@ page language="java" import="java.util.*,java.sql.*,Utils.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <link type="text/css"  href="dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="dist/js/bootstrap.min.js"></script>
  <script src="jquery.min.js"></script>
  </head>
  
  
  

  <%
	   //装载MySQL5.5的JDBC驱动
	 DBConn c=new DBConn();
	String u_id=(String)session.getAttribute("u_id");
	   String sql = "select * from cart where u_id='"+u_id+"'";
	   ResultSet rs = c.doSelect(sql);	
  %>   
  <body>
    <div align="center"><h2>我的购物车</h2><hr>
    <table  class="table table-bordered table-striped" border="1" width="400">
	     <tr bgcolor="#428bca">
	       <td align="center" width="80">商品名称</td> 
	       <td align="center">商品单价</td>
	       <td align="center" width="100">购买数量</td>
	       <td align="center" width="100">金额</td>
	       <td align="center" width="100">编辑</td>
	     </tr>
	     <%
	       String id,name,price,num,count;
	       while (rs.next()){
	         id = rs.getString("ID");
	         name = rs.getString("SP_NAME");
	         price = rs.getString("SP_PRICE");
	         num = rs.getString("BUY_NUM");
	         count = rs.getString("COUNT");			
	         out.println("<tr>");
	         out.println("<td>"+ name +"</td>");
	         out.println("<td>"+ price +"</td>");
	         out.println("<td><input type=text value="+ num + 
" onChange=\"updateNum('"+id+"',this.value,'"+price+"')\"></td>");
	         out.println("<td>"+ count +"</td>");
	         out.println("<td><a href='buy?op=del&id="+id+"'>退回商品架</a></td>");
	         out.println("</tr>");
	       }
		%>		
	   </table>
	   <br>
	   <a href="index.jsp">继续购物</a>&nbsp;&nbsp;
	   <a href="buy?op=clear">清空购物车</a>	        
  </body>
  <script language="javascript">
    function updateNum(id,num,price){
      var url = "buy?op=update&id="+id+"&num="+num+"&price="+price;
  	window.location = url;
    }
  </script>  


  </body>
</html>
