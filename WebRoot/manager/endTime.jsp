<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'endTime.jsp' starting page</title>
    
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
  <form action="endTimeServlet" method="post">
    设置论文最后提交时间：<input type="text" class="easyui-datebox" name="date" id="date">
  <input type="submit" value="确定" id="sub">
  </form>
  <script>
  $(function(){
   $('#sub').click(function () {
   var date=$('#date').datebox('getValue')
   if(date==""){
   $.messager.alert('警告', '请选择日期！', 'warning');
   	return false
   }
     else {
           $.ajax({
   			type : 'POST',
   			url : 'endTimeServlet',
   			data : {date:date},
   			success : function (response, status, xhr) {
   				$.messager.alert('消息', '恭喜操作成功！！！！', 'info');
   			}
   		
   			})
          
        }
        return false
   })
  })
  </script>
  </body>
</html>
