<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'show.jsp' starting page</title>
    
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
       <style type="text/css">
  * {
	margin: 0 auto;
	padding: 0px;
}

form {
	width: 620px;
	font-size: 16px;
	font-family: "微软雅黑";
}

#lsgrzx  ul {
	list-style: none;
	line-height: 35px;
	margin-top: 20px;
}

#lsgrzx  .u1 {
	float: left;
	width: 100px;
}

#lsgrzx  .u2 {
	float: left;
}

#lsgrzx  .u2 li {
	float: left;
	clear: both;
	width: 300px;
	height: 35px;
	border-left: none;
}

#lsgrzx li {
	float: none;
	border: 1px solid #333;
}

#lsgrzx  div {
	width: 200px;
	height: 200px;
	border: 2px solid #333;
	border-left: 1px solid #333;
	float: left;
	margin-top: 20px;
}
</style>
	<form name="lsgrzx" id="lsgrzx">

					<center>
						<ul class="u1">
							<li>
								工号
							</li>
							<li>
								姓名
							</li>
							<li>
								性别
							</li>
							<li>
								联系电话
							</li>
							<li>
								E-mail地址
							</li>
							<li>
								系（所）
							</li>
							<li>
								学历
							</li>
							<li>
								学位
							</li>
							<li>
								职称
							</li>
							<li>
								学科方向
							</li>
							<li>
								教师简介
							</li>
							<li>
								备注
							</li>
						</ul>
						<ul class="u2">
							<li>
								${teacher.tid}
							</li>
							<li>
								${teacher.tname}
							</li>
							<li>
								${teacher.tgender}
							</li>
							<li>
								${teacher.tel}
							</li>
							<li>
								${teacher.yx}
							</li>
							<li>
								${teacher.tdepart}
							</li>
							<li>
								${teacher.xueli}
							</li>
							<li>
								${teacher.xuewei}
							</li>
							<li>
								${teacher.zhicheng}
							</li>
							<li>
								${teacher.xkfx}
							</li>
							<li>
								${teacher.jj}
							</li>
							<li>
								${teacher.tname}
							</li>
						</ul>
						<div
							style="background: url(img/gr.png) 20px 30px no-repeat; background-size: 150px;">
							暂无照片。。。
						</div>
					</center>
				</form>
  </body>
</html>
