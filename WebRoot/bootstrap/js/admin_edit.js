/**
 * Created by yey on 2017/3/20.
 */
$(function () {
    /*go-top快速回顶*/
    $(".go-top").click(function () {
        $(window).scrollTop(0);
    });
    /*获取所有父级地区*/
    getParentsRegion();
    /*input聚焦下拉按钮出现，按钮点击模拟select出现，select点击input获得对应值*/
    $(".edit_select input").focus(function () {
        $(".edit_select_icon").css("display", "block")
    })
    $(".edit_select_icon").click(function () {
        $(".edit-select_ul").slideToggle(500)
    });
    
});


//表单验证
$("form").validate({
    rules:{
        /* user_manage_edit*/
    	name:{
            required:true,          
        },
        username:{
            required:true,          
        },
        password:{
        	required:true,
        },
        phone:{
        	required:true,
        },
        sex:{
        	required:true,
        },  
        /* house_manage_edit*/
        title:{
        	required:true,
        }, 
        size:{
        	required:true,
        },
        address:{
        	required:true,
        },
        rentPrice:{
        	required:true,
        },
        room:{
        	required:true,
        },
        hall:{
        	required:true,
        },
        housetype:{
        	required:true,
        },
        facility:{
        	required:true,
        }, 
        regionName:{
        	required:true,
        }, 
    },
messages:{
	name:{
        required:"姓名不可为空",
    },
    username:{
        required:"姓名不可为空",
    },
    password:{
        required:"密码不可为空！",
    },
    phone:{
        required:"电话不可为空",
    },
    sex:{
        required:"性别不可为空！",
    },
    title:{
        required:"标题不可为空！",
    },
    size:{
        required:"大小不可为空！",
    },
    address:{
    	required:"地址不可为空！",
    },
    rentPrice:{
    	required:"租金不可为空！",
    },
    room:{
        required:"室不可为空",
    },
    hall:{
        required:"厅不可为空！",
    },
    houseType:{
        required:"房屋类型不可为空！",
    },
    facility:{
    	required:"家具类型不可为空！",
    }, 
    regionName:{
    	required:"地区名称！不可为空！",
    }, 
}
})
    
    
function getParentsRegion() {
    $.ajax({
        url: "/admin/getParentsRegion.action",
        success: function (resultList) {
            $.each(resultList, function (index, element) {
                $(".edit_select .edit-select_ul").append("<li id=" + element.id + ">" + element.regionName + "</li>");
            });
            //绑定点击事件
            $(".edit-select_ul li").click(function () {
                $("#parentRegionName").attr("value", $(this).html());
                $("#parentRegionId").attr("value", $(this).attr("id"));
                $(".select_control_label").attr("for", $(this).attr("id"));
                $(".edit-select_ul").slideToggle(500);
                $(".edit_select_icon").css("display", "none");
            });
        }
    });
}

function delSubwayRegion(id){
	window.location.href="/admin/delSubway.action?id="+id;
}

function addSubwayRegion(name){
	window.location.href="/admin/delSubway.action?name="+name;
}




