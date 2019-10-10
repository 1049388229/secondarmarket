<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2019/9/6
  Time: 11:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="en-US">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>我的关注</title>
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






<div class="top-product">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="section-title text-center"><h1>我的关注</h1></div>
            </div>
        </div>
        <div class="row">
            <!-- Single Product -->
            <c:forEach var="product" items="${list}">
                <div class="col-lg-3 col-md-4 col-md-offset-0 col-sm-5 col-sm-offset-1">
                    <div class="sin-product">
                        <!-- Product Image -->
                        <div class="pro-image">
                            <a href="#"><img src="${pageContext.request.contextPath}/product/${product.image}" alt="product" /></a>
                            <span class="pro-label great-deal">great deals</span>
                            <!-- Product Hover Content -->
                            <div class="pro-hover fix" style="background-image: url('${pageContext.request.contextPath}/product/${product.image}');">
                                <!-- Product Hover Action -->
                                <div class="pro-hover-action animated text-center">

                                    <a href="${pageContext.request.contextPath}/product/getProductBypid.do?pid=${product.id}" class="quick-view pro-action" data-toggle="modal">商品详情</a>
                                    <a href="${pageContext.request.contextPath}/product/deleteMyConcern.do?pid=${product.id}" class="quick-view pro-action" data-toggle="modal">取消关注</a>

                                </div>
                                <!-- Product Hover Options -->
                                <div class="pro-hover-option">
                                    <!-- product Size -->
                                    <div class="pro-size fix">

                                    </div>
                                    <!-- product Color -->
                                    <div class="pro-color fix">

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Product Content -->
                        <div class="pro-content">
                            <div class="top fix">
                                <h3><a href="#">Stripped Wool</a></h3>
                                <p class="price float-right">￥${product.price}</p>
                            </div>
                            <div class="bottom fix">
                                <a href="#" class="pro-cat float-left">${product.name}</a>
                                <div class="ratting float-right">
                                    <i class="mo-star star active"></i>
                                    <i class="mo-star star active"></i>
                                    <i class="mo-star star active"></i>
                                    <i class="mo-star star active"></i>
                                    <i class="mo-star star active"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>




        </div>
        <!-- More Product Link -->
        <div class="more-product col-sm-12 text-center">


        </div>
    </div>
</div>

