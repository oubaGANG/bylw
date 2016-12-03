<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'fplw.jsp' starting page</title>
    
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
      <table id="fplw"></table>
   <div id="fptool" style="padding:5px 0px 5px 40px;">	
   <div>		
		论文题目：<input type="text" class="textbox" name="lwname" style="width:110px;margin:0 5px">
		学生学号：<input type="text" class="textbox" name="sid" style="width:110px;margin:0 10px 0 5px">
		学生姓名:<input type="text" class="textbox" name="sname" style="width:110px;margin:0 10px 0 5px">	
		<a class="easyui-linkbutton" iconCls="icon-search" onclick="obj.search();" style='cursor: pointer'>查询</a>	
		<select id="pyname">
<option selected="selected" value="张三">张三</option>
<option value="李四">李四</option>
<option value="王二">王二</option>
</select>
<a class="easyui-linkbutton" iconCls="icon-ok" style="cursor: pointer;margin:0 5px 0 30px" id="ok" onclick="obj4.fplw();">分配论文</a>
</div>
</div>

   <script type="text/javascript" src="js/fplw.js"></script>
  </body>
</html>
