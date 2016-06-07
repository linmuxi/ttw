<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>平面设计</title>
    <link href="../../css/index.css" rel="stylesheet" type="text/css" />
    <link href="../../css/PMDesign.css" rel="stylesheet" type="text/css" />
    <script src="../../js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="../../js/unslider.min.js" type="text/javascript"></script>
    <script src="../../build/template.js"></script>
</head>
<body>
    <script>
        document.body.innerHTML += template('header', { list: ['首页', '平面设计', '建站营销', '虚拟主机', '域名注册', '企业邮箱', '项目案例', '会员中心'], Hlink: ["index.htm", "html/Design.html", "html/Station.htm", "html/Virtual.htm", "html/Domain.htm", "html/Mailbox.html", "html/Project.html", "html/Member.htm"] });
    </script>
    <div class="Opacity" id="op"></div>
    <div class="main">
        <div class="Pos">
            <div class="PosIcon"></div>
            <div class="PosOne">当前位置：</div>
            <div class="PosOne">平面设计</div>
        </div>
        <div class="Choose">请填写您的挂历仿制设计需求</div>
        <div class="Need">
            <div class="NeedTit">填写设计需求</div>
            <div class="NeedMod" id="btn">
                <div class="NeedIcon"></div>
                查看需求范本
            </div>
        </div>
        <div class="Fill">
            <div class="FillBox" id="fb">
                <div class="FB_Tit">平面设计需求范本</div>
                <div class="FB_Con">
                    <p>公司名称：XXX咖啡吧</p>
                    <p>经营范围：咖啡，酒，饮料等.</p>
                    <p>参考样本：星巴克（根据自身情况而定）</p>
                    <p>主要用途：设计logo应用到店面，餐具，名片等（根据自身情况而定）</p><br />
                    <p>具体要求：</p>
                    <p>一，设计要求：</p>
                    <p>1.设计要求主题突出，寓意深刻。</p>
                    <p>2.表现要求简约大气，轻松愉快。</p>
                    <p>3.作品风格、形式不限，但必须原创。</p>
                    <p>4.设计规格为大度16开（210X285mm）。（根据自身情况而定）</p>
                    <p>5.必须是彩色原稿，能以不同的比例尺寸清晰显示。</p><br />
                    <p>知识产权说明：</p>
                    <p>1.所设计的作品为原创，为第一次发布。未侵犯他人的著作权。如有侵犯他</p>
                    <p>人著作权，有设计者承担所有法律责任。</p>
                    <p>2.中标的设计作品，我方支付设计制作费。即拥有该作品的知识产权，包括</p>
                    <p>著作权、使用权和发布权等，并有权对设计作品进行修改、组合和应用，设</p>
                    <p>计者不得再向其他任何地方使用该设计作品。</p>
                </div>
            </div>
            <div class="FillStar">*</div>
            <input type="text" class="FillTit" placeholder="对橙色龙风格2014挂历模板进行修改" />
            <textarea class="FillMain" placeholder="告诉我们您的具体想法，希望的效果和设计类型。您也可以通过附件方式上传自己喜欢的设计供设计师参考，或者从我们已有的模板块中挑选一个可作为参考的设计。"></textarea>
            <div class="FillBtn">
                <div class="FB_Add">添加附件</div>
                <div class="FB_UP">上传附件</div>
            </div>
            <div class="FillPS">您可以讲文案、文档、LOGO、参考图等会使用到的信息以附件形式上传</div>
        </div>
    </div>
    <script>
        function $(id) { return document.getElementById(id); }
        window.onload = function () {
            document.onclick = function (e) {
                $("fb").style.display = "none";
                $("op").style.display = "none";
            }
            $("btn").onclick = function (e) {
                $("fb").style.display = "block";
                $("op").style.display = "block";
                stopFunc(e);
            }
            $("fb").onclick = function (e) {
                stopFunc(e);
            }
        }
        function stopFunc(e) {
            document.all ? event.cancelBubble = true : e.stopPropagation();
        }
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


