
function pf(value) {// 论文评分	

			var fen;
			var pingy;	
			$.messager.prompt('提示框', '请输入分数！', function (content) {
				if (content) {
					fen=content;
					$.messager.prompt('提示框', '请输入评语！', function (content) {
						if (content) {
							pingy=content;
							$.ajax({
								type : 'POST',
								url : 'czlwServlet',
								data : {
									sid:value,
									fen:fen,
									pingy:pingy,
									method:'tg',
								},
								beforeSend : function () {
									$('#cklw').datagrid('loading');
								},
								success : function (data) {
									if (data) {
										$('#cklw').datagrid('loaded');
										$('#cklw').datagrid('load');
										$('#cklw').datagrid('unselectAll');		
										
										$.messager.show({
											title : '提示',
											msg : '恭喜操作成功！',
										});
									}
								},
							});
						}
					});
				}
			});		
}
$(function() {
	obj = {
		search : function() {// 查询功能
			var lwname = $.trim($('input[name="lwname"]').val());
			var sname= $.trim($('input[name="sname"]').val());
			var sid = $.trim($('input[name="sid"]').val());
			$('#cklw').datagrid('load', {
				lwname : lwname,
				sname : sname,
				sid : sid,
			});
		},		
	};
	$('#cklw')
			.datagrid(
					{
						url : 'cklwServlet',
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
						toolbar : '#cx_tool',
						columns : [ [
						             
								{
									field : 'sid',
									title : '学生学号',
									width:'18%',
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
									field : 'tg',
									title : '通过',
									width:'10%',
									align : 'center',
									formatter : function(value, row, index) {									
										return "<button onclick='pf("
												+ row.sid
												+ ")''>评分</button>";
									},
								}, 
						

						] ],
				
					})
        
})
