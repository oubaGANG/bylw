
function tg(value) {// 论文通过	
	$.messager.confirm('确定操作', '您确定让这个学生的开题报告通过吗？确定之后将无法再次修改', function (flag) {
		if (flag) {
		/*$("table tr td:contains('"+value+"')").siblings().find('button').attr("disabled", 'true')*/
			 $.ajax({
					type : 'POST',
					url : 'czbgServlet',
					data : {
						sid:value,
						method:'tg',
					},
					beforeSend : function () {
						$('#ckbg').datagrid('loading');
					},
					success : function (data) {
						if (data) {
							$('#ckbg').datagrid('loaded');
							$('#ckbg').datagrid('load');
							$('#ckbg').datagrid('unselectAll');		
							
							$.messager.show({
								title : '提示',
								msg : '恭喜操作成功！',
							});
						}
					},
				});	
		}	
		})
}
function btg(value) {// 论文不通过
	$.messager.confirm('确定操作', '您确定让这个学生的开题报告不通过吗？确定之后将无法再次修改', function (flag) {
		if (flag) {
			 /*$("table tr td:contains('"+value+"')").siblings().find('button').attr("disabled", 'true')*/
			 $.ajax({
					type : 'POST',
					url : 'czbgServlet',
					data : {
						sid:value,
						method:'btg',
					},
					beforeSend : function () {
						$('#ckbg').datagrid('loading');
					},
					success : function (data) {
						if (data) {
							$('#ckbg').datagrid('loaded');
							$('#ckbg').datagrid('load');
							$('#ckbg').datagrid('unselectAll');						
							$.messager.show({
								title : '提示',
								msg : '恭喜操作成功！',
							});
						}
					},
				});
		}
		})
}
$(function() {
	obj = {
		search : function() {// 查询功能
			var lwname = $.trim($('input[name="lwname"]').val());
			var sname= $.trim($('input[name="sname"]').val());
			var sid = $.trim($('input[name="sid"]').val());
			$('#ckbg').datagrid('load', {
				lwname : lwname,
				sname : sname,
				sid : sid,
			});
		},		
	};
	$('#ckbg')
			.datagrid(
					{
						url : 'ckbgServlet',
						title : '查看学生提交论文',
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
						toolbar : '#tool1',
						columns : [ [
								{
									field : 'lwname',
									title : '论文题目',
									width:'16%',
									align : 'center',
									sortable : true,
								},
								{
									field : 'sid',
									title : '学生学号',
									width:'16%',
									align : 'center',
									sortable : true,
								},
								{
									field : 'sname',
									title : '学生姓名',
									width:'16%',
									align : 'center',	
									sortable : true,
								},	
								{
									field : 'stel',
									title : '学生电话',
									width:'16%',
									align : 'center',								
								},
								{
									field : 'lwxz',
									title : '开题报告下载',
									width:'15%',
									align : 'center',
									formatter : function(value, row, index) {									
										return "<a style='color:red' href='xzbgServlet?lwname="+value+"'>下载</a>";
									},
								}, 
								{
									field : 'tg',
									title : '通过',
									width:'10%',
									align : 'center',
									formatter : function(value, row, index) {									
										return "<button onclick='tg("
												+ row.sid
												+ ")''>通过</button>";
									},
								}, 
								{
									field : 'btg',
									title : '不通过',
									width:'10%',
									align : 'center',
									formatter : function(value, row, index) {									
										return "<button onclick='btg("
												+ row.sid
												+ ")''>不通过</button>";
									},
								}, 

						] ],
				
					})
        
})
