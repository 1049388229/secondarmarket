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
    <title>我的订单</title>
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
<div class="pages cart-page">
    <div class="container">
        <div class="row">
            <div class="row">
                <div class="col-sm-12">
                    <div class="section-title text-center"><h1>我的订单</h1></div>
                </div>
            </div>
            <div class="col-sm-12">
                <div class="cart-page-container fix">

                    <!-- Cart Page Tab Container -->

                        <!-- Cart Page Tab -->
                    <c:if test="${buyOrderList.size()==0}">

                    </c:if>
                    <c:if test="${buyOrderList.size()>0}">
                        <div class="tab-pane active" id="shopping-carts">
                            <div class="cart-page-title text-center"><h1>我买的</h1></div>
                            <form action="#" id="cart-forms">
                                <div class="table-responsive">
                                    <fieldset>
                                        <table class="table-cart data-table table" id="shopping-cart-tables">
                                            <thead>
                                            <tr>

                                                <th>商品信息</th>
                                                <th width="50px">订单编号</th>
                                                <th>卖家电话</th>
                                                <th>订单价格</th>
                                                <th>交易地点</th>
                                                <th>交易时间</th>
                                                <th>订单状态</th>
                                                <th>确认收货</th>

                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${buyOrderList}" var="order">

                                                <tr>

                                                    <td><div class="cart-items fix">
                                                        <a href="#" class="cart-image"><img src="${pageContext.request.contextPath}/product/${order.pimage}" alt="" /></a>
                                                        <div class="cart-item-content fix">
                                                            <h3 class="title"><a href="#">${order.pname}</a></h3>
                                                            <h3 class="title"><a href="#">￥${order.pprice}</a></h3>


                                                        </div>
                                                    </div></td>
                                                    <td>${order.oid}</td>

                                                    <td>${order.user.telephone}</td>
                                                    <td>￥${order.order_price}</td>
                                                    <td><span class="cart-price">${order.dealAddress}</span></td>
                                                    <td><span class="cart-price">${order.dealdate}</span></td>
                                                    <c:if test="${order.order_state eq  0}">
                                                        <td><span class="cart-price">待卖家确认</span></td>
                                                        <td><span class="cart-price">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></td>

                                                    </c:if>
                                                    <c:if test="${order.order_state eq  1}">
                                                        <td><span class="cart-price">卖家已确认</span></td>
                                                        <td><input type="button" value="确认收货" onclick="buyConfirmOrder('${order.oid}','${order.sell_uid}')"></td>
                                                    </c:if>

                                                    <c:if test="${order.order_state eq 2}">
                                                        <td><span class="cart-price">已完成</span></td>
                                                    </c:if>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </fieldset>
                                </div>

                            </form>
                        </div>
                    </c:if>



                        <c:if test="${sellOrderList.size()==0}">

                        </c:if>
                    <c:if test="${sellOrderList.size()>0}">
                        <div class="tab-pane active" id="shopping-cart">
                    <div class="cart-page-title text-center"><h1>我卖的</h1></div>
                    <form action="#" id="cart-form">
                        <div class="table-responsive">
                            <fieldset>
                                <table class="table-cart data-table table" id="shopping-cart-table">
                                    <thead>
                                    <tr>

                                        <th>商品信息</th>
                                        <th>订单编号</th>
                                        <th>买家电话</th>
                                        <th>订单价格</th>
                                        <th>交易地点</th>
                                        <th>交易时间</th>
                                        <th>订单状态</th>
                                        <th>确认订单</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${sellOrderList}" var="sellOrder">
                                        <tr>


                                            <td><div class="cart-items fix">
                                                <a href="#" class="cart-image"><img src="${pageContext.request.contextPath}/product/${sellOrder.pimage}" alt="" /></a>
                                                <div class="cart-item-content fix">
                                                    <h3 class="title"><a href="#">${sellOrder.pname}</a></h3>
                                                    <h3 class="title"><a href="#">￥${sellOrder.pprice}</a></h3>
                                                </div>
                                            </div></td>
                                            <td>${sellOrder.oid}</td>

                                            <td>${sellOrder.user.telephone}</td>

                                            <td>￥${sellOrder.order_price}</td>
                                            <td><span class="cart-price">${sellOrder.dealAddress}</span></td>
                                            <td><span class="cart-price">${sellOrder.dealdate}</span></td>
                                            <c:if test="${sellOrder.order_state eq 0}">
                                                <td><span class="cart-price">待确认</span></td>
                                                <td><input type="button" onclick="sellConfirmOrder('${sellOrder.oid}')" name="" value="确认订单"> </td>
                                            </c:if>
                                            <c:if test="${sellOrder.order_state eq 1}">
                                                <td><span class="cart-price">已确认</span></td>
                                            </c:if>
                                            <c:if test="${sellOrder.order_state eq 2}">
                                                <td><span class="cart-price">已完成</span></td>
                                            </c:if>



                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </fieldset>
                        </div>

                    </form>
                </div>
                    </c:if>


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
<script type="text/javascript">
    function sellConfirmOrder(oid) {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/purse/sellConfirmOrders.do",
            data: {"oid":oid},
            dataType: "json",
            async: false,
            success: function(data) {
                var flag = data.flag;
                var msg = data.msg;
                if (flag == "1") {
                    alert(msg);
                    window.location.href="${pageContext.request.contextPath}/order/getMyOrder.do"

                } else if (flag == "2") {
                 alert(msg);
                } else{
                    alert("系统错误");
                }
            }
        });
    }

    function buyConfirmOrder(oid,uid) {
        var param={};
        param.oid=oid;
        param.uid=uid;

        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/purse/confirmProduct.do",
            data: param,
            dataType: "json",
            async: false,
            success: function(data) {
                var flag = data.flag;
                var msg = data.msg;
                if (flag == "1") {
                    alert(msg);
                    window.location.href="${pageContext.request.contextPath}/order/getMyOrder.do"

                } else if (flag == "2") {
                    alert(msg);
                } else{
                    alert("系统错误");
                }
            }
        });
    }
</script>
</body>
</html>







