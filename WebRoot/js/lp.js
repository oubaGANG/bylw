//轮播器初始化
$(function () {
    $('#banner img').hide();
    $('#banner img').eq(0).show();
    $('#banner ul li').eq(0).css('color', '#333');
    
    //手动轮播器
    $('#banner ul li').hover(function () {
        clearInterval(lbq);
       move($(this).index())
    },function () {
       index=$(this).index()+1
        lbq=setInterval(auto,2000);
    })
    //自动轮播器
    var index=0;
    var lbq=setInterval(auto,2000)
    function move(obj) {
        $('#banner img').hide();
        $('#banner img').eq(obj).show();
        $('#banner ul li').css('color', '#999');
        $('#banner ul li').eq(obj).css('color', '#333');

    }
    function auto() {
        if(index>=$('#banner ul li').length){
            index=0;
        }
        move(index);
        index++;
    }
})




















