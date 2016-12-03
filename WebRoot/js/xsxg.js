
	$(function(){
		$('#mz').validatebox({
		      validType : 'length[2,8]',
		    });
		$('#stel').validatebox({
		      validType : 'length[11,11]',
		    });
		 $('#sdepart').validatebox({
		        validType : 'length[2,15]',
		    });
		 $('#qq').validatebox({
		        validType : 'length[6,11]',
		    });
		      $('#syx').validatebox({
		    	  validType : 'email',
		    });
	    $('.edittxt').click(function () {
	    	$.ajax({
	   			type : 'POST',
	   			url : 'xsczServlet',
	   			data : $('#xsxg').serialize(),
	   			success : function (response, status, xhr) {
	   				$.messager.alert('消息！', '恭喜修改个人信息成功！', 'info')	
	   			}
	   		
	   			})
	    	
	    })

	})
	
