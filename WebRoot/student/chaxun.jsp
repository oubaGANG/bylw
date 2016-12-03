<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<style type="text/css">

#ck {
	width: 100%;
	height: 450px;
	margin: 0px auto;
	padding-top: 15px;
	background: url(img/77.png) no-repeat;
	background-size: 100% 500px;
	font-size: 18px;
	text-align: center;
}

#ck p {
	font-size: 25px;
	color: red;
	margin-left: -920px;
}

#ck .div2 {
	margin-top: 200px;
	font-size:24px;
}

#ck div {
	height: 60px;
}

#ck textarea {
	vertical-align: top;
}

#ck .div1 {
	text-align: center;
	line-height: 60px;

font-size:24px;
}

.info {
	color: blue;
}
.fontsi{font-size:24px;}
</style>
		<form action="" id="ck">
			<p>
				<font color="#000">当前位置>> </font><span><font color="blue">查询成绩</font></span>
			</p>
			<div class="div1">
				<span>学生姓名:</span>${stu.sname}
			</div>
			<div class="fontsi">
				<span>指导老师评定成绩:</span>
				<c:if test="${empty stu.fen1}">
					<span class="info">信息暂无请耐心等待</span>
				</c:if>
				${stu.fen1} 评价：
				<c:if test="${empty stu.py1}">
					<span class="info">信息暂无请耐心等待</span>
				</c:if>
				${stu.py1}
			</div>
	<div  class="fontsi">
				<span>评阅老师评定成绩:</span>
				<c:if test="${empty stu.fen2}">
					<span class="info">信息暂无请耐心等待</span>
				</c:if>
				${stu.fen2} 评价：
				<c:if test="${empty stu.py2}">
					<span class="info">信息暂无请耐心等待</span>
				</c:if>
				${stu.py2}</div>
				<div  class="fontsi">
					<span>评审老师评定成绩:</span>
					<c:if test="${empty stu.fen3}">
						<span class="info">信息暂无请耐心等待</span>
					</c:if>
					${stu.fen3} 评价：
					<c:if test="${empty stu.py3}">
						<span class="info">信息暂无请耐心等待</span>
					</c:if>
					${stu.py3}
				</div>
				<div class="div1">
					总成绩：
					<c:if test="${empty stu.zf}">
						<span class="info">信息暂无请耐心等待</span>
					</c:if>
					${stu.zf}
				</div>
		</form>
	</body>
</html>