
$(function() {
	obj4 = {
		search : function() {// 查询功能
			var lwname = $.trim($('input[name="lwname"]').val());
			var sname= $.trim($('input[name="sname"]').val());
			var sid = $.trim($('input[name="sid"]').val());
			$('#fplw').datagrid('load', {
				lwname : lwname,
				sname : sname,
				sid : sid,
			});
		},	
		fplw:function(){//给分配论文给评阅老师
			var pyname=$('#pyname option:selected').val()//获取选中的评阅老师
			var rows = $('#fplw').datagrid('getSelections');//获取选中的个数
			if (rows.length > 0) {
				$.messager.confirm('确定操作', '您确定吧这些论文分配给'+pyname+'评阅老师吗？', function (flag) {
					if (flag) {
						var ids = [];					
						for (var i = 0; i < rows.length; i ++) {
							ids.push(rows[i].sid);
						}							
						$.ajax({
							type : 'POST',
							url : 'czlwServlet',
							data : {
								ids : ids.join(','),
								pyname:pyname,
								method:'fplw',
							},
							beforeSend : function () {
								$('#fplw').datagrid('loading');
							},
							success : function (data) {
								if (data) {
									$('#fplw').datagrid('loaded');
									$('#fplw').datagrid('load');
									$('#fplw').datagrid('unselectAll');
									$.messager.show({
										title : '提示',
										msg : data + '个论文成功分配给'+pyname+'评阅老师！',
									});
								}
							},
						});		
					}
				});
			} else {
				$.messager.alert('提示', '请选择要分配的论文！', 'info');
			}
		},
	};
	$('#fplw')
			.datagrid(
					{
						url : 'cklwServlet',
						title : '分配学生论文',
						iconCls : 'icon-search',
						fit : true,// 充满整个父容器
						fitColumns : true,// 列宽自适应
						striped : true,// 是否显示斑马线效果
						rownumbers : true,// 是否显示行号
						// singleSelect:true,//只能选择一行
						border : false,
						pagination : true,// 是否显示分页
						nowrap : false,// 每列是否不换行
						checkOnSelect : false,
						pageSize : 13,
						pageList : [ 13, 26, 39, 52, 65 ],
						pageNumber : 1,
						toolbar : '#fptool',
						columns : [ [
						         {
											field : 'pyname',
					                        checkbox : true,			                       		                      
								}, 
								{
									field : 'lwname',
									title : '论文题目',
									width:'20%',
									align : 'center',
									sortable : true,
								},
								{
									field : 'sid',
									title : '学生学号',
									width:'20%',
									align : 'center',
									sortable : true,
								},
								{
									field : 'sname',
									title : '学生姓名',
									width:'20%',
									align : 'center',	
									sortable : true,
								},	
								{
									field : 'stel',
									title : '学生电话',
									width:'20%',
									align : 'center',								
								},
								{
									field : 'lwxz',
									title : '论文下载',
									width:'15%',
									align : 'center',
									formatter : function(value, row, index) {									
										return "<a style='color:red' href='xzlwServlet?lwname="+value+"'>下载</a>";
									},
								}, 								

						] ],
				
					})
        
})