<!-- Subscribe Area
============================================ -->


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
<!-- Quick View
============================================ -->
<div id="quick-view" class="modal fade">
    <div class="modal-container container">
        <div class="row">
            <div class="col-sm-12">
                <button class="model-close" data-dismiss="modal"><i class="mo-cross"></i></button>
                <!-- Product Container -->
                <div class="pro-info-container fix">
                    <!-- Product Info -->
                    <div class="product-info col-md-6">
                        <!-- Product Info Cat -->
                        <div class="pro-info-cat"><p>Leather Shoe</p></div>
                        <!-- Product Info Title Ratting -->
                        <div class="pro-title-rating fix">
                            <h2>Buttero Casual</h2>
                            <div class="ratting pro-info-ratting float-right">
                                <i class="mo-star star active"></i>
                                <i class="mo-star star active"></i>
                                <i class="mo-star star active"></i>
                                <i class="mo-star star active"></i>
                                <i class="mo-star star active"></i>
                            </div>
                        </div>
                        <!-- Product Info Tab List -->
                        <ul class="pro-info-tab-list">
                            <li class="active"><a href="#description" data-toggle="tab">Description</a></li>
                            <li><a href="#tags" data-toggle="tab">Tags</a></li>
                            <li><a href="#reviews" data-toggle="tab">Reviews</a></li>
                        </ul>
                        <!-- Product Info Tab container -->
                        <div class="pro-info-tab-container tab-content fix">
                            <!-- Product Info Tab -->
                            <div class="pro-info-tab tab-pane active" id="description">
                                <p>These city boots won't let you down when it comes to comfort and practicality. Look manly and trendy on the daily in these versatile lace-up boots.</p>
                                <ul>
                                    <li>Polished Leather</li>
                                    <li>Lace-up boot</li>
                                    <li>Round toe</li>
                                    <li>Felt lining</li>
                                </ul>
                                <div class="pro-color-size fix">
                                    <div class="pro-color">
                                        <h4>Colors:</h4>
                                        <ul>
                                            <li><a href="#">color 1</a></li>
                                            <li><a href="#">color 2</a></li>
                                            <li><a href="#">color 3</a></li>
                                            <li><a href="#">color 4</a></li>
                                        </ul>
                                    </div>
                                    <div class="pro-size">
                                        <h4>Sizes:</h4>
                                        <ul>
                                            <li><a href="#">38</a></li>
                                            <li><a href="#">39</a></li>
                                            <li><a href="#">40</a></li>
                                            <li><a href="#">41</a></li>
                                            <li><a href="#">42</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="pro-info-price fix">
                                    <h1 class="new">$ 259.00</h1>
                                    <h3 class="old">$ 380.00</h3>
                                </div>
                                <div class="pro-info-quantity-cart fix">
                                    <div class="pro-info-quantity float-left fix">
                                        <h3>Quantity</h3>
                                        <div class="cart-plus-minus float-left fix">
                                            <input type="text" value="0" name="qtybutton" class="cart-plus-minus-box">
                                        </div>
                                    </div>
                                    <button class="pro-info-addcart"><i class="mo-cart"></i>Add to Cart</button>
                                </div>
                            </div>
                            <!-- Product Tag Tab -->
                            <div class="pro-tag-tab tab-pane" id="tags">
                                <div class="pro-tag-wrapper">
                                    <a href="#">Leather Shoe</a>
                                    <a href="#">Shoe</a>
                                    <a href="#">Men</a>
                                </div>
                            </div>
                            <!-- Product Review Tab -->
                            <div class="pro-review-tab tab-pane" id="reviews">
                                <div class="pro-review-container">
                                    <div class="sin-pro-review">
                                        <div class="rev-image float-left">
                                            <img src="${pageContext.request.contextPath}/img/comments/1.png" alt="" />
                                        </div>
                                        <div class="rev-content fix">
                                            <div class="rev-head">
                                                <h3>Mingel Hoops</h3>
                                                <span>December 28, 2015 at 3:20 pm</span>
                                                <div class="ratting pro-rev-ratting float-right">
                                                    <i class="mo-star star active"></i>
                                                    <i class="mo-star star active"></i>
                                                    <i class="mo-star star active"></i>
                                                    <i class="mo-star star active"></i>
                                                    <i class="mo-star star active"></i>
                                                </div>
                                            </div>
                                            <p>Morbi accumsan ipsum velit. Nam nec tellus a odio tincidunt auctor a ornare odio. Sed non mauris vitae erat consequat auctor eu in elit.</p>
                                        </div>
                                    </div>
                                    <div class="sin-pro-review">
                                        <div class="rev-image float-left">
                                            <img src="../img/comments/2.png" alt="" />
                                        </div>
                                        <div class="rev-content fix">
                                            <div class="rev-head">
                                                <h3>Mingel Hoops</h3>
                                                <span>December 28, 2015 at 3:20 pm</span>
                                                <div class="ratting pro-rev-ratting float-right">
                                                    <i class="mo-star star active"></i>
                                                    <i class="mo-star star active"></i>
                                                    <i class="mo-star star active"></i>
                                                    <i class="mo-star star active"></i>
                                                    <i class="mo-star star active"></i>
                                                </div>
                                            </div>
                                            <p>Morbi accumsan ipsum velit. Nam nec tellus a odio tincidunt auctor a ornare odio. Sed non mauris vitae erat consequat auctor eu in elit.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="pro-rev-form fix">
                                    <h2>Add your review</h2>
                                    <form action="#" id="rev-form" class="moon-form">
                                        <div class="input-box input-box-2">
                                            <input type="text" placeholder="Name">
                                        </div>
                                        <div class="input-box input-box-2">
                                            <input type="text" placeholder="Email">
                                        </div>
                                        <div class="form-ratting">
                                            <button class="form-sin-ratting float-left">
                                                <i class="mo-star"></i>
                                            </button>
                                            <button class="form-sin-ratting float-left">
                                                <i class="mo-star"></i>
                                                <i class="mo-star"></i>
                                            </button>
                                            <button class="form-sin-ratting float-left">
                                                <i class="mo-star"></i>
                                                <i class="mo-star"></i>
                                                <i class="mo-star"></i>
                                            </button>
                                            <button class="form-sin-ratting float-left">
                                                <i class="mo-star"></i>
                                                <i class="mo-star"></i>
                                                <i class="mo-star"></i>
                                                <i class="mo-star"></i>
                                            </button>
                                            <button class="form-sin-ratting float-left">
                                                <i class="mo-star"></i>
                                                <i class="mo-star"></i>
                                                <i class="mo-star"></i>
                                                <i class="mo-star"></i>
                                                <i class="mo-star"></i>
                                            </button>
                                        </div>
                                        <div class="input-box">
                                            <textarea name="review" id="rev-message" placeholder="Message" rows="5"></textarea>
                                        </div>
                                        <div class="input-box">
                                            <input type="submit" value="Submit">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Product Image -->
                    <div class="product-image col-md-6">
                        <!-- Product Image Tab container -->
                        <div class="pro-image-tab-container tab-content fix">
                            <!-- Product Image Tab -->
                            <div class="pro-image-tab tab-pane" id="image-1">
                                <img src="${pageContext.request.contextPath}/img/pro-details/big-1.jpg" alt="" />
                            </div>
                            <div class="pro-image-tab tab-pane active" id="image-2">
                                <img src="${pageContext.request.contextPath}/img/pro-details/big-2.jpg" alt="" />
                            </div>
                            <div class="pro-image-tab tab-pane" id="image-3">
                                <img src="${pageContext.request.contextPath}/img/pro-details/big-3.jpg" alt="" />
                            </div>
                            <div class="pro-image-tab tab-pane" id="image-4">
                                <img src="${pageContext.request.contextPath}/img/pro-details/big-4.jpg" alt="" />
                            </div>
                        </div>
                        <!-- Product Image Tab List -->
                        <ul class="pro-image-tab-list">
                            <li><a href="#image-1" data-toggle="tab"><img src="${pageContext.request.contextPath}/img/pro-details/1.jpg" alt="" /></a></li>
                            <li class="active"><a href="#image-2" data-toggle="tab"><img src="${pageContext.request.contextPath}/img/pro-details/2.jpg" alt="" /></a></li>
                            <li><a href="#image-3" data-toggle="tab"><img src="${pageContext.request.contextPath}/img/pro-details/3.jpg" alt="" /></a></li>
                            <li><a href="#image-4" data-toggle="tab"><img src="${pageContext.request.contextPath}/img/pro-details/4.jpg" alt="" /></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>





<!-- jQuery 1.12.0
============================================ -->
<script src="${pageContext.request.contextPath}/js/vendor/jquery-1.12.3.min.js"></script>
<!-- Bootstrap JS
============================================ -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
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
<script src="../lib/rs-plugin/rs.home.js"></script>
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