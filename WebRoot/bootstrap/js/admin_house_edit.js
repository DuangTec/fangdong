$(function () {
    /*go-top快速回顶*/
    $(".go-top").click(function () {
        $(window).scrollTop(0);
    });
    /*获取所有父级地区*/
    getSonRegion();
    /*input聚焦下拉按钮出现，按钮点击模拟select出现，select点击input获得对应值*/
    $(".edit_select input").focus(function () {
        $(".edit_select_icon").css("display", "block")
    })
    $(".edit_select_icon").click(function () {
        $(".edit-select_ul").slideToggle(500)
    });

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
                            return $("#owner").val();
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
});

function getSonRegion() {
    $.ajax({
        url: "/admin/getSonRegion.action",
        success: function (resultList) {
            $.each(resultList, function (index, element) {
                $(".edit_select .edit-select_ul").append("<li id=" + element.id + ">" + element.regionName + "</li>");
            });
            //绑定点击事件
            $(".edit-select_ul li").click(function () {
                $("#regionName").attr("value", $(this).html());
                $("#regionId").attr("value", $(this).attr("id"));
                $(".select_control_label").attr("for", $(this).attr("id"));
                $(".edit-select_ul").slideToggle(500);
                $(".edit_select_icon").css("display", "none");
            });
        }
    });
}