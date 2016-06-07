function PopBody(_Type) {
    $(function () { $('<div></div>', { class: 'Pop_Bg' }).appendTo($('body')); });
    $("body").css('overflow', 'hidden');
    $(".Pop_Bg").css('top', $(document).scrollTop());

    switch (_Type) {
        case 'DomainNull': DomainNull("淘桃网提醒您：域名不能为空"); break;
        case 'DomainWrong': DomainNull("淘桃网提醒您：域名格式错误"); ; break;
        case 'Agreement': DomainNull(); ; break;
        case 'CusSer': CusSer(); ; break;
        default: break;
    }
}

function PopStyle(_Div) {
    _Div.css('top', ((parseInt($(document.body)[0].clientHeight) - _Div.height()) / 2) + parseInt($(document).scrollTop()) - 50 + "px");
    _Div.css('left', (parseInt($(document.body)[0].clientWidth) - _Div.width()) / 2 + "px");
}

function DomainNull(_Text) {
    $(function () { $('<div></div>', { class: 'PopDoNull' }).appendTo($('body')); });
    PopStyle($(".PopDoNull"));
    $(function () { $('<div></div>', { class: 'PopDoNull_Top', text: "温馨提示" }).appendTo($('.PopDoNull')); });
    $(function () {
        $('<div></div>', { class: 'PopDoNull_T_Right', text: "X", click: function () {
            $(this).parent().parent().remove();
            $(".Pop_Bg").remove();
            $("body").css('overflow', 'auto');
        }
        }).appendTo($('.PopDoNull_Top'));
    });

    $(function () { $('<div></div>', { class: 'PopDoNull_Cen' }).appendTo($('.PopDoNull')); });

    if (_Text != undefined) {
        var _Con = "<div class='PopDoNull_C_Img'></div><div class='PopDoNull_C_Text'>" + _Text + "</div>";
        var _ButText = "确 定";
    } else {
        var _Text = "<div class='Title'>淘桃网服务协议</div>支付宝服务（以下简称本服务）是由支付宝（中国）网络技术有限公司（以下简称本公司）</br>向支付宝用户提供的支付宝软件系统（以下简称本系统）及(或)附随的货款代收代付的中介</br>服务。 本协议由您和本公司签订。</br>支付宝服务（以下简称本服务）是由支付宝（中国）网络技术有限公司（以下简称本公司）</br>向支付宝用户提供的支付宝软件系统（以下简称本系统）及(或)附随的货款代收代付的中介</br>服务。 本协议由您和本公司签订。</br>支付宝服务（以下简称本服务）是由支付宝（中国）网络技术有限公司（以下简称本公司）</br>向支付宝用户提供的支付宝软件系统（以下简称本系统）及(或)附随的货款代收代付的中介</br>服务。 本协议由您和本公司签订。</br>支付宝服务（以下简称本服务）是由支付宝（中国）网络技术有限公司（以下简称本公司）</br>向支付宝用户提供的支付宝软件系统（以下简称本系统）及(或)附随的货款代收代付的中介</br>服务。 本协议由您和本公司签订。</br>"
        var _Con = "<div class='PopDoNull_C_Div'>" + _Text + "</div>";
        var _ButText = "已经阅读并同意次协议";
    }

    $(function () { $(_Con, {}).appendTo($('.PopDoNull_Cen')); });
    $(function () { $('<div></div>', { class: 'PopDoNull_But', text: _ButText ,click:function () {
        $(this).parent().remove();
        $(".Pop_Bg").remove(); 
        $("body").css('overflow', 'auto');
        protocolCallback();
    }}).appendTo($('.PopDoNull')); });
}

function CusSer() {
    $(function () { $('<div></div>', { class: 'PopCusSer' }).appendTo($('body')); });
    PopStyle($(".PopCusSer"));
    $(function () { $('<div></div>', { class: 'PopCusSer_Top' }).appendTo($('.PopCusSer')); });
    $(function () { $('<div></div>', { class: 'PopCusSer_T_Left' }).appendTo($('.PopCusSer_Top')); });
    $(function () { $('<div></div>', { class: 'PopCusSer_T_L_Img' }).appendTo($('.PopCusSer_T_Left')); });
    $(function () { $('<div></div>', { class: 'PopCusSer_T_L_Text', text: "淘桃网在线客服" }).appendTo($('.PopCusSer_T_Left')); });
    $(function () { $('<div></div>', { class: 'PopCusSer_T_Right' }).appendTo($('.PopCusSer_Top')); });

    $(function () { $('<div></div>', { class: 'PopCusSer_Time' }).appendTo($('.PopCusSer')); });
    $(function () { $('<div></div>', { class: 'PopCusSer_Cen' }).appendTo($('.PopCusSer')); });
    $(function () { $('<div></div>', { class: 'PopCusSer_C_Top' }).appendTo($('.PopCusSer_Cen')); });
    $(function () { $('<div></div>', { class: 'PopCusSer_C_Cen' }).appendTo($('.PopCusSer_Cen')); });
    $(function () { $('<div></div>', { class: 'PopCusSer_C_But', contentEditable: true }).appendTo($('.PopCusSer_Cen')); });

    $(function () { $('<div></div>', { class: 'PopCusSer_But' }).appendTo($('.PopCusSer')); });
    $(function () { $('<div></div>', { class: 'PopCusSer_B_ButOne', text: "发 送" }).appendTo($('.PopCusSer_But')); });
    $(function () { $('<div></div>', { class: 'PopCusSer_B_ButTwo', text: "结束对话" }).appendTo($('.PopCusSer_But')); });



}