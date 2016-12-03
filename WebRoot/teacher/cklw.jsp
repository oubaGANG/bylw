<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table id="cklw"></table>
<div id="cx_tool" style="padding:5px;">			
		论文题目：<input type="text" class="textbox" name="lwname" style="width:110px;margin:0 5px">
		学生姓名:<input type="text" class="textbox" name="sname" style="width:110px;margin:0 5px">
		学生学号:<input type="text" class="textbox" name="sid" style="width:110px;margin:0 5px">
		<a class="easyui-linkbutton" iconCls="icon-search" onclick="obj.search();" style='cursor: pointer'>查询</a>	

</div>

<script type="text/javascript" src="js/cklw.js"></script>
</body>
</html>