/**
 * Created by sony on 2017/3/19.
 */

// 筛选
$(function () {
    function filterBg(){
        $(this).attr("class","active").siblings().attr("class","");
    }
    $(".filter-tag a").click(filterBg);
});

// 热门地区
$(document).on('click', '.new .col-xs-12 span', function() {
    $(this).attr("class","now");
    $(this).siblings().attr("class","");
    $(this).parents().children().find('.filter-tag a:first').attr('class','active').nextAll().attr('class','');
    $(this).parents().children().find('.secondlevel').css('display','none');

    paramSearchSubmit();
});

//二级地区
$(document).on('click','.filter-row .first .active', function () {
    $(this).parents().find('.secondlevel .filter-tag').find('a:first').attr('class','active').nextAll().attr('class','');
    // $(this).parents().find('.secondlevel').css('display','block');
    paramSearchSubmit();
})
$(document).on('click','#allfirst', function () {
    $(this).parents().find('.secondlevel').css('display','none');
})
//三级地区的点击事件
$(document).on('click','.secondlevel .active',function(){
    paramSearchSubmit();
});
//剩下条件的点击事件
$(document).on('click','.renttype .active',function(){
    paramSearchSubmit();
});
$(document).on('click','.rentprice .active',function(){
    paramSearchSubmit();
});
$(document).on('click','.housetype .active',function(){
    paramSearchSubmit();
});

function paramSearchSubmit(){
    var searchRegionType = $('.new .col-xs-12 .now').attr('data-search-type');
    var l2regionid = $(".filter-row .first .active").attr('data-l2regionid');
    //地区之外的条件
    var rentprice = $(".rentprice .active").attr('data-rentprice');
    var housetype = $(".housetype .active").attr('data-housetype');
    var renttype = $(".renttype .active").attr('data-renttype');

    if(l2regionid=='all'){
        window.location.href="/house.do?rentprice="+rentprice+"&housetype="+housetype+"&renttype="+renttype+"&searchRegionType="+searchRegionType+"&l2regionid="+l2regionid;
    } else{
        var l3regionid=$(".secondlevel .active").attr("data-l3regionid");
        window.location.href="/house.do?rentprice="+rentprice+"&housetype="+housetype+"&renttype="+renttype+"&searchRegionType="+searchRegionType+"&l2regionid="+l2regionid+"&l3regionid="+l3regionid;
    }
    
}