$(function () {
	
    $('#nav>li').click(function () {
       var text=$('span',this).text();//用于获取地址
        var text1=$('p',this).text();//用于写title
        if ($('#tabs').tabs('exists', text1)) {
            $('#tabs').tabs('select',text1);
        }else {
            $('#tabs').tabs('add', {
                title: text1,
                iconCls: 'icon-' + text,
                closable: true,
                href: "student"+"/"+text + '.jsp',
            })
 
        }
    })

    $('#tabs').tabs({
        fit : true,
        border : false,
    });

});















































