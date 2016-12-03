<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    <style type="text/css">
    body{
    background:url(img/bgIndex.jpg);
    }
 #banner ul{
 
 	float:left;
 
 	top:50px;
 	}
    </style>
    
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
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <link rel="stylesheet" type="text/css" href="css/lp.css">
    <link rel="stylesheet" type="text/css" href="css/head.css">
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="js/easyui/locale/easyui-lang-zh_CN.js" ></script>
    <script type="text/javascript" src="js/login.js"></script>
    <script type="text/javascript" src="js/lp.js"></script>
  </head>
  
  <body>
    <div id="head" style="width:90%;margin:0 auto;">
    <img src="img/log.png">
    <h3 class="wz">许昌学院毕业论文管理系统</h3>
    <h3 class="py">XuChang XueYuan BiYe LunWen GuanLi XiTong</h3>
    <div id="log" class="dlk">
      <span ><img src="img/lguse.png" style="width:20px;height:20px;float:letf;margin:5x 5px 0px 0px;">点击登录</span>
    </div>
</div>
<!--登录-->
<div id="login">
    <form id="regist" action="">
    <span id="error"></span>
    <p>账号：<input type="text" id="manager" class="textbox txt1" name="sid"></p>
    <p>密码：<input type="password" id="password" class="textbox txt2" name="spass"></p>
    <p>请选择身份:<select class="sf" name='sf'>
    <option selected="selected" value="student">学生</option>
    <option value="teacher">指导老师</option>
    <option value="pyls">评阅老师</option>
    <option value="psls">评审老师</option>
    <option value="manager">管理员</option>
    </select></p>
       <input type="button" class="submit" value="" />
        </form>
</div>

<div id="center" >
 <!--   轮播-->
    <div id="banner" style="width:90%;height:250px;">
        <img src="img/b1.jpg" alt=""  style="height:250px;" />
        <img src="img/b2.jpg" alt=""  style="height:250px;" />
        <img src="img/b3.jpg" alt="" style="height:250px;"  />
        <ul style="float:left;height:40px;	position:relative;top:210px;left:45%;">
            <li>●</li>
            <li>●</li>
            <li>●</li>
        </ul>
    
    </div>
    <div id="info" style="width:98%;margin-left:60px;">
    <div id="box1" class="boxx">
    	<ul class="info">
    	<li class="jiaoshi"><a>论文题目已经发布请同学们登陆查看     <span>2016-4-18</span></a></li>
    	<li class="jiaoshi"><a>论文选好的同学，可以提交开题报告    <span>2016-4-26</span></a></li>
    	<li class="jiaoshi"><a>开题报告指导老师已经开始审批了   <span>2016-5-02</span></a></li>
    	<li class="jiaoshi"><a>开题报告通过的同学，可以写论文了   <span>2016-5-03</span></a></li>
    	<li class="jiaoshi"><a>同学么可以查看自己的论文是否通过  <span>2016-5-20</span></a></li>
    	<li class="jiaoshi"><a>青春不散场，恭喜论文通过的同学   <span>2016-5-21</span></a></li>
    	</ul>
    </div>
        <div id="box2" class="boxx">
        	<ul class="info ">
    	<li class="jiaoshi"><a>曾宪权教授</a></li>
    	<li  class="jiaoshi"><a>李梅莲教授</a></li>
    	<li  class="jiaoshi"><a>张一品教授</a></li>
    	<li  class="jiaoshi"><a>朱贵良教授</a></li>
    	<li  class="jiaoshi"><a>徐尽教授</a></li>
    	<li  class="jiaoshi"><a>马慧教授</a></li>
    	<li  class="jiaoshi"><a>王爽讲师</a></li>
    	</ul>
        </div>
        <div id="box3" class="boxx">
         	<ul class="info">
    	<li class="jiaoshi"><a>高校毕业论文系统</a></li>
    	<li class="jiaoshi"><a>基于ASP.NET在线点歌系统</a></li>
    	<li class="jiaoshi"><a>应用UML小型超市综合管理系统</a></li>
    	<li class="jiaoshi"><a>基于UML图书馆管理系统设计</a></li>
    	<li class="jiaoshi"><a>JAVA语言考试系统的设计与实现</a></li>
    	<li class="jiaoshi"><a>基于.NET的酒店预订信息管理系统的设计</a></li>
    	<li class="jiaoshi"><a>高校社团管理系统</a></li>
    	</ul>
        </div>
    </div>
</div>  </body>
</html>
