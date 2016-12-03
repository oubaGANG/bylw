function xz(value) {// 文件下载	
	$.ajax({
		type : 'POST',
		url : 'xzServlet',
		data : {
			url : value
		},
		success : function(response, status, xhr) {
			$.messager.alert('提示！', '恭喜下载成功！！！', 'info');	
		}

	})
	return false;
}
$(function() {
	
	obj = {
			search : function() {// 查询功能
				var sid = $.trim($('input[name="sid"]').val());
				var sname = $.trim($('input[name="sname"]').val());
				$('#cj').datagrid('load', {
					sid : sid,
					sname : sname,
				});
			},
			ok:function(){//通过
				var rows = $('#cj').datagrid('getSelections');//获取选中的个数
				if (rows.length > 0) {
					$.messager.confirm('确定操作', '您确定让他们通过么？', function (flag) {
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
									method:'ok',
								},
								beforeSend : function () {
									$('#cj').datagrid('loading');
								},
								success : function (data) {
									if (data) {
										$('#cj').datagrid('loaded');
										$('#cj').datagrid('load');
										$('#cj').datagrid('unselectAll');
										$.messager.show({
											title : '提示',
											msg : data + '个学生论文给予成功！',
										});
									}
								},
							});		
						}
					});
				} else {
					$.messager.alert('提示', '请选择要操作的信息！', 'info');
				}
			},
			no:function(){//否决
				var rows = $('#cj').datagrid('getSelections');//获取选中的个数
				if (rows.length > 0) {
					$.messager.confirm('确定操作', '您确定让他们通过么？', function (flag) {
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
									method:'no',
								},
								beforeSend : function () {
									$('#cj').datagrid('loading');
								},
								success : function (data) {
									if (data) {
										$('#cj').datagrid('loaded');
										$('#cj').datagrid('load');
										$('#cj').datagrid('unselectAll');
										$.messager.show({
											title : '提示',
											msg : data + '个学生论文给予成功！',
										});
									}
								},
							});		
						}
					});
				} else {
					$.messager.alert('提示', '请选择要操作的信息！', 'info');
				}	
			}
			}
	$('#cj').datagrid({//待通过论文
		url : 'cjckServlet',
		title : '成绩评定',
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
		pageList : [ 13, 26, 39, 52, 65],
		pageNumber : 1,
		toolbar : '#cjtool',						
		columns : [ [
		{
		field : 'id',
		align : 'center',
		checkbox : true,
		},
		{
			field : 'sid',
			title : '学生学号',
			width:'15%',
			align : 'center',
			sortable : true,
		},
		{
			field : 'lwname',
			title : '论文题目',
			width:'17%',
			align : 'center',
			sortable : true,
		},
		{
			field : 'sname',
			title : '学生姓名',
			width:'18%',
			align : 'center',	
			sortable : true,
		},	
		{
			field : 'stel',
			title : '学生电话',
			width:'18%',
			align : 'center',								
		},
		{
			field : 'lwxz',
			title : '论文下载',
			width:'18%',
			align : 'center',
			formatter : function(value, row, index) {									
				return "<a style='color:red' href='xzlwServlet?lwname="+value+"'>下载</a>";
			},
		}, 
		{
			field : 'zf',
			title : '总分',
			width:'10%',
			align : 'center',
			sortable : true,
		}, 								
				] ],
	})
	
})
