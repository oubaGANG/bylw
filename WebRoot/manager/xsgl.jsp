<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'xsgl.jsp' starting page</title>
    
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
   <table id="xs"></table>
   <div id="cx_tool" style="padding:5px 0px 5px 40px;">	
   <div>		
		学生学号：<input type="text" class="textbox" name="sid" style="width:110px;margin:0 10px 0 5px">
		学生姓名:<input type="text" class="textbox" name="sname" style="width:110px;margin:0 10px 0 5px">
		
		<a class="easyui-linkbutton" iconCls="icon-search" onclick="obj.search();" style='cursor: pointer'>查询</a>	
<div style="margin:10px 0 10px 40px">
<a class="easyui-linkbutton" iconCls="icon-add" style="margin:0 5px;cursor: pointer" onclick="obj.add();">添加</a>
<a class="easyui-linkbutton" iconCls="icon-edit" style="margin:0 5px;cursor: pointer" onclick="obj.edit();">修改</a>
<a class="easyui-linkbutton" iconCls="icon-remove" style="margin:0 5px;cursor: pointer" onclick="obj.del();">删除</a>
<a class="easyui-linkbutton" iconCls="icon-save" style="margin:0 10px 0 50px;display:none;cursor: pointer" id="save" onclick="obj.save();">保存</a>
<a class="easyui-linkbutton" iconCls="icon-redo" style="display:none;cursor: pointer" id="redo" onclick="obj.redo();">取消编辑</a>	
</div>
</div>
</div>

   <script type="text/javascript" src="js/xsgl.js"></script>
  </body>
</html>
