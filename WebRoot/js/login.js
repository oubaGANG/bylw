$(function () {
	$('#box1').panel({
	    cls : 'a',
	    width : 380,
	    height : 280,
	
	    title : '重要通知',
	    iconCls : 'icon-bell',//
	    tools : [{
	        iconCls : 'icon-more',
	        handler : function () {
	            alert('请先登录');
	        },
	    }],
	})
	    $('#box2').panel({
	        cls : 'b',
	        width : 380,
	        height : 280,
	        title : '导师名单',
	        iconCls : 'icon-bell',
	        tools : [{
	            iconCls : 'icon-more',
	            handler : function () {
	                alert('请先登录');
	            },
	        }],
	    })
	    $('#box3').panel({
	        cls : 'c',
	        width : 380,
	        height : 280,
	        title : '毕业论文题目公示',
	        iconCls : 'icon-bell',
	        tools : [{
	            iconCls : 'icon-reload',
	            handler : function () {
	                alert('请先登录');
	            },
	        }],
	    })
$('#log').click(function () {
	
	$('.submit').attr('disable');
    $('#login').dialog('open');
    });
    $('#login').dialog({
        closed:"true",
        title : '登录',
        width : 350,
        height : 250,
        modal : true,
        iconCls : 'icon-login',
    })
    //帐号验证
    $('#manager').validatebox({
        required : true,
        missingMessage : '请输入帐号',
        invalidMessage : '帐号不得为空',
    });

    //密码验证
    $('#password').validatebox({
        required : true,
        validType : 'length[6,10]',
        missingMessage : '请输入密码',
    });
  
    //加载时判断验证
    if (!$('#manager').validatebox('isValid')) {
        $('#manager').focus();
    } else if (!$('#password').validatebox('isValid')) {
        $('#password').focus();
    }/*else if (!$('.sf').validatebox('isValid')) {
        $('.sf').focus();
    }*/
    $('#manager').blur(function() {
		
	})

    //单击登录
    $('.submit').click(function () {
    	var text=$('.sf option:selected').val();
        if (!$('#manager').validatebox('isValid')) {
            $('#manager').focus();
            
        } else if (!$('#password').validatebox('isValid')) {
            $('#password').focus();
        }/*else if (text==null) {
        	$.messager.alert('登录失败！', '请选择身份！', 'warning', function () {
				$('.sf').select();
			});
        } */
        else {
           $.ajax({
   			type : 'POST',
   			url : 'loginServlet',
   			data : $('form').serialize(),
   			success : function (response, status, xhr) {
   				if(response!=""){$('#error').text(response);
   				$('.textbox').focus(function(){
   					$('#error').text("")
   				})
   				}
   				else{ 				
   			 window.location=text+"/"+text+".jsp";
   				
   				}
  
   			}
   		
   			})
          
        }
    });
})





























