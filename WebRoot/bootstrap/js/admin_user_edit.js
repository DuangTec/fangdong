$.validator.addMethod("login_regist_num_reg", function (value, element, params) {
    var login_regist_num_reg = /^[a-zA-Z0-9_]{3,16}$/;
    return this.optional(element) || (login_regist_num_reg.test(value));
}, "以字母开头，包含任意数字、字母、下划线，长度在3-16");

$("form").validate({
    //debug用于调试，成功也不进行提交
    /*debug:true,*/
    rules: {
        /*登录验证*/
        owner: {
            required: true,
            login_regist_num_reg: true,
            remote: {
                url: "/usernameLoginCheck.action",
                dataType: "json",
                data: {
                    username: function () {
                        return $("#username_login").val();
                    }
                },
                type: "post"
            }
        }
    },
    messages: {
        owner: {
            required: "请输入正确的用户名",
            remote: "用户不存在"
        }
    },
    submitHandler: function (form) {/*表单通过验证后调用的函数，参数是form的DOM元素，serialize()序列化*/
        form.submit();
    },
    invalidHandler: function (event, vallidator) {/*表单验证失败后调用的函数，event表无效事件*/
        console.log("错误数：" + vallidator.numberOfInvalids())
    },
    showErrors: function (errorMap, errorList) {
        console.log(errorMap);
        this.defaultShowErrors();
    }
});