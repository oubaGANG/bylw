<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'person.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	</head>
	<style type="text/css">
* {
		font-family: "微软雅黑";
}
</style>
	<body>

		<div id="tabs" class="easyui-tabs"
			data-options="fit:true,tabPosition:'left'">
			<div title="详细信息"
				style="background: url(img/9.jpg) -20px -10px; background-size: 1050px 500px;">
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
								${tea.tid}
							</li>
							<li>
								${tea.tname}
							</li>
							<li>
								${tea.tgender}
							</li>
							<li>
								${tea.tel}
							</li>
							<li>
								${tea.yx}
							</li>
							<li>
								${tea.tdepart}
							</li>
							<li>
								${tea.xueli}
							</li>
							<li>
								${tea.xuewei}
							</li>
							<li>
								${tea.zhicheng}
							</li>
							<li>
								${tea.xkfx}
							</li>
							<li>
								${tea.jj}
							</li>
							<li>
								${tea.tname}
							</li>
						</ul>
						<div
							style="background: url(img/gr.png) 20px 30px no-repeat; background-size: 150px;">
							暂无照片。。。
						</div>
					</center>
				</form>
			</div>
			<div title="修改密码"
				style="background: url(img/9.jpg) -20px -10px; background-size: 1050px 500px;">
				<style type="text/css">
#gaimm {
	margin: 50px auto;
	font-size: 22px;
	border: 1px solid #999;
	width: 400px;
	height:180px;
	font-family: "微软雅黑";
	padding-top:30px;
	line-height:80px;
}
#gaimm .ipt{height:23px;}
#link {

		font-family: "微软雅黑";
		padding:5px 10px;
		font-size: 22px;
		margin-top:10px;
}

#link:hover {
	color: red;
}

p {
	text-align: center;
	line-height: 35px;
}
</style>
				</head>

				<body>
					<form id="gaimm" name="fr" method="post">

						<p>
							输入原密码：
							<input class="ipt" type="password" name="ymm" id="ymm">
						</p>
						<p>
							输入新密码：
							<input  class="ipt" type="password" name="xmm" id="xmm">
						</p>
						<p>
							确认新密码：
							<input  class="ipt" type="password" name="qrmm" id="qrmm">
						</p>
						<p>
							<input type="button" id="link" value="确定修改">
						</p>
					</form>
					<script>
	$(function(){
	   $('#ymm').validatebox({
        required : true,
        validType : 'length[6,10]',
        missingMessage : '请输入密码',
    });
      $('#xmm').validatebox({
        required : true,
        validType : 'length[6,10]',
        missingMessage : '请输入新密码',
    });
      $('#qrmm').validatebox({
        required : true,
        validType : 'length[6,10]',
        missingMessage : '请再次输入密码',
    });
     if (!$('#ymm').validatebox('isValid')) {
        $('#ymm').focus();
    } else if (!$('#xmm').validatebox('isValid')) {
        $('#xmm').focus();
    }else if (!$('#qrmm').validatebox('isValid')) {
        $('#qrmm').focus();
    }
		$('#link').click(function(){
		var xmm=$('#xmm').val()
			var qrmm=$('#qrmm').val()
			if(xmm!=qrmm){
			$.messager.alert('警告！', '两次密码输入不同，请重新输入！', 'warning');
				$('#xmm').val("");
   				$('#qrmm').val("");
			return false;
			}
		 if (!$('#ymm').validatebox('isValid')) {
        $('#ymm').focus();
    } else if (!$('#xmm').validatebox('isValid')) {
        $('#xmm').focus();
    }else if (!$('#qrmm').validatebox('isValid')) {
        $('#qrmm').focus();
    }
    		else{
			    $.ajax({
   			type : 'POST',
   			url : 'dsczServlet',
   			data : $('#gaimm').serialize(),
   			success : function (response, status, xhr) {
   				if(response!=""){
   				$.messager.alert('警告！', '原密码输入不正确！！！', 'warning')
   				$('#ymm').val("");
   				}
   				else{$.messager.alert('消息！', '恭喜修改密码成功！', 'info')	
   				$('#ymm').val("");
   				$('#xmm').val("");
   				$('#qrmm').val("");
   				}
   				
   			}
   		
   			})
			}
		})
	})
</script>
			</div>
		</div>
	</body>
</html>