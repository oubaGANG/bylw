$(function() {	
	obj2 = {
			editRow : undefined,//判断是否是可编辑状态
			search : function() {// 查询功能
				var tid = $.trim($('input[name="tid"]').val());
				var tname = $.trim($('input[name="tname"]').val());	
				$('#ds').datagrid('load', {
					tid : tid,
					tname : tname,
				});
			},
			add : function() {// 添加功能
			$('#save,#redo').show();
			if(this.editRow==undefined){
				//添加一行 
				$('#ds').datagrid('insertRow', {
					index : 0,
					row:{},
				})
			//将第一行设置为可编辑状态
			$('#ds').datagrid('beginEdit', 0);	
			this.editRow = 0;
			}
			},
			edit:function(){//点击进行修改
			var rows = $('#ds').datagrid('getSelections');//获取选中的个数
			if(rows.length==1){
				if(this.editRow!=undefined){
					$('#ds').datagrid('endEdit', this.editRow);
				}
				if (this.editRow == undefined) {
					var index = $('#ds').datagrid('getRowIndex', rows[0]);
					$('#save,#redo').show();
					$('#ds').datagrid('beginEdit', index);
					//alert($("table tr").eq(index).children("td").eq(1).text())
					this.editRow = index;
					$('#ds').datagrid('unselectRow', index);//取消指定选择的行。
				}	
			} else {
				$.messager.alert('警告', '修改必须或只能选择一行！', 'warning');
			}
			},
			del:function(){//点击进行删除
				var rows = $('#ds').datagrid('getSelections');//获取选中的个数
				if (rows.length > 0) {
					$.messager.confirm('确定操作', '您正在要删除所选的记录吗？', function (flag) {
						if (flag) {
							var ids = [];
							for (var i = 0; i < rows.length; i ++) {
								ids.push(rows[i].tid);
							}							
							$.ajax({
								type : 'POST',
								url : 'dsczServlet',
								data : {
									ids : ids.join(','),
									method:'del',
								},
								beforeSend : function () {
									$('#ds').datagrid('loading');
								},
								success : function (data) {
									if (data) {
										$('#ds').datagrid('loaded');
										$('#ds').datagrid('load');
										$('#ds').datagrid('unselectAll');
										$.messager.show({
											title : '提示',
											msg : data + '个导师信息删除成功！',
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
				$('#ds').datagrid('endEdit', this.editRow);
			},
			redo : function () {//取消当前的编辑
				$('#save,#redo').hide();
				this.editRow = undefined;
				$('#ds').datagrid('rejectChanges');
			},	
			}
	$('#ds').datagrid({
						url : 'dsglServlet',
						title : '导师信息管理',
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
						toolbar : '#tool',						
						columns : [ [						      
								{
									field : 'id',
									checkbox : true,                         
								},
								{
									field : 'tid',
									title : '编号',
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
									field : 'tname',
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
									field : 'tgender',
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
									field : 'yx',
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
							if (obj2.editRow != undefined) {
								$('#ds').datagrid('endEdit', obj2.editRow);
							}
							if(obj2.editRow==undefined){
								$('#save,#redo').show();
								$('#ds').datagrid('beginEdit', rowIndex);
								obj2.editRow = rowIndex;
							}
						},
						onAfterEdit : function (rowIndex, rowData, changes) {//在用户完成编辑一行的时候触发							
							$('#save,#redo').hide();
							obj2.editRow = undefined;
							var inserted = $('#ds').datagrid('getChanges', 'inserted');
							var updated = $('#ds').datagrid('getChanges', 'updated');							
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
								url : 'dsczServlet',
								data : {
									id:rowData.id,
									tid:rowData.tid,
									tname:rowData.tname,
									tgender:rowData.tgender,
									tdepart:rowData.tdepart,
									tel:rowData.tel,
									yx:rowData.yx,
									method:method,
								},
								beforeSend : function () {
									$('#ds').datagrid('loading');
								},
								success : function (data) {
									if(data=='error'){
										$('#ds').datagrid('loaded');
										$('#ds').datagrid('load');
										$('#ds').datagrid('unselectAll');
										$.messager.alert('错误', '编号不能相同！', 'error');				
										obj2.editRow = undefined;
									}else{
										$('#ds').datagrid('loaded');
										$('#ds').datagrid('load');
										$('#ds').datagrid('unselectAll');
										$.messager.show({
											title : '提示',
											msg : data + '个导师信息' + info + '成功！',
										});
										obj2.editRow = undefined;
									}
								},
							});		
						},
					})   					 				
})
