<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ktbg.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
 <table id="ckbg"></table>
<div id="tool1" style="padding:5px;">			
		报告题目：<input type="text" class="textbox" name="lwname" style="width:110px;margin:0 5px">
		学生姓名:<input type="text" class="textbox" name="sname" style="width:110px;margin:0 5px">
		学生学号:<input type="text" class="textbox" name="sid" style="width:110px;margin:0 5px">
		<a class="easyui-linkbutton" iconCls="icon-search" onclick="obj.search();" style='cursor: pointer'>查询</a>	

</div>
<div id="box">
	
</div>
<script type="text/javascript" src="js/ckbg.js"></script>
  </body>
</html>
