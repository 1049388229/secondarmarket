<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2019/9/6
  Time: 13:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="en-US">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>我的钱包</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Fav Icon
    ============================================ -->
    <link id="favicon" rel="icon" type="image/png" href="${pageContext.request.contextPath}/img/favicon.ico" />
    <!-- Google web fonts
    ============================================ -->
    <link href='http://fonts.googleapis.com/css?family=Libre+Baskerville:400,400italic,700' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Playfair+Display:400,400italic,700italic,900italic,900,700' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <!-- Style Import CSS
    ============================================ -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/custom-style.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />

    <link rel="icon" href="${pageContext.request.contextPath}/img/logo.jpg" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/purse/css/font-awesome.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/purse/css/userhome.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/purse/css/user.css" />

    <!-- bootstrap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/purse/css/bootstrap.min.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/purse/js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/purse/js/bootstrap.min.js"></script>
    <!-- RS-slider CSS
    ============================================ -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/rs-plugin/css/settings.css" media="screen" />

    <!-- Modernizr JS
    ============================================ -->
    <script src="${pageContext.request.contextPath}/js/vendor/modernizr-2.8.3.min.js"></script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<%@ include file="/page/header.jsp"%>



<!-- Shop Sideabr Product Container
============================================ -->
<div class="top-product">
    <div class="container">
        <div id="cover" style="min-height: 639px;">
            <div id="user_area">
                <!--

                描述：左侧个人中心栏
            -->

                <!--

                描述：右侧内容区域
            -->
                <div id="user_content">

                    <div class="share">

                        <!--

                        描述：关注商品展示
                    -->
                        <h1 style="text-align: center">我的钱包</h1>
                        <hr />
                        <div class="share_content">
                            <div class="story">
                                <form id="myUpAndDwon" class="form-horizontal" role="form" action="${pageContext.request.contextPath}/purse/user/updatePurse" >
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <img  src="${pageContext.request.contextPath}/img/mypurse.jpg" />
                                        </div>
                                        <label  class="col-sm-2 control-label">余额：</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="balance" class="form-control" disabled="disabled" style="border:0px;background:rgba(0, 0, 0, 0); " value="${myPurse.balance}" >
                                        </div>
                                        <label class="col-sm-2 control-label" >充值：</label>
                                        <div class="col-sm-10">
                                            <input name="recharge" type="number" class="form-control recharge" style="border:0px;background:rgba(0, 0, 0, 0); " value="${myPurse.recharge}" data-toggle="tooltip"  title="请输入整数金额！"/>
                                            <%-- value="${myPurse.recharge}"  value="${myPurse.withdrawals}"--%>
                                        </div>
                                        <label  class="col-sm-2 control-label" >提现：</label>
                                        <div class="col-sm-10">
                                            <input name="withdrawals" type="number" class="form-control withdrawals" style="border:0px;background:rgba(0, 0, 0, 0); " value="${myPurse.withdrawals}" data-toggle="tooltip"  title="请输入整数金额！"/>

                                        </div>
                                    </div>
                                    <hr />
                                    <div class="form-group">
                                        <div class="col-sm-offset-4 col-sm-8">
                                            <%--   <a href="<%=basePath%>goods/goodsId/${goodsExtend.goods.id}" class="btn btn-danger">取消支付</a>
                                              <c:if test="${cur_user.money >= goodsExtend.goods.price}"><button type="submit" class="btn btn-info">立即支付</button></c:if>
                                              <c:if test="${cur_user.money < goodsExtend.goods.price}"><button disabled="disabled" class="btn btn-danger">余额不足，请充值！</button></c:if>
                                               --%>
                                            <c:if test="${myPurse.state==null}">
                                                <a  onclick="upAnddown(1)" class="btn btn-danger">立即充值</a>
                                                <a  onclick="upAnddown(2)" class="btn btn-danger">立即提现</a>
                                            </c:if>

                                            <c:if test="${myPurse.state==0}">
                                                <c:if test="${myPurse.recharge!=null}">
                                                    <a   class="btn btn-danger">【申请提现中】,待管理员审核！</a>
                                                </c:if>
                                                <c:if test="${myPurse.withdrawals!=null}">
                                                    <a   class="btn btn-danger">【申请充值中】,待管理员审核！</a>
                                                </c:if>
                                            </c:if>

                                            <c:if test="${myPurse.state==1 or myPurse.state==2}">
                                                <a   class="btn btn-danger btn_mypurse">请点击查看审核结果！</a>
                                            </c:if>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</div>

<!-- jQuery 1.12.3
============================================ -->
<script src="${pageContext.request.contextPath}/js/vendor/jquery-1.12.3.min.js"></script>
<!-- Bootstrap JS
============================================ -->
<script type="text/javascript" src="${pageContext.request.contextPath}//bootstrap.min.js"></script>
<!-- MeanMenu JS
============================================ -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.meanmenu.min.js"></script>
<!-- Slick Carousel JS
============================================ -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/slick.min.js"></script>
<!-- RS-Plugin JS
============================================ -->
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/rs-plugin/rs.home.js"></script>
<!-- Scrollup JS
============================================ -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.scrollup.min.js"></script>
<!-- jQuery UI JS
============================================ -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
<!-- Tree View JS
============================================ -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.treeview.js"></script>
<!-- Nice Scroll JS
============================================ -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.nicescroll.min.js"></script>
<!-- WOW JS
============================================ -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/wow.min.js"></script>
<!-- Google Map APi
============================================ -->
<!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBuU_0_uLMnFM-2oWod_fzC0atPZj7dHlU"></script> -->
<script>
    new WOW().init();
</script>
<!-- Main JS
============================================ -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js"></script>
<script type="text/javascript">
    $(".btn_mypurse").on('click',function(){

        if(1${myPurse.state}!=1){
            var state=1${myPurse.state}

            if(state==10){
                alert("您的申请,还【未审核】！")
            }
            if(state==11){
                alert("您的申请，已审核【不通过】，请联系管理员！")
            }
            if(state==12){
                alert("您的申请，已审核【通过】~")
            }
            if(state==11||state==12){
                /*ajax 修改数据库state==null */
                var id=${myPurse.id};
                $.ajax({
                    url:'${pageContext.request.contextPath}/purse/admin/updatePurseState',
                    type:'GET',
                    data:{id:id},
                    dataType:'json'
                });
                location.reload();
            }
        }
    });
</script>
<script type="text/javascript">

    function upAnddown(num){
        var reg=/^[1-9]\d*$|^0$/;
        if(num==1){
            var Recharge=$(" input[ name='recharge' ] ").val();
            if(Recharge==null || Recharge==""){
                alert("请输入您要充值的金额！")
            }else if(reg.test(Recharge)!=true){
                alert("您输入的金额格式有误，请重新输入！")
            }else{
                $(".withdrawals").val("");
                //提交表单
                $("#myUpAndDwon").submit();
                alert("申请充值成功，等待管理员审核~")
            }

        }
        if(num==2){
            var withdrawals=$(" input[ name='withdrawals' ] ").val();
            if(withdrawals==null || withdrawals==""){
                alert("请输入您要提现的金额！")
            }else if(reg.test(withdrawals)!=true){
                alert("您输入的金额格式有误，请重新输入！")
            }else if(withdrawals>${myPurse.balance}){
                alert("您输入的金额太大，请重新输入！")
            }else{
                $(".Recharge").val("");
                //提交表单
                $("#myUpAndDwon").submit();
                alert("申请提现成功，等待管理员审核~")
            }
        }

    }
</script>
</body>
</html>
