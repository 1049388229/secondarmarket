<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2019/9/11
  Time: 13:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>校园二手市场</title>
    <META HTTP-EQUIV="Refresh" CONTENT="0;URL=<%=basePath%>product/newsProduct.do">
</head>
<body>
</body>
</html>