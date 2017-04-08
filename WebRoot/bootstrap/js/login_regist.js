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
        var login_regist_num_reg=/^[a-zA-Z0-9_]{3,16}$/;
        return this.optional(element) || (login_regist_num_reg.test(value));
    },"以字母开头，包含任意数字、字母、下划线，长度在3-16");

    $.validator.addMethod("login_regist_pwd_reg",function(value,element,params){
        var login_regist_pwd_reg=/^\w{3,16}$/;
        return this.optional(element) || (login_regist_pwd_reg.test(value));
    },"数字,字母,下划线组成的3-16位密码");

    $("form").validate({
        rules:{
            /*登录验证*/
            username_login:{
                required:true,
                login_regist_num_reg:true,
                remote:{
                    url:"/usernameLoginCheck.action",
                    dataType:"json",
                    data:{
                        username:function(){
                            return $("#username_login").val();
                        }
                    },
                    type:"post"
                }
            },
            password_login:{
                required:true,
                login_regist_pwd_reg:true
            },
            
            /*注册验证*/
            username_reg:{
                required:true,
                login_regist_num_reg:true,
                remote:{
                    url:"/userValidationCheck.action",
                    dataType:"json",
                    data:{
                        username:function(){
                            return $("#username_reg").val();
                        }
                    },
                    type:"post"
                }
            },
            password_reg:{
                required:true,
                login_regist_pwd_reg:true,
            },
            password_rep:{
                required:true,
                equalTo:"#password_reg"/*选择器*/
            },
            
            //修改密码验证
            regist_pwd:{
                required:true,
                login_regist_pwd_reg:true,
            },
            regist_repwd:{
            	required:true,
            	equalTo:"#regist_pwd"/*选择器*/
            },
            
            /*充值*/
            bank:{
                required:true,
            },
            money:{
                required:true,
                digits:true,/*大于等于0的数字*/
                min:1/*最小值为1*/
            }
        },
        messages:{
            username_login:{
                required:"请输入正确的用户名",
                remote:"用户不存在"
            },
            password_login:{
                required:"请输入密码"
            },
            username_reg:{
                required:"请输入正确的用户名",
                remote:"用户已存在"
            },
            password_reg:{
                required:"请输入密码"
            },
            password_rep:{
                required:"请再次输入密码",
                equalTo:"两次密码不一致"
            },
            //修改密码
            regist_pwd:{
                required:"请输入密码"
            },
          
            regist_repwd:{
                required:"请输入密码",
                equalTo:"两次密码不一致"
            },
            /*充值*/
            bank:{
                required:"请选择充值来源",
            },
            money:{
                required:"请输入充值金额",
                digits:"充值金额最少为1元",/*大于等于0的数字*/
                min:"充值金额最少为1元"/*最小值为1*/
            }
        },
        submitHandler:function(form){/*表单通过验证后调用的函数，参数是form的DOM元素，serialize()序列化*/
            form.submit();
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