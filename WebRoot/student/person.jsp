<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
<body>
<style type="text/css">
.gb{background:url(img/9.jpg) -20px -10px;background-size:1050px 500px;}
</style>
<div id="tabs" class="easyui-tabs" data-options="fit:true,tabPosition:'left'">
        <div title="详细信息"  class="gb">
        <style type="text/css">
        table{margin:30px auto;font-size:16px;border:1px solid #999}
       td{padding:10px;border:1px solid #999}
       .tttt{font-size:18px; font-family:"微软雅黑"; line-height:30px;}
       .info{color:blue}
        </style>
       <table width="462" border="0" cellspacing="0" cellpadding="0" class="tttt">
  <tr>
    <td width="157"><div align="right">学&nbsp;&nbsp;&nbsp;&nbsp;号：</div></td>
    <td width="290">${stu.sid}</td>
  </tr>
  <tr>
    <td><div align="right">姓&nbsp;&nbsp;&nbsp;&nbsp;名：</div></td>
    <td>${stu.sname}</td>
  </tr>
  <tr>
    <td><div align="right">性&nbsp;&nbsp;&nbsp;&nbsp;别：
      </div></td>
    <td>${stu.sgender}</td>
  </tr>
  <tr>
  	<td><div align="right">民&nbsp;&nbsp;&nbsp;&nbsp;族：</div></td>
  	<td><c:if test="${empty stu.mz}"><span class="info">信息暂无</span></c:if>${stu.mz}</td>
  </tr>
  <tr>
      <td><div align="right">班&nbsp;&nbsp;&nbsp;&nbsp;级：</div></td>
    <td>${stu.sdepart}</td>
      </tr>
      <tr>
    <td><div align="right">出生日期：</div></td>
    <td><c:if test="${empty stu.birth}"><span class="info">信息暂无</span></c:if>${stu.birth}</td>
  </tr>
  <tr>
    <td><div align="right">手&nbsp;机&nbsp;号：</div></td>
    <td>${stu.stel}</td>
  </tr>
  <tr>
    <td><div align="right">Q&nbsp;&nbsp;Q&nbsp;&nbsp;号：</div></td>
    <td>
<c:if test="${empty stu.qq}"><span class="info">信息暂无</span></c:if>${stu.qq}
    </td>
  </tr>
  <tr>
    <td><div align="right">邮箱地址：</div></td>
    <td>${stu.syx}</td>
  </tr>
</table>
</div>  
        <div title="修改信息" class="gb">
      <script src="js/xsxg.js"></script>
       <style type="text/css">
       table{margin:20px auto;font-size:18px;border:1px solid #999}
       td{padding:10px;border:1px solid #999}
       #xsxg{height:100%;}
       .info{color:blue}
       .edittxt{width:80px;height:35px; font-size:18px;border-radius:5px;border:1px solid #ccc;padding:5px}
        </style>
   <form id="xsxg" method="post" class="tttt">   
   <input type="hidden" name="method" value="update"/>  
<table width="462" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td width="157"><div align="right">学&nbsp;&nbsp;&nbsp;&nbsp;号：</div></td>
    <td width="290">${stu.sid}</td>
  </tr>
  <tr>
    <td><div align="right">姓&nbsp;&nbsp;&nbsp;&nbsp;名：</div></td>
    <td>${stu.sname}</td>
  </tr>
  <tr>
    <td><div align="right">性&nbsp;&nbsp;&nbsp;&nbsp;别：
      </div></td>
    <td>
      <input  type="radio" name="sgender" id="radio" value="男" <c:if test="${stu.sgender eq'男'}">checked='checked'</c:if>>
      男
      <input type="radio" name="sgender" id="radio2" value="女" <c:if test="${stu.sgender eq'女'}">checked='checked'</c:if>>
      女</td>
  </tr>
  <tr>
  	<td><div align="right">民&nbsp;&nbsp;&nbsp;&nbsp;族：</div></td><td> <input type="text" id="mz" name="mz" value="${stu.mz}"></td>
  </tr>
  <tr>
      <td><div align="right">班&nbsp;&nbsp;&nbsp;&nbsp;级：</div></td>
    <td><input type="text" id="sdepart" name="sdepart" value="${stu.sdepart}"></td>
      </tr>
      <tr>
    <td><div align="right">出生日期：</div></td>
    <td><input type="text"  class="easyui-datebox" name="birth" id="birth" value="${stu.birth}"></td>
  </tr>
  <tr>
    <td><div align="right">手&nbsp;机&nbsp;号：</div></td>
    <td><input type="text" name="stel" id="stel" value="${stu.stel}"></td>
  </tr>
  <tr>
    <td><div align="right">Q&nbsp;&nbsp;Q&nbsp;&nbsp;号：</div></td>
    <td><input type="text" name="qq" id="qq" value="${stu.qq}"></td>
  </tr>
  <tr>
    <td><div align="right">邮箱地址：</div></td>
    <td><input type="text" name="syx" id="syx" value="${stu.syx}"></td>
  </tr>
  <tr>
    <td colspan="2"><div align="center">
      <input type="button" value="修改信息"  class="edittxt">
    </div></td>
  </tr>
</table>
</form>

        </div>
  <div title="修改密码" class="gb">
  <style type="text/css">
    #gaimm{margin:50px auto;border:1px solid #999;width:400px;height:300px;padding-top:30px;}
#link{height:35px;width:100px;font-size:18px;font-family:"微软雅黑"; border-radius:5px;}
#link:hover{color:blue;background:lightgray;}
p{text-align:center;line-height:50px;}
</style>
</head>
<style type="text/css">

#gaimm{
background:pink;



 font-family:"微软雅黑";
 line-height:80px;
}
#gaimm input{background:#fff;}
</style>
<body>
<form id="gaimm" name="fr" method="post" class="tttt">
<input type="hidden" name="method" value="update2"/>  
<p>输入原密码：<input type="password" name="ymm" id="ymm"></p>
<p>输入新密码：<input type="password" name="xmm" id="xmm"></p>
<p>确认新密码：<input type="password" name="qrmm" id="qrmm"></p>
<p><input type="button" id="link" value="确定修改"></p>
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
   			url : 'xsczServlet',
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