<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2019/9/6
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/vendor/jquery-1.12.3.min.js"></script>


<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="header-top">
    <div class="container">
        <div class="row">
            <c:if test="${empty sessionScope.userLogin}">
                <div class="header-top-left col-sm-6">
                    <ul class="header-login-reg float-left">
                        <li><a href="${pageContext.request.contextPath}/page/login.jsp">登录</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/userRegieterjsp.do">注册</a></li>
                    </ul>
                </div>

                <div class="header-top-right col-sm-6">
                    <ul class="language-currency float-right">
                        <li><a href="${pageContext.request.contextPath}/page/admin/login.jsp">登录后台</a></li>

                    </ul>
                </div>
            </c:if>

            <c:if test="${not empty sessionScope.userLogin}">
                <div class="header-top-left col-sm-6">
                    <ul class="header-login-reg float-left">
                        <li><a>欢迎${sessionScope.userLogin.username}登录</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/loginOut.do">退出</a></li>
                    </ul>
                </div>
            <div class="header-top-right col-sm-6">
            <ul class="language-currency float-right">
                <li><a href="#">个人中心<i class="mo-arrow-down"></i></a>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/concern/getMyconern.do">我的关注</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/myProduct.do">我的闲置</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/myInformation.do">我的信息</a></li>
                        <li><a href="${pageContext.request.contextPath}/order/getMyOrder.do">我的订单</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/myPurse.do">我的钱包</a></li>
                    </ul>
                </li>
                <li><a href="${pageContext.request.contextPath}/page/admin/login.jsp">登录后台</a></li>
            </ul>
        </div>
            </c:if>






        </div>
    </div>
</div>

<div class="header-bottom">
    <div class="container">
        <div class="row">
            <!-- Header Logo -->
            <div class="logo col-md-2 col-sm-4 col-xs-5"><a href="${pageContext.request.contextPath}/page/index.html"><${pageContext.request.contextPath}/img src="../img/logo.png" alt="logo" /></a></div>
            <!-- Main Menu -->
            <div class="main-menu col-md-7 hidden-sm hidden-xs">
                <nav>
                    <ul >


                        <li><a href="#">商品分类</a>
                            <!-- Sub Menu -->
                            <ul class="sub-menu" id="myUl">

                            </ul>
                        </li>
                        <li class="active"><a href="${pageContext.request.contextPath}/page/shouye.jsp">首页</a>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/category/getCategory.do">发布商品</a></li>
                        <li><a href="${pageContext.request.contextPath}/needs/getNeedProduct.do">求购信息</a></li>
                    </ul>
                </nav>
            </div>
            <!-- Header Search & Cart -->
            <div class="search-cart col-md-3 col-md-offset-0 col-sm-5 col-sm-offset-3 col-xs-7">

                <!-- Header Search -->
                <div class="header-search float-right">
                    <button class="search-btn"><i class="mo-search"></i></button>
                    <form action="${pageContext.request.contextPath}/product/likeProduct.do" class="search-form" method="post">
                        <input type="text" name="productName" placeholder="请输入商品名称" />
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


</body>

<script type="text/javascript">
    $(function(){
        // 页面加载函数就会执行：
        // 页面加载，异步查询字典数据：
        // 加载客户来源

        $.post("${pageContext.request.contextPath }/category/getAllCategory.do",function(data){

            // 遍历json的数据:
            $.each(data,function (i,n) {
                $("#myUl").append(
                    "<li><a href='${pageContext.request.contextPath}/product/getAllProductBycid.do?cid="+n.cid+"'>"+n.cname+"<a></li>"
                )

            });

        },"json");
    });
</script>
</html>
