<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2019/9/6
  Time: 13:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="en-US">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>我的信息</title>
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

    <link rel="stylesheet" href="${pageContext.request.contextPath}/biecssjs/css/font-awesome.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/biecssjs/css/userhome.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/biecssjs/css/user.css" />
    <!-- bootstrap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/biecssjs/css/bootstrap.min.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/biecssjs/js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/biecssjs/js/bootstrap.min.js"></script>
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
    <style>
        .error{
            color: red;
        }
    </style>

</head>
<body>
<%@ include file="/page/header.jsp"%>


<!-- Shop Sideabr Product Container
============================================ -->
<div class="blog-page pages">
    <div class="container">
        <div class="row">
            <div class="col-sm-8 col-sm-offset-2">


                        <div class="basic">
                            <form  action="${pageContext.request.contextPath}/user/updateMyInformation.do" method="post" >
                                <h1>修改个人信息</h1><hr />
                                <div class="changeinfo">
                                    <span>姓名：</span>
                                    <input class="in_info" type="text" name="username" placeholder="请输入昵称" value="${myUser.username}"/>
                                </div><hr />
                                <div class="changeinfo">
                                    <span>手机号码：</span>
                                    <input class="in_info" type="text" name="telephone" value="${myUser.telephone}" readonly="true"/>
                                    <span id="checkphone">已验证</span>
                                </div><hr />
                                <div class="changeinfo">
                                    <span>密码：</span>
                                    <input class="in_info" type="text" name="password" value="${myUser.password}" />
                                </div><hr />
                                <div class="changeinfo">
                                    <span>邮箱：</span>
                                    <input class="in_info" type="text" name="email" placeholder="邮箱" value="${myUser.email}"/>
                                </div><hr />
                                <div class="changeinfo">
                                    <span>学号：</span>
                                    <input class="in_info" type="text" name="studentid" placeholder="学号" value="${myUser.studentid}"/>
                                </div><hr />
                                <div class="changeinfo">
                                    <span>院系：</span>

                                    <select name="yid" class="in_info">
                                        <c:forEach items="${yuanXiList}"   var="yuanxi">
                                            <c:if test="${yuanxi.id == myUser.yid}">
                                            <option value="${yuanxi.id}" selected="selected">${yuanxi.yname}</option>
                                            </c:if>
                                            <c:if test="${yuanxi.id != myUser.yid}">
                                                <option value="${yuanxi.id}">${yuanxi.yname}</option>
                                            </c:if>

                                        </c:forEach>
                                    </select>



                                </div><hr />
                                <div class="changeinfo">
                                    <span>注册时间：</span>
                                    <input class="in_info" type="text" name="createdate" placeholder="" value="${myUser.createdate}" readonly="true"/>
                                </div><hr />

                                <input type="hidden" name="user_id" value="${myUser.user_id}">
                                <input type="hidden" name="state"  value="${myUser.state}">
                                <input type="hidden" name="conditions" value="${myUser.conditions}">
                                <input type="submit" class="setting-save" value="保存修改信息" />
                            </form>
                        </div>

            </div>
        </div>
    </div>
</div>
<!-- Footer Area
============================================ -->
<div class="footer-area">
    <!-- Footer Top -->
    <div class="footer-top">
        <div class="container">
            <div class="row">
                <!-- Footer Widget About -->
                <div class="footer-widget footer-widget-about col-md-3 col-sm-5">
                    <img src="${pageContext.request.contextPath}/img/footer-logo.png" alt="" />
                    <p>Lorem ipsum dolor sit amet, consec adipisicing elit, sed do eiusmod empor incididunt oloremque laudantium,</p>
                    <div class="footer-social">
                        <a href="#"><i class="mo-facebook"></i></a>
                        <a href="#"><i class="mo-twitter"></i></a>
                        <a href="#"><i class="mo-google-plus"></i></a>
                        <a href="#"><i class="mo-pinterest"></i></a>
                    </div>
                </div>
                <!-- Footer Widget Address -->
                <div class="footer-widget footer-widget-address col-md-2 col-md-offset-1 col-sm-5 col-sm-offset-2">
                    <h3>address</h3>
                    <p>1025-1035 Park Ave, <br />New York, <br />NY 10028, USA</p>
                    <p>+1 123-456-7890</p>
                    <p>sales@koolinc.com</p>
                </div>
                <!-- Footer Widget Collection -->
                <div class="footer-widget footer-widget-collection col-md-2 col-md-offset-1 col-sm-5">
                    <h3>collection</h3>
                    <ul>
                        <li><a href="#">Men</a></li>
                        <li><a href="#">Women</a></li>
                        <li><a href="#">Kids</a></li>
                        <li><a href="#">Accessories</a></li>
                        <li><a href="#">Sale</a></li>
                        <li><a href="#">Coming Soon</a></li>
                    </ul>
                </div>
                <!-- Footer Widget Shop -->
                <div class="footer-widget footer-widget-shop col-md-2 col-md-offset-1 col-sm-5 col-sm-offset-2">
                    <h3>shop</h3>
                    <ul>
                        <li><a href="single-page.html">About Us</a></li>
                        <li><a href="single-page.html">Shipping Methods</a></li>
                        <li><a href="single-page.html">Career</a></li>
                        <li><a href="contact.html">Contact</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer Bottom -->
    <div class="footer-bottom">
        <div class="container">
            <div class="row">
                <!-- Footer Copyright -->
                <div class="copyright col-sm-6 text-left"><p>&copy; 2016 <a href="#">wilylab</a>. All Rights Reserved</p></div>
                <!-- Footer Payment -->
                <div class="payment col-sm-6 text-right"><img src="${pageContext.request.contextPath}/img/payment.png" alt="payment" /></div>
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

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
<script type="text/javascript">




    jQuery.validator.addMethod("telephone", function(value, element) {
        var length = value.length;
        var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/;
        return this.optional(element) || (length == 11 && mobile.test(value));
    }, "请填写正确的手机号码");




    $(function(){
        $("#myForm").validate({
            rules:{
                "username":{
                    "required":true
                    //"checkUsername":true
                },
                "telephone":{
                    "required":true,
                    "telephone":true,

                },
                "email":{
                    "required":true,
                    "email":true
                },
                "qq":{
                    "required":true,

                }

            },
            messages:{
                "username":{
                    "required":"用户名不能为空",
                    //"checkUsername":"用户名已存在"
                },
                "telephone":{
                    "required":"手机号码不能为空",
                    "telephone":"手机号吗格式不正确",
                },
                "email":{
                    "required":"邮箱不能为空",
                    "email":"邮箱格式不正确"
                },
                "qq":{
                    "required":"QQ不能为空",

                }
            }
        });
    });


</script>

</body>
</html>
