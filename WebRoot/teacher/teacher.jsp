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
    <link rel="stylesheet" type="text/css" href="css/teacher.css">
    <link rel="stylesheet" type="text/css" href="css/head.css">
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/teacher.js"></script>
    <script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="js/easyui/locale/easyui-lang-zh_CN.js" ></script>
  </head>
  <body class="easyui-layout">

<div data-options="region:'north',title:'header',split:false,noheader:true" style="height:80px;">
    <div id="head">
    <img src="img/log.png">
    <h3 class="wz">许昌学院毕业论文管理系统</h3>
    <h3 class="py">XuChang XueYuan BiYe LunWen GuanLi XiTong</h3>
    <div id="log" style="font-size:20px;"><img src="img/lguse.png" style="width:20px;height:20px;float:letf;margin:5x 5px 0px 0px;">您好，${tea.tname}指导老师 | <a href="outServlet">退出</a></div>
        </div>
</div>
<div data-options="region:'south',title:'footer',split:true,noheader:true" style="height:50px;line-height:35px;text-align:center;background:#ccc;font-size:22px;">
  &copy;信息工程学院13级应本计科专作
</div>
<div data-options="region:'west',title:'导航',split:false,iconCls:'icon-world'" style="width:120px;padding:10px;">
<ul id="nav">
    <li class="t1">
        <h3></h3>
        <p>个人中心</p>
        <span>person</span>
    </li>
    <li class="t2">
        <h3></h3>
        <p>出题要求</p>
        <span>ctyq</span>
    </li>
    <li class="t3">
        <h3></h3>
        <p>出题</p>
        <span>ct</span>
    </li>
       <li class="t4">
        <h3></h3>
        <p>查看开题报告</p>
        <span>ktbg</span>
    </li>
    <li class="t4">
        <h3></h3>
        <p>查看论文</p>
        <span>cklw</span>
    </li>

</ul>

</div>
<div data-options="region:'center'" style="overflow:hidden;">
    <div id="tabs">
        <div title="起始页" iconCls="icon-home" style="background:url(img/qsy.jpg) no-repeat; background-size:1200px 500px; padding:0 10px; font-size:20px;font-family:"微软雅黑";>
          <br> <center><font size='6'>欢迎指导老师来到论文管理系统！</center> 
        </div>
    </div>
</div>
</body>
</html>
