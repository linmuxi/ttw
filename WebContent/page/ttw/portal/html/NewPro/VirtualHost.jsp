<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>虚拟主机</title>
    <link href="../../css/index.css" rel="stylesheet" type="text/css" />
    <link href="../../css/VirtualHost.css" rel="stylesheet" type="text/css" />
    <script src="../../js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="../../js/unslider.min.js" type="text/javascript"></script>
    <script src="../../build/template.js"></script>
</head>
<body>
    <script>
        document.body.innerHTML += template('header', { list: ['首页', '平面设计', '建站营销', '虚拟主机', '域名注册', '企业邮箱', '项目案例', '会员中心'], Hlink: ["index.htm", "html/Design.html", "html/Station.htm", "html/Virtual.htm", "html/Domain.htm", "html/Mailbox.html", "html/Project.html", "html/Member.htm"] });
    </script>
    <div class="main">
        <div class="Pos">
            <div class="PosIcon"></div>
            <div class="PosOne">当前位置：</div>
            <div class="PosOne">XXX</div>
            <div class="PosTwo">&nbsp;>&nbsp;虚拟主机</div>
        </div>
        <table class="Table" border="1">
            <tr>
                <td>主机类型</td>
                <td colspan="2">特惠套餐A</td>
            </tr>
            <tr>
                <td>申请年限</td>
                <td colspan="2">
                    <select>
                        <option>114元/年</option>
                    </select>
                    <div class="SelPS">多年更优惠</div>
                </td>
            </tr>
            <tr>
                <td>绑定域名</td>
                <td class="Twww">
                    <div>www.</div>
                    <input type="text" />
                </td>
                <td>
                    <p>1.填写您的域名，如：abc.com</p>
                    <p style="float:left;">2.如无域名可以先</p>
                    <p class="wwwPS">注册一个域名</p>
                </td>
            </tr>
            <tr>
                <td>数据库名</td>
                <td>
                    <input type="text" class="TName" />
                </td>
                <td>
                    <p>1.以字母开头</p>
                    <p>2.只能包含字母和数字</p>
                    <p>3.长度3-15位</p>
                </td>
            </tr>
           <!--  <tr>
                <td>数据库密码</td>
                <td>
                    <input type="text" class="TName" />
                </td>
                <td>
                    <p>1.最短要求6位以上</p>
                    <p>2.字母和数字的组合</p>
                    <p>3.建议用系统随机生成的密码</p>
                </td>
            </tr> -->
            <tr>
                <td colspan="3">
                    <div  class="TCheck">
                        <input type="checkbox" />
                        <div>我已阅读并接受</div>
                        <div class="wwwPS">虚拟主机租用协议</div>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <div class="TTips">重要提示：</div><div class="TTipsCon">我司所有虚拟主机禁止低俗（含打擦边球的网站）、木马、WAP、病毒、色情、诈骗、私服相关、外挂、游戏、彩票、视频
                 聊天、成人用品、电影网站、美女图片、同志网站、人体艺术、弓弩刀剑、游戏币交易、药品销售、专科医院、赌博用品、仿品站、减肥丰胸
                 类、警用品、刷钻、刷信誉、钓鱼机票网站、私服游戏外挂等的网络验证系统、侦探公司、黑客安全类、易受攻击影响网络稳定及维文藏文等
                 类型的网站，我司有严格的监控措施，一经发现，立即永久关闭，并不退款！所有国内虚拟主机必须备案成功后才能绑定域名。</div>
                </td>
            </tr>
        </table>
    </div>
    <script>
        var html = template('footer', {});
        document.body.innerHTML += html;
    </script>
</body>
</html>

<script src="../../js/jquery-1.9.1.min.js" type="text/javascript"></script>
            <script type="text/javascript">

                $(document).ready(function () {


                    $(".dropdownDefault,.dropdownContainer .downArrow1").click(function (event) {
                        if ($(this).siblings(".dropdrown-menu").is(":hidden")) {
                            $(".dropdrown-menu").hide();
                            $(this).siblings(".dropdrown-menu").show(10);
                        } else {
                            $(this).siblings(".dropdrown-menu").hide(10);
                        }


                        event.stopPropagation();
                        $(document).click(function () {
                            $(".dropdrown-menu").hide();
                        });
                    });
                    $(".dropdrown-menu li").click(function () {
                        $(this).parent().siblings(".dropdownDefault").html($(this).html());
                        $(this).parent().hide();
                    });
                }); 
    </script>


