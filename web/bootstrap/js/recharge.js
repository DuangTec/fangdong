/**
 * Created by yey on 2017/4/7.
 */
$(function(){
    /*更多银行包含银行，前两个就是原本也没看到的那两个；更多里面选择一个银行保存以后在页面显示被选中的这个银行*/
    $(".save_bank").click(function(){
        if($(".bank_radio input").is(":checked")){
            $(".recharge_bank").html($(".bank_radio input:checked").parents(".bank_radio"));
        }
    })
})