$(function () {	
	$('#nav').tree({
		onClick:function(data){
			 if($('#nav').tree('isLeaf',data.target)){//判断是否是叶子节点
					var text=data.text;//获取标题
					var url;//获取地址
					if(text=='论文信息管理'){
						url='lwgl';
					}else if(text=='导师信息管理'){
						url='dsgl';
					}else if(text=='学生信息管理'){
						url='xsgl';
					}else if(text=='分配学生论文'){
						url='fplw';
					}
					else if(text=='设置结束时间'){
						url='endTime';
					}
					else if(text=='成绩评定'){
						url='cj';
					}
					  if ($('#tabs').tabs('exists', text)) {
				            $('#tabs').tabs('select',text);
				        }else {
				            $('#tabs').tabs('add', {
				                title: text,
				                iconCls: 'icon-' + url,
				                closable: true,
				                href: "manager"+"/"+url + '.jsp',
				            })
				        }
			 }
		
		}
	})
 
    $('#tabs').tabs({
        fit : true,
        border : false,
    });

});















































