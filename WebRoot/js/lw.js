$(function() {	
	obj1 = {
			editRow : undefined,//判断是否是可编辑状态
			search : function() {// 查询功能
				var lwname = $.trim($('input[name="lwname"]').val());
				var tname = $.trim($('input[name="tname"]').val());					
				$('#lwgl').datagrid('load', {
					lwname : lwname,
					tname : tname,
				});
			},
			add : function() {// 添加功能
			$('#save,#redo').show();
			if(this.editRow==undefined){
				//添加一行 
				$('#lwgl').datagrid('insertRow', {
					index : 0,
					row:{},
				})
			//将第一行设置为可编辑状态
			$('#lwgl').datagrid('beginEdit', 0);	
			this.editRow = 0;
			}
			},
			edit:function(){//点击进行修改
			var rows = $('#lwgl').datagrid('getSelections');//获取选中的个数
			if(rows.length==1){
				if(this.editRow!=undefined){
					$('#lwgl').datagrid('endEdit', this.editRow);
				}
				if (this.editRow == undefined) {
					var index = $('#lwgl').datagrid('getRowIndex', rows[0]);
					$('#save,#redo').show();
					$('#lwgl').datagrid('beginEdit', index);
					//alert($("table tr").eq(index).children("td").eq(1).text())
					this.editRow = index;
					$('#lwgl').datagrid('unselectRow', index);//取消指定选择的行。
				}	
			} else {
				$.messager.alert('警告', '修改必须或只能选择一行！', 'warning');
			}
			},
			del:function(){//点击进行删除
				var rows = $('#lwgl').datagrid('getSelections');//获取选中的个数
				if (rows.length > 0) {
					$.messager.confirm('确定操作', '您正在要删除所选的信息吗？', function (flag) {
						if (flag) {
							var ids = [];
							for (var i = 0; i < rows.length; i ++) {
								ids.push(rows[i].lwid);
							}							
							$.ajax({
								type : 'POST',
								url : 'xtczServlet',
								data : {
									ids : ids.join(','),
									method:'del',
								},
								beforeSend : function () {
									$('#lwgl').datagrid('loading');
								},
								success : function (data) {
									if (data) {
										$('#lwgl').datagrid('loaded');
										$('#lwgl').datagrid('load');
										$('#lwgl').datagrid('unselectAll');
										$.messager.show({
											title : '提示',
											msg : data + '个论文信息删除成功！',
										});
									}
								},
							});		
						}
					});
				} else {
					$.messager.alert('提示', '请选择要删除的信息！', 'info');
				}
				},
			save : function () {	//保存修改信息		
				//将第一行设置为结束编辑状态
				$('#lwgl').datagrid('endEdit', this.editRow);
			},
			
			redo : function () {//取消当前的编辑
				$('#save,#redo').hide();
				this.editRow = undefined;
				$('#lwgl').datagrid('rejectChanges');
			},	
			}
	$('#lwgl').datagrid({
						url : 'xtServlet',
						title : '论文信息管理',
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
						pageSize : 11,
						pageList : [ 11, 22, 33, 44, 55],
						pageNumber : 1,
						toolbar : '#tool3',						
						columns : [ [
						         {
									field : 'id',
			                        checkbox : true,			                       		                      
								},     
								{
									field : 'lwid',
									title : '论文编号',
									align : 'center',
									sortable : true,
									width:'16%',
									editor : {
										type : 'validatebox',
										options : {
											required : true,
										},
									},                              
								},
								{
									field : 'lwname',
									title : '论文题目',
									align : 'center',	
									sortable : true,
									width:'16%',
									editor : {
										type : 'validatebox',
										options : {
											required : true,
											validType:'length[2,30]', 
										},
									},
								},								
								{
									field : 'tname',
									title : '导师名字',
									align : 'center',
									sortable : true,
									width:'16%',
									editor : {
										type : 'validatebox',
										options : {
											required : true,
										},
									},
								},
								{
									field : 'tdepart',
									title : '院系',
									align : 'center',
									sortable : true,
									width:'16%',
									editor : {
										type : 'validatebox',
										options : {
											required : true,
											validType:'length[2,12]', 
										},
									},
								},
								{
									field : 'tel',
									title : '导师电话',
									align : 'center',
									width:'16%',
									editor : {
										type : 'validatebox',
										options : {
											required : true,
										},
									},
								},
								{
									field : 'tyx',
									title : '邮箱',
									align : 'center',
									width:'16%',
									editor : {
										type : 'validatebox',
										options : {
											required : true,
											validType : 'email',
										},
									},
								},								
						] ],
						onDblClickRow : function (rowIndex, rowData){//双击进行修改
							if (obj1.editRow != undefined) {
								$('#lwgl').datagrid('endEdit', obj1.editRow);
							}
							if(obj1.editRow==undefined){
								$('#save,#redo').show();
								$('#lwgl').datagrid('beginEdit', rowIndex);
								obj1.editRow = rowIndex;
							}
						},
						onAfterEdit : function (rowIndex, rowData, changes) {//在用户完成编辑一行的时候触发							
							$('#save,#redo').hide();
							obj1.editRow = undefined;
							var inserted = $('#lwgl').datagrid('getChanges', 'inserted');
							var updated = $('#lwgl').datagrid('getChanges', 'updated');							
							var method = info =  '';							
							//新增用户
							if (inserted.length > 0) {
								method='add';
								info = '新增';
							}							
							//修改用户
							if (updated.length > 0) {
								method='edit';
								info = '修改';
							}
							$.ajax({
								type : 'POST',
								url : 'xtczServlet',
								data : {
									id:rowData.id,
									lwid:rowData.lwid,
									lwname:rowData.lwname,
									tname:rowData.tname,
									tdepart:rowData.tdepart,
									tel:rowData.tel,
									tyx:rowData.tyx,
									method:method,
								},
								beforeSend : function () {
									$('#lwgl').datagrid('loading');
								},
								success : function (data) {
									if(data=='error'){
										$('#lwgl').datagrid('loaded');
										$('#lwgl').datagrid('load');
										$('#lwgl').datagrid('unselectAll');
										$.messager.alert('错误', '论文编号不能相同！', 'error');				
										obj1.editRow = undefined;
									}else{
										$('#lwgl').datagrid('loaded');
										$('#lwgl').datagrid('load');
										$('#lwgl').datagrid('unselectAll');
										$.messager.show({
											title : '提示',
											msg : data + '个论文信息' + info + '成功！',
										});
										obj1.editRow = undefined;
									}
								},
							});		
						},
					})   					 				
})
