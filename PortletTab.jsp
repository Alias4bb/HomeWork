<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib uri="http://ajaxtags.sourceforge.net/tags/ajaxtags" prefix="ajax"%>

<html>
  <head>
    <title>Portlet And TabPanel</title>
  </head>
	<script type="text/javascript" src="js/prototype.js"></script>
	<script type="text/javascript" src="js/scriptaculous/scriptaculous.js"></script>
	<script type="text/javascript" src="js/overlibmws/overlibmws.js"></script>
	<script type="text/javascript" src="js/ajaxtags.js"></script>
	
	<link rel="stylesheet" type="text/css" href="css/ajaxtags.css" /> 
		 <link type="text/css"  href="dist/css/bootstrap.min.css" rel="stylesheet">
  <body><div class="container">
  <div class="col-md-6">
 	<h2>Portlet标签示例</h2>
	<hr>

	<div id="portletArea1">
	  <ajax:portlet
	    source="portlet_1"
	    baseUrl="Htmlcontent?shop=HKKB"
	    classNamePrefix="portlet"
	    title="我的第一个小窗口"
	    imageClose="images/close.png"
	    imageMaximize="images/maximize.png"
	    imageMinimize="images/minimize.png"
	    imageRefresh="images/refresh.png"
	    refreshPeriod="5" />
	</div> 
	<br>
    <div id="portletArea2">	    
	  <ajax:portlet
	    source="portlet_2"
	    baseUrl="ServerDate"
	    classNamePrefix="portlet"
	    title="我的第二个小窗口"
	    imageClose="images/close.png"
	    imageMaximize="images/maximize.png"
	    imageMinimize="images/minimize.png"
	    imageRefresh="images/refresh.png"
	    refreshPeriod="1" />
	</div></div><div class="col-md-6">
		<h2>Tab Panel标签示例</h2>
	<hr>

	<div id="tabPanelWrapper">	
	<ajax:tabPanel id="TabPanel_1">
	  <ajax:tab caption="商品一"
	    baseUrl="Htmlcontent?shop=苹果"
	    defaultTab="true"/>
	  <ajax:tab caption="商品二"
	    baseUrl="Htmlcontent"
	    parameters="shop=电脑"/>
	  <ajax:tab caption="商品三"
	    baseUrl="Htmlcontent"
	    parameters="shop=HKKB"/>
	</ajax:tabPanel>	
	</div>	</div>
	</div>
  </body>
</html>
