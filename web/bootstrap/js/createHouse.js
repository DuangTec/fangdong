/**
 * Created by sony on 2017/3/21.
 */
// 配套设施
$(function () {
    function inputAllBg(){
        $(this).attr("class","active").siblings().attr("class","active");
    }
    $(".input-tag a:first-child").click(inputAllBg);
    function inputothers(){
        if($(this).parent().children().first().hasClass("active")){
            $(this).siblings().attr("class","grey");
        };
        $(this).attr("class","active");
        $(this).parent().children().first().attr("class","grey");
    }
    $(".input-tag a").first().siblings().click(inputothers);
});

//表单验证
$(function(){
    function inputnull(){
        if($(this).val().length=="0"){
            $(this).next().attr("class","warning");
            $(this).next().html("宝宝，此处不可为空");
        }
        if($(this).val().length!="0"){
            $(this).next().remove();
        }
    }
    $(".input-row input").blur(inputnull);
});
//上传图片
 $(".create_house_input").on("change", function(){
     var img_preview = $(this).parents(".create_house_img_preview").find('.img_preview')[0];
     $(img_preview).html("");
     var fileList = this.files;
     var fileListLen=fileList.length;
     for(var i=0;i<fileListLen;i++){
         $(img_preview).append(" <img/>");
         var imgObjPreview = img_preview.children[i];
         if (this.files && this.files[i]) {
             imgObjPreview.src = window.URL.createObjectURL(this.files[i]);
         }
     }
 })