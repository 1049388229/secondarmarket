<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2019/9/6
  Time: 13:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户登录</title>

    <!-- CSS -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/form-elements.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Favicon and touch icons -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.png">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-57-precomposed.png">

</head>

<script type="text/javascript">

    document.onkeydown=function(e){
        var keycode=document.all?event.keyCode:e.which;
        if(keycode==13)submitlogin();
    };

    function isTelephone(){
        var name=$.trim($("#telephone").val());
        $("#telephone").val(name);
        if(name==""){
            $("#telephonespan").html("手机号码不能为空");
            $("#telephonespan").show();
            return false;
        }else{
            $("#namespan").hide();
            return true;
        }
    }

    function isPwd(){
        var pwd=$.trim($("#password").val());
        $("#password").val(pwd);
        if(pwd.length<6){
            $("#pwdspan").html("密码长度不能小于6位");
            $("#pwdspan").show();
            return false;
        }else{
            $("#pwdspan").hide();
            return true;
        }
    }

    function submitlogin(){
        if(isTelephone()&&isPwd()){
            var phone=$.trim($("#telephone").val());
            var pwd=$.trim($("#password").val());

            var param={};
            param.telephone=phone;
            param.password=pwd;

            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/user/userLogin.do",
                data: param,
                dataType: "json",
                async: false,
                success: function(data){
                    var flag=data.flag;
                    var msg=data.msg;
                    if(flag=="1"){
                        $("#telephonespan").html("手机号码不存在");
                        $("#telephonespan").show();
                    }else if(flag=="2"){
                        $("#pwdspan").html("密码错误");
                        $("#pwdspan").show();
                        $("#telephonespan").hide();
                    }else if(flag=="3"){
                        alert(msg);

                    }else if(flag=="4"){
                        alert(msg);
                    }else if(flag=="5"){
                        alert(msg);
                        window.location.href="${pageContext.request.contextPath}/product/newsProduct.do"

                    }else{
                        alert("系统错误");
                    }
                }
            });
        }
    }
</script>

<body background="${pageContext.request.contextPath}/assets/img/backgrounds/1.jpg" style="background-repeat: no-repeat;background-size: cover">

<!-- Top content -->
<div class="top-content">

    <div class="inner-bg">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2 text">
                    <h1><strong>用户</strong>登录</h1>
                    <div class="description">
                        <p>
                            欢迎登录维度校园二手交易平台
                        </p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3 form-box">

                    <div class="form-bottom">
                        <form role="form"  id="form"  method="post" class="login-form">
                            <div class="form-group">
                                <label class="sr-only" for="telephone">Username</label>
                                <input type="text" name="telephone"  placeholder="手机号码" class="form-username form-control" id="telephone" onblur="isTelephone()">
                                <i id="telephonespan" ></i>
                            </div>
                            <div class="form-group">
                                <label class="sr-only" for="password">Password</label>
                                <input type="password" name="password" placeholder="密码" class="form-password form-control" id="password" onblur="isPwd()">
                                <i id="pwdspan" ></i>
                            </div>
                            <button type="button" class="btn" onclick="submitlogin()">登录</button>

                        </form>
                    </div>
                </div>
            </div>

        </div>
    </div>

</div>


<!-- Javascript -->
<script src="${pageContext.request.contextPath}/assets/js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.backstretch.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/scripts.js"></script>

<!--[if lt IE 10]>
<script src="${pageContext.request.contextPath}/assets/js/placeholder.js"></script>






<![endif]-->

</body>

</html>
