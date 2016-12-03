<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'student.jsp' starting page</title>
    
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
    <link rel="stylesheet" type="text/css" href="css/head.css">
        <link rel="stylesheet" type="text/css" href="css/manager.css">
    <script type="text/javascript" src="js/jquery.js"></script>
     <script type="text/javascript" src="js/manager.js"></script>
    <script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="js/easyui/locale/easyui-lang-zh_CN.js" ></script>
  </head>
  <body class="easyui-layout">

<div data-options="region:'north',title:'header',split:false,noheader:true" style="height:80px;">
    <div id="head">
    <img src="img/log.png">
    <h3 class="wz">许昌学院毕业论文管理系统</h3>
    <h3 class="py">XuChang XueYuan BiYe LunWen GuanLi XiTong</h3>
    <div id="log" style="font-size:20px;"><img src="img/lguse.png" style="width:20px;height:20px;float:letf;margin:5x 5px 0px 0px;">您好，管理员 | <a href="outServlet">退出</a></div>
        </div>
</div>
<div data-options="region:'south',title:'footer',split:true,noheader:true" style="height:50px;line-height:40px;text-align:center;background:#ccc;font-size:22px;">
  &copy;信息工程学院13级应本计科专作
</div>
<div data-options="region:'west',title:'导航',split:false,iconCls:'icon-world'" style="width:160px;padding:10px;">
<ul class="easyui-tree" data-options="animate:true,lines:true" id="nav">
<li>
    <span>功能模块</span>
    <ul style="padding:4px;">
	<li><span style="font-size:18px;">论文信息管理</span></li>
	<li><span style="font-size:18px;">导师信息管理</span></li>
	<li><span style="font-size:18px;">学生信息管理</span></li>
	<li><span style="font-size:18px;">分配学生论文</span></li>
	<li><span style="font-size:18px;">设置结束时间</span></li>
	<li><span style="font-size:18px;">成绩评定</span></li>
	</ul>
</li>
</ul>
</div>
<div data-options="region:'center'" style="overflow:hidden;">
    <div id="tabs" style="background:blue;">
     <div title="起始页" iconCls="icon-home" style="background:url(img/qsy.jpg) no-repeat; background-size:1200px 500px; padding:0 10px; font-size:20px;font-family:"微软雅黑";>
          <br><center><font size='6'>欢迎管理员来到论文管理系统！</center> 
        </div>
    </div>
</div>
</body>
</html>
