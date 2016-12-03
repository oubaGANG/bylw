<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'pyls.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="js/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css">
 <link rel="stylesheet" type="text/css" href="css/pyls.css">
    <link rel="stylesheet" type="text/css" href="css/head.css">
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="js/easyui/locale/easyui-lang-zh_CN.js" ></script>
  </head>
   <body class="easyui-layout">
    <div data-options="region:'north',title:'header',split:false,noheader:true" style="height:80px;">
    <div id="head">
    <img src="img/log.png">
    <h3 class="wz">许昌学院毕业论文管理系统</h3>
    <h3 class="py">XuChang XueYuan BiYe LunWen GuanLi XiTong</h3>
    <div id="log"  style="font-size:20px;"><img src="img/lguse.png" style="width:20px;height:20px;float:letf;margin:5x 5px 0px 0px;">您好，${py.pyname}评阅老师 | <a href="outServlet">退出</a></div>
        </div>
</div>
<div data-options="region:'center'" >
<table id="cklw"></table>
<div id="cx_tool" style="padding:5px;">			
		论文题目：<input type="text" class="textbox" name="lwname" style="width:110px;margin:0 5px">
		学生姓名:<input type="text" class="textbox" name="sname" style="width:110px;margin:0 5px">
		学生学号:<input type="text" class="textbox" name="sid" style="width:110px;margin:0 5px">
		<a class="easyui-linkbutton" iconCls="icon-search" onclick="obj.search();" style='cursor: pointer'>查询</a>	

</div>

<script type="text/javascript" src="js/lwpf.js"></script>
</div>
<div data-options="region:'south',title:'footer',split:true,noheader:true" style="height:50px;line-height:40px;text-align:center;background:#ccc;font-size:22px;">
  &copy;信息工程学院13级应本计科专作
</div>

  </body>
</html>
