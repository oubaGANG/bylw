<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body bg="red">
<style type="text/css">
  		#image{
  			background-image:#333 url(img/2.jpg);
 
  			width:950px;
  			height:720px;		
	position: relative;
  			margin-left: 100px;
  		}
  		
  		#up{
		position:absolute;
		left:150px;
		top:260px;
		color:blue;
		font-size:24px;
		line-height:32px;
		}
		.file{
			
			float:left;
			margin-top: 400px;
			margin-left: 40px;
		}
		.button{
			float:left;
			margin-top: 570px;
			margin-left: -560px;
		}
  	</style>
<div id="image">
 		<div id ="up">&nbsp;&gt;&gt; 开题报告上传</div>
 		<div>
 			<form action ="UpbgServlet" method ="post" enctype="multipart/form-data" >
  		<p class="file">请选择需要上传的文件：</p>
  		<input type="file" name="file" class="file"/>
  		<input type="submit" value="开始上传  " class ="file" id="submit">
  		</form>
 		</div>
 	</div>

</body>
</html>