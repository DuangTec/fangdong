/**
 * Created by yey on 2017/2/27.
 */
$(function(){
    /*go-top快速回顶*/
    $(".go-top").click(function(){
        $(window).scrollTop(0);
    });
    /*footer始终在底部*/
    function pageButtomPos(){
        var min_height=900;
        var screen_Height=window.innerHeight;
        /*console.log(screen_Height)*/
        var buttom=document.getElementsByClassName("footer")[0];
        if(screen_Height<min_height){
            buttom.style.top=(min_height-80)+"px";
        }else{
            buttom.style.top=(screen_Height-80)+"px";
        }
    }
    setInterval(pageButtomPos,10);

    /*表单验证插件*/

    $.validator.addMethod("login_regist_num_reg",function(value,element,params){
        var login_regist_num_reg=/^1[0-9]{10}$/;
        return this.optional(element) || (login_regist_num_reg.test(value));
    },"以1开头的11位手机号");

    $.validator.addMethod("login_regist_pwd_reg",function(value,element,params){
        var login_regist_pwd_reg=/^\w{6,10}$/;
        return this.optional(element) || (login_regist_pwd_reg.test(value));
    },"数字,字母,下划线组成的6-10位密码");

    $("form").validate({
        //debug用于调试，成功也不进行提交
        /*debug:true,*/
        rules:{
            /*登录验证*/
            login_num:{
                required:true,
                login_regist_num_reg:true,
                remote:{
                    url:"bootstrap/js/remote.json",
                    type:"post"
                }
            },
            login_pwd:{
                required:true,
                login_regist_pwd_reg:true
            },
            /*注册验证*/
            regist_num:{
                required:true,
                login_regist_num_reg:true,
                remote:{
                    url:"bootstrap/js/remote.json",
                    type:"post"
                }
            },
            regist_pwd:{
                required:true,
                login_regist_pwd_reg:true
            },
            regist_repwd:{
                required:true,
                login_regist_pwd_reg:true,
                equalTo:"#regist_pwd"/*选择器*/
            }
        },
        messages:{
            login_num:{
                required:"请输入正确的手机号",
                remote:"用户不存在"
            },
            login_pwd:{
                required:"请输入密码"
            },
            regist_num:{
                required:"请输入正确的手机号",
                remote:"用户已存在"
            },
            regist_pwd:{
                required:"请输入密码"
            },
            regist_repwd:{
                required:"请再次输入密码",
                equalTo:"两次密码不一致"
            }
        },
        submitHandler:function(form){/*表单通过验证后调用的函数，参数是form的DOM元素，serialize()序列化*/
            console.log($(form).serialize());
        },
        invalidHandler:function(event,vallidator){/*表单验证失败后调用的函数，event表无效事件*/
            console.log("错误数："+vallidator.numberOfInvalids())
        },
        showErrors:function(errorMap,errorList){
            console.log(errorMap);
            this.defaultShowErrors();
        }
    });
})