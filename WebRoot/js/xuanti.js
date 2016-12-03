
function ck(value) {// 信息查看
	var name=$("table tr td:contains('"+value+"')").parent().find('td').eq(2).text();
	$.ajax({
		type : 'POST',
		url : 'ckServlet',
		data : {
			tname : name
		},
		success : function(response, status, xhr) {
			$('#box').window({
				width : 700,
				height : 600,
				modal : true,
				collapsible : false,
				minimizable : false,
				title:'查看老师信息',
				href:'teacher/show.jsp',
				});
		}

	})
	return false;
}
$(function() {
	obj = {
		search : function() {// 查询功能
			var name = $.trim($('input[name="lwname"]').val());
			var name2 = $.trim($('input[name="tname"]').val());
		
			$('#xuanti').datagrid('load', {
				lwname : name,
				tname : name2,

			});
		},
		save : function() {// 确定选题功能
			var row = $('#xuanti').datagrid('getSelected');// 获取选中的所有行						
			if (row) {			
				$.messager.confirm('确定操作', '您确定要选择这个论文吗？', function(flag) {
					if (flag) {
					$.ajax({
							type : 'post',
							url : 'xuanServlet',
							data : {
								lwid : row.lwid,
							},
							beforeSend : function(jqXHR, settings) {
								$('#xuanti').datagrid('loading');
							},
							success : function(response, status, xhr) {
								if(response){
									$('#xuanti').datagrid('load');
									$('#xuanti').datagrid('loaded');
									$('#xuanti').datagrid('unselectAll');
									if(response=="msg"){
										$.messager.alert('警告！', '每个学生只能选择一篇论文！！！', 'warning')
									}else{
										$.messager.show({title : '提示',msg:'恭喜你选题成功'});
									}
								
								}
							}						
						})
					}
				})
			} else if (rows.length > 1) {
				$.messager.alert('警告！', '你只能选择一篇论文', 'warning');
			} else {
				$.messager.alert('警告！', '请先选择论文', 'warning');
			}
		}
	};
	$('#xuanti')
			.datagrid(
					{
						url : 'xtServlet',
						title : '论文选题',
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
						toolbar : '#cx_tool',
						rowStyler : function(index, row) {// 设置某一行的样式
							if (row.sfxz == '是') {
								return 'background-color: #ccc';
							}
						},
						columns : [ [
						        {
						        	field : 'lwid',
						        	title : '论文编号',
						        	width:'10%',
						        	align : 'center',
						        	sortable : true,
						        },
								{
									field : 'lwname',
									title : '论文题目',
									width:'10%',
									align : 'center',
									sortable : true,
								},
								{
									field : 'tname',
									title : '导师姓名',
									width:'15%',
									align : 'center',
									sortable : true,
									formatter : function(value, row, index) {
										
										return "<a href='javascript:void(0)' onclick='ck("
												+ row.tel
												+ ")' style='color: blue;cursor: pointer'>"+value+"</a>";
									},
								},
								{
									field : 'tel',
									title : '导师电话',
									width:'15%',
									align : 'center'
								},
								{
									field : 'tdepart',
									title : '论文所属院系',
									width:'15%',
									align : 'center',
									sortable : true,
								},
								{
									field : 'sfxz',
									title : '论文是否已被选择',
									width:'15%',
									align : 'center',
									sortable : true,
								},
								{
									field : 'lwxz',
									title : '论文要求下载',
									width:'15%',
									align : 'center',
									formatter : function(value, row, index) {									
										return "<a style='color:red' href='xzyqServlet?lwname="+value+"'>下载</a>";
									},
								}, {
									field : 'id',
									title : '',
									align : 'center',
									width:'5%',
									checkbox : true,
								},

						] ],
						onLoadSuccess : function(data) {
							$('table input:checkbox').eq(0).attr("disabled", 'true');
							for ( var i = 0; i < data.rows.length; i++) {
								if (data.rows[i].sfxz == '是') {
							$('table input:checkbox').eq(i + 1).attr("disabled", 'true')
								}
							}
				 $("table tr").each(function(){
					 $(this).children("td").eq(2).mouseout(function () {
						   $(this).tooltip({
							   position : 'top',
							   content : '点击可查看老师详细信息',
						   })
						    })
						    })		
						}
					})
        
})
