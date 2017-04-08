/**
 * Created by yey on 2017/4/7.
 */
$(function(){
    /*�������а������У�ǰ��������ԭ��Ҳû����������������������ѡ��һ�����б����Ժ���ҳ����ʾ��ѡ�е��������*/
    $(".save_bank").click(function(){
        if($(".bank_radio input").is(":checked")){
            $(".recharge_bank").html($(".bank_radio input:checked").parents(".bank_radio"));
        }
    })
})
