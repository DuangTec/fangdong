/**
 * Created by sony on 2017/3/19.
 */
//��ҳ
$(function(){
    function pageBgColor(){
        $(this).parent().attr("class","active").siblings().attr("class","");
    }
    $(".pagenation a").click(pageBgColor);
})

// ɸѡ
$(function () {
    function filterBg(){
        $(this).attr("class","active").siblings().attr("class","");
    }
    $(".filter-tag a").click(filterBg);
})