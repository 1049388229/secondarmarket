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
    <title>确认购买</title>
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
            <div class="col-sm-12">
                <div class="cart-page-container fix">

                    <!-- Cart Page Tab Container -->
                    <div class="tab-content">
                        <!-- Cart Page Tab -->
                        <div class="tab-pane active" id="shopping-cart">
                            <div class="cart-page-title text-center"><h1>Shopping Cart</h1></div>

                                <div class="table-responsive">
                                    <fieldset>
                                        <table class="table-cart data-table table" id="shopping-cart-table">
                                            <thead>
                                            <tr>
                                                <th>商品图片</th>
                                                <th>商品名称</th>
                                                <th>商品价格</th>
                                                <th>是否购买</th>
                                                <th>删除</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <C:forEach items="${cart.cartItems}" var="item">
                                            <tr>
                                                <td>
                                                    <div class="cart-items fix">
                                                        <a href="#" class="cart-image"><img src="${pageContext.request.contextPath}/product/${item.product.image}" alt="" /></a>
                                                        <div class="cart-item-content fix">
                                                            <h3 class="title"><a href="#">Popline Tops</a></h3>
                                                            <span>Size : <strong>M</strong></span>
                                                            <span>Color : <strong>Dark Blue</strong></span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td><span class="cart-price">${item.product.name}</span></td>
                                                <!-- inclusive price starts here -->
                                                <td><span class="cart-price">￥${item.product.price}</span></td>
                                                <!--Sub total starts here -->
                                                <td ><a href="${pageContext.request.contextPath}/product/confirmBuy.do?pid=${item.product.id}" class="cart-image">确认购买</a></td>
                                                <td><a href="${pageContext.request.contextPath}/product/removeCartItem.do?pid=${item.product.id}" class="cart-remove"><i class="mo-cross-rounde"></i></a></td>
                                            </tr>
                                            </C:forEach>

                                            </tbody>
                                        </table>
                                    </fieldset>
                                </div>
                                <div class="row">


                                </div>

                        </div>
                        <!-- Cart Page Tab -->
                        <div class="tab-pane" id="check-out">
                            <div class="cart-page-title cart-page-title-2 text-center"><h1>Checkout</h1><p>Personal Information and Payment</p></div>
                            <div class="row">
                                <div class="col-md-6 col-xs-12">
                                    <div class="billing-details">
                                        <div class="cart-page-title"><h1>Billing Details</h1></div>
                                        <div class="checkout-form">
                                            <form action="#" id="billing-details" class="moon-form">
                                                <div class="input-box"><input type="text" placeholder="Frist Name *" /></div>
                                                <div class="input-box"><input type="text" placeholder="Last Name *" /></div>
                                                <div class="input-box"><input type="text" placeholder="Company Name" /></div>
                                                <div class="input-box"><input type="text" placeholder="Email Address *" /></div>
                                                <div class="input-box"><input type="text" placeholder="Phone *" /></div>
                                                <div class="input-box">
                                                    <select name="country">
                                                        <option value="united-states">United States</option>
                                                        <option value="united-states">United States</option>
                                                        <option value="united-states">United States</option>
                                                        <option value="united-states">United States</option>
                                                        <option value="united-states">United States</option>
                                                        <option value="united-states">United States</option>
                                                    </select>
                                                </div>
                                                <div class="input-box"><input type="text" placeholder="Postcode *" /></div>
                                                <div class="input-box"><textarea name="Address" rows="4" placeholder="Address *"></textarea></div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="shipping-details">
                                        <div class="cart-page-title"><h1><a href="#shipping-form" class="collapsed" data-toggle="collapse"><span class="check-box"></span>Ship to Different Addrress?</a></h1></div>
                                        <div class="checkout-form">
                                            <div id="shipping-form" class="collapse moon-form">
                                                <form action="#" id="shipping-details">
                                                    <div class="input-box"><input type="text" placeholder="Frist Name *" /></div>
                                                    <div class="input-box"><input type="text" placeholder="Last Name *" /></div>
                                                    <div class="input-box"><input type="text" placeholder="Company Name" /></div>
                                                    <div class="input-box"><input type="text" placeholder="Email Address *" /></div>
                                                    <div class="input-box"><input type="text" placeholder="Phone *" /></div>
                                                    <div class="input-box">
                                                        <select name="country">
                                                            <option value="united-states">United States</option>
                                                            <option value="united-states">United States</option>
                                                            <option value="united-states">United States</option>
                                                            <option value="united-states">United States</option>
                                                            <option value="united-states">United States</option>
                                                            <option value="united-states">United States</option>
                                                        </select>
                                                    </div>
                                                    <div class="input-box"><input type="text" placeholder="Postcode *" /></div>
                                                    <div class="input-box"><textarea name="Address" rows="4" placeholder="Address *"></textarea></div>
                                                    <div class="input-box"><textarea name="custom" rows="4" placeholder="Inclue custom Requirements for this order"></textarea></div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-xs-12">
                                    <div class="order-details">
                                        <div class="cart-page-title"><h1>Your Order</h1></div>
                                        <div class="table-responsive">
                                            <fieldset>
                                                <table class="order-pro-table table" id="order-pro-table">
                                                    <thead>
                                                    <tr>
                                                        <th><p class="product text-left">Product</p></th>
                                                        <th><p class="total text-right">Total</p></th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <tr>
                                                        <td><h3 class="title text-left">Popline Tops x 2</h3></td>
                                                        <td ><span class="total-price text-right">$ 476.00</span></td>
                                                    </tr>
                                                    <tr>
                                                        <td><h3 class="title text-left">Shanos Matte Blue x 1</h3></td>
                                                        <td ><span class="total-price text-right">$ 356.00</span></td>
                                                    </tr>
                                                    <tr>
                                                        <td><h3 class="title text-left">Minrova Sleep Wear x 1</h3></td>
                                                        <td ><span class="total-price text-right">$ 128.00</span></td>
                                                    </tr>
                                                    </tbody>
                                                    <tfoot>
                                                    <tr>
                                                        <td><p class="cart-total-title text-left">Cart Subtotal <br />Shipping & Handling</p></td>
                                                        <td><span class="cart-total text-right">$ 960.00</span><p class="shipping-charge text-right">free Shipping</p></td>
                                                    </tr>
                                                    <tr>
                                                        <td><p class="vat text-left">Vat</p></td>
                                                        <td><span class="vat-total text-right">$ 144.00</span></td>
                                                    </tr>
                                                    <tr>
                                                        <td><h3 class="grand-total-title text-left">Grand Total</h3></td>
                                                        <td><span class="grand-total text-right">$ 1104.00</span></td>
                                                    </tr>
                                                    </tfoot>
                                                </table>
                                            </fieldset>
                                        </div>
                                        <div class="cart-page-title payment-title"><h1>Payment Method</h1></div>
                                        <div class="payment-methods fix">
                                            <div class="single-payment cheque">
                                                <button class="select-btn active"><span class="check-box"></span>Cheque Payment</button>
                                                <p>Please send your cheque to Store Name, Store Street, Store Town, Store State / County, Store Postcode.</p>
                                            </div>
                                            <div class="single-payment paypal">
                                                <button class="select-btn"><span class="check-box"></span>PayPal</button>
                                                <p>Pay via PayPal you can pay with your credit card if you don’t have a PayPal account.</p>
                                            </div>
                                            <div class="single-payment other">
                                                <div class="wrapper">
                                                    <a href="#" class="paypal"><img src="img/payment/paypal.png" alt="paypal" /></a>
                                                    <a href="#" class="visa"><img src="img/payment/visa.png" alt="visa" /></a>
                                                    <a href="#" class="mastercard"><img src="img/payment/mastercard.png" alt="mastercard" /></a>
                                                    <a href="#" class="express"><img src="img/payment/express.png" alt="express" /></a>
                                                    <a href="#" class="jcb"><img src="img/payment/jcb.png" alt="jcb" /></a>
                                                </div>
                                                <a href="#">What is PayPal?</a>
                                            </div>
                                        </div>
                                        <div class="place-order text-center">
                                            <button class="place-order-btn">Place Order</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Cart Page Tab -->
                        <div class="tab-pane" id="order-complete">
                            <div class="order-complete-mgs text-center">
                                <p>Thank you. Your Order Has been Received.</p>
                            </div>
                            <div class="order-information text-center fix">
                                <div class="single">
                                    <span>Order No</span>
                                    <h4>K 265798</h4>
                                </div>
                                <div class="single">
                                    <span>Date</span>
                                    <h4>Dec 31, 2015</h4>
                                </div>
                                <div class="single">
                                    <span>Total</span>
                                    <h4>$ 1104</h4>
                                </div>
                                <div class="single">
                                    <span>Payment Method</span>
                                    <h4>Check Payment</h4>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 col-xs-12">
                                    <div class="order-details order-details-complete">
                                        <div class="cart-page-title"><h1>Order Details</h1></div>
                                        <div class="table-responsive">
                                            <fieldset>
                                                <table class="order-pro-table table" id="order-pro-table-2">
                                                    <thead>
                                                    <tr>
                                                        <th><p class="product text-left">Product</p></th>
                                                        <th><p class="total text-right">Total</p></th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <tr>
                                                        <td><h3 class="title text-left">Popline Tops x 2</h3></td>
                                                        <td ><span class="total-price text-right">$ 476.00</span></td>
                                                    </tr>
                                                    <tr>
                                                        <td><h3 class="title text-left">Shanos Matte Blue x 1</h3></td>
                                                        <td ><span class="total-price text-right">$ 356.00</span></td>
                                                    </tr>
                                                    <tr>
                                                        <td><h3 class="title text-left">Minrova Sleep Wear x 1</h3></td>
                                                        <td ><span class="total-price text-right">$ 128.00</span></td>
                                                    </tr>
                                                    </tbody>
                                                    <tfoot>
                                                    <tr>
                                                        <td><p class="cart-total-title text-left">Cart Subtotal <br />Shipping & Handling</p></td>
                                                        <td><span class="cart-total text-right">$ 960.00</span><p class="shipping-charge text-right">free Shipping</p></td>
                                                    </tr>
                                                    <tr>
                                                        <td><p class="vat text-left">Vat</p></td>
                                                        <td><span class="vat-total text-right">$ 144.00</span></td>
                                                    </tr>
                                                    <tr>
                                                        <td><h3 class="grand-total-title text-left">Grand Total</h3></td>
                                                        <td><span class="grand-total text-right">$ 1104.00</span></td>
                                                    </tr>
                                                    </tfoot>
                                                </table>
                                            </fieldset>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-xs-12">
                                    <div class="coustomer-details">
                                        <div class="order-com-title"><h1>Customer Details</h1></div>
                                        <div class="content">
                                            <ul>
                                                <li><span>Name :</span>Mellisa Wright</li>
                                                <li><span>Email :</span>mellisa_W80@outlook.com</li>
                                                <li><span>Telephone :</span>+ 123 456 798</li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="billing-address">
                                        <div class="order-com-title"><h1>Billing Address</h1></div>
                                        <div class="content">
                                            <h4>Mellisa Wright</h4>
                                            <p>5722 Sam Houston Cir <br />Austin, TX 78731</p>
                                            <p>Phone : + 123 456 789</p>
                                        </div>
                                    </div>
                                    <div class="billing-address shipping-address">
                                        <div class="order-com-title"><h1>Shipping Address</h1></div>
                                        <div class="content">
                                            <h4>Mellisa Wright</h4>
                                            <p>5722 Sam Houston Cir <br />Austin, TX 78731</p>
                                            <p>Phone : + 123 456 789</p>
                                        </div>
                                    </div>
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
</body>
</html>
