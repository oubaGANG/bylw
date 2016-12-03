<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ct.jsp' starting page</title>
    
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
  		#image{
  			background-image: url(img/2.jpg);
  			
  			width:950px;
  			height:720px;
  			position: relative;
  			margin-left: 100px;
  			font-size:22px;
		font-family: "微软雅黑";
  		}
  		
  		#up{
		position:absolute;
		left:150px;
		top:265px;
		color:blue;
		font-size:22px;
		font-family: "微软雅黑";
		}
		.file{
			
			float:left;
			margin-top: 400px;
			margin-left: 40px;
			font-size:22px;
			padding:5px 10px;
			
		font-family: "微软雅黑";
		}
		.filefl{width:300px;}
		.button{
			float:left;
			margin-top: 570px;
			margin-left: -560px;
				font-size:22px;
		font-family: "微软雅黑";
		}
  	</style>
<div id="image">
 		<div id ="up">&nbsp;&gt;&gt; 论文出题</font></div>
 		<div>
 			<form action ="UpyqServlet" method ="post" enctype="multipart/form-data" >
  		<p class="file">请选择需要上传的文件：</p>
  		<input type="file" name="file" class="file filefl"/>
  		<input type="submit" value="开始上传  " class ="file" id="submit">
  		</form>
 		</div>
 	</div>
   		
  </body>
</html>
