$(function() {	
	obj = {
			editRow : undefined,//判断是否是可编辑状态
			search : function() {// 查询功能
				var sid = $.trim($('input[name="sid"]').val());
				var sname = $.trim($('input[name="sname"]').val());
				var sdepart= $.trim($('input[name="sdepart"]').val());				
				$('#xs').datagrid('load', {
					sid : sid,
					sname : sname,
					sdepart : sdepart,
				});
			},
			add : function() {// 添加功能
			$('#save,#redo').show();
			if(this.editRow==undefined){
				//添加一行 
				$('#xs').datagrid('insertRow', {
					index : 0,
					row:{},
				})
			//将第一行设置为可编辑状态
			$('#xs').datagrid('beginEdit', 0);	
			this.editRow = 0;
			}
			},
			edit:function(){//点击进行修改
			var rows = $('#xs').datagrid('getSelections');//获取选中的个数
			if(rows.length==1){
				if(this.editRow!=undefined){
					$('#xs').datagrid('endEdit', this.editRow);
				}
				if (this.editRow == undefined) {
					var index = $('#xs').datagrid('getRowIndex', rows[0]);
					$('#save,#redo').show();
					$('#xs').datagrid('beginEdit', index);
					//alert($("table tr").eq(index).children("td").eq(1).text())
					this.editRow = index;
					$('#xs').datagrid('unselectRow', index);//取消指定选择的行。
				}	
			} else {
				$.messager.alert('警告', '修改必须或只能选择一行！', 'warning');
			}
			},
			del:function(){//点击进行删除
				var rows = $('#xs').datagrid('getSelections');//获取选中的个数
				if (rows.length > 0) {
					$.messager.confirm('确定操作', '您确定要删除所选的信息吗？', function (flag) {
						if (flag) {
							var ids = [];
							for (var i = 0; i < rows.length; i ++) {
								ids.push(rows[i].sid);
							}							
							$.ajax({
								type : 'POST',
								url : 'xsczServlet',
								data : {
									ids : ids.join(','),
									method:'del',
								},
								beforeSend : function () {
									$('#xs').datagrid('loading');
								},
								success : function (data) {
									if (data) {
										$('#xs').datagrid('loaded');
										$('#xs').datagrid('load');
										$('#xs').datagrid('unselectAll');
										$.messager.show({
											title : '提示',
											msg : data + '个学生信息删除成功！',
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
				$('#xs').datagrid('endEdit', this.editRow);
			},
			redo : function () {//取消当前的编辑
				$('#save,#redo').hide();
				this.editRow = undefined;
				$('#xs').datagrid('rejectChanges');
			},	
			}
	$('#xs').datagrid({
						url : 'xsglServlet',
						title : '学生信息管理',
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
						toolbar : '#cx_tool',						
						columns : [ [
						         {
									field : 'id',
			                        checkbox : true,			                       		                      
								},     
								{
									field : 'sid',
									title : '学号',
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
									field : 'sname',
									title : '姓名',
									align : 'center',
									sortable : true,
									width:'16%',
									editor : {
										type : 'validatebox',
										options : {
											required : true,
											validType:'length[2,4]', 
										},
									},
								},								
								{
									field : 'sgender',
									title : '性别',
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
									field : 'sdepart',
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
									field : 'stel',
									title : '电话',
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
									field : 'syx',
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
							if (obj.editRow != undefined) {
								$('#xs').datagrid('endEdit', obj.editRow);
							}
							if(obj.editRow==undefined){
								$('#save,#redo').show();
								$('#xs').datagrid('beginEdit', rowIndex);
								obj.editRow = rowIndex;
							}
						},
						onAfterEdit : function (rowIndex, rowData, changes) {//在用户完成编辑一行的时候触发							
							$('#save,#redo').hide();
							obj.editRow = undefined;
							var inserted = $('#xs').datagrid('getChanges', 'inserted');
							var updated = $('#xs').datagrid('getChanges', 'updated');							
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
								url : 'xsczServlet',
								data : {
									id:rowData.id,
									sid:rowData.sid,
									sname:rowData.sname,
									sgender:rowData.sgender,
									sdepart:rowData.sdepart,
									stel:rowData.stel,
									syx:rowData.syx,
									method:method,
								},
								beforeSend : function () {
									$('#xs').datagrid('loading');
								},
								success : function (data) {
									if(data=='error'){
										$('#xs').datagrid('loaded');
										$('#xs').datagrid('load');
										$('#xs').datagrid('unselectAll');
										$.messager.alert('错误', '学号不能相同！', 'error');				
										obj.editRow = undefined;
									}else{
										$('#xs').datagrid('loaded');
										$('#xs').datagrid('load');
										$('#xs').datagrid('unselectAll');
										$.messager.show({
											title : '提示',
											msg : data + '个学生信息' + info + '成功！',
										});
										obj.editRow = undefined;
									}
								},
							});		
						},
					})   					 				
})
