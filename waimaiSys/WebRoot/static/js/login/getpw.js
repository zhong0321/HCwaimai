var s=false;
var yanzhengma=0;
$(function() {
    //输入框输入时模拟placeholder效果
    var oInput = $(".form-data input");
    oInput.focus(function () {
        $(this).siblings("label").hide();
    });
    oInput.blur(function () {
        if ($(this).val() === "") {
            $(this).siblings("label").show();
        }
    });
    // 输入框内容变化按钮颜色发生变化
    oInput.keyup(function () {
        //手机号正则

        //密码正则
        var pw = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$/;
        //判断当前文本框的ID
        switch ($(this).attr("id")) {
            case "pc_tel":
                iss(this);
                break;
            case "veri-code":
                ssss(this);
                break;
        }
    });

//获取验证码事件
    $(".form-data").delegate(".send","click",function (){
        var phone = $.trim($('#pc_tel').val());
        var ph=$("#pc_tel");
        if (iss(ph)&&checkPhone(phone)){
            $.ajax({
                url: '../Obtain',
                type: 'post',
                data: {"phoneNumber":phone},
                success:function(data){
                    if (data=="false") {
                        alert("系统异常!");
                    } else if(data.length==6){
                        yanzhengma=data;
                    }
                }
            });
            var oTime = $(".form-data .time"),
                oSend = $(".form-data .send"),
                num = parseInt(oTime.text()),
                oEm = $(".form-data .time em");
            $(this).hide();
            oTime.removeClass("hide");
            var timer = setInterval(function () {
                var num2 = num-=1;
                oEm.text(num2);
                if(num2==0){
                    clearInterval(timer);
                    oSend.text("重新发送验证码");
                    oSend.show();
                    oEm.text("120");
                    oTime.addClass("hide");
                }
            },1000);
        }
    });


    $(".next").click(function () {
        var co=$("#veri-code");
        var ph=$("#pc_tel");
        if(iss(ph)&&ssss(co)){
            $("#a").addClass("hide");
            $(".pww").removeClass("hide");
        }
    });
    $(".oks").click(function (){
        var phone= $("#pc_tel").val();
        var pw=$("#pc_pw").val();
        var type=$("#logintype").val();
        if(ispw()){
            $.ajax({
                url: '../updatapw',
                type: 'post',
                data: {"phone":phone,"password":pw,"type":type},
                success:function(data){
                    if (data=="1") {
                        alert("修改成功")
                        window.location.href="../gologin/"+type;
                    } else{
                        alert("修改失败！");
                        window.location.href="../gologin/"+type;
                    }
                }
            });
        }
    });
});

function ispw(){
    var pw=$("#pc_pw").val();
    var pwa=$("#pc_pws").val();
    var pws=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$/;
    if(pw.length===0){
        $(".pc_pw-err").removeClass("hide").find("em").text('请输入密码');
        return false;
    }else if(!pws.test(pw)){
        $(".pc_pw-err").removeClass("hide").find("em").text('请输入正确格式密码');
        return false;
    }else if(pwa.length===0){
        $(".pc_pw-err").addClass("hide");
        $(".pc_pws-err").removeClass("hide").find("em").text('请输入密码');
        return false;
    }else if(pw!=pwa){
        $(".pc_pws-err").removeClass("hide").find("em").text('两次密码不相同');
        return false;
    }else{
        $(".pc_pws-err").addClass("hide");
        return true;
    }
}


function checkPhone(phone){
    var atype=$("#logintype").val();
    $.ajax({
        url: '../checkPhone/'+atype,
        type: 'post',
        data: {"phone":phone},
        async:false,
        success:function(data){
            if (data==="1") {
                s=true;
            } else{
                s=false;
            }
        }
    });
    return s;
}
function iss(ph){
    var phoneval = $(ph).val();
    var phone = /^1[3456789]\d{9}$/;
    if (phoneval === "" || phoneval == null) {
        $('.pc_tel-err').removeClass('hide');
        $('.pc_tel-err em').text('手机号不能为空');
    } else if (!phone.test(phoneval)) {
        $('.pc_tel-err').removeClass('hide');
        $('.pc_tel-err em').text('手机号不合法，请输入正确！');
    }else if(checkPhone(phoneval)){
        $('.pc_tel-err').addClass('hide');
        $('.pc_tel-err em').text('');
        return true;
    }else{
        $('.pc_tel-err').removeClass('hide').find("em").text('手机号未注册');
    }
    return false;
}
function ssss(co){
    var code = $(co).val();
    if (code === "") {
        $('.error').removeClass('hide');
        $('.error').find("em").text('验证码不能为空！');
    } else if (!(code.length === 6)) {
        $('.error').removeClass('hide');
        $('.error em').text('请输入6位数字验证码！');
    }else if (code==yanzhengma) {
        $('.error').addClass('hide');
        return true;
    }
    return false;
}