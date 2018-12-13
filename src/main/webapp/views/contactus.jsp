<%--
  Created by IntelliJ IDEA.
  User: Eternity-Myth
  Date: 2018/12/8
  Time: 19:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>联系我们</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <script type="text/javascript"
            src="${APP_PATH}/js/jquery-3.3.1.js"></script>
    <link
            href="${APP_PATH}/css/font.css"
            rel="stylesheet">
    <script
            src="${APP_PATH}/js/bootstrap.min.js"></script>
    <script src="../js/sign.js"></script>
</head>
<body style="background-image:url(../pics/UIpic/managementbackground.jpg);background-repeat:no-repeat;background-attachment:fixed;background-size: 100%">
<div class="col-md-9">
    <%--<div class="col-md-12 col-md-offset-4" style="margin-top:25px; margin-bottom:20px">--%>
        <%--<img src="../agro/UIpic/agro.png" style="height:50px">--%>
    <%--</div>--%>
    <div class="col-md-8 col-md-offset-4" style="background-color:rgba(80,77,77,0.9);height:100%;color:#FFFFFF">
        <div class="row" style="height:50px">
            <div class="col-md-3" style="margin-top:10px;text-align:center;font-size:20px">联系我们</div>
        </div>
        <div style="font-size:20px"><br>酒店信息管理系统<br><br>电子科技大学 2016级 互联网+ 计算机科学与工程学院<br><br>作者：<br>关文聪<br><br>项目开源地址：<br><a
                href="https://github.com/Eternity-Myth/HotelSystem" style="color:#ffffff">https://github.com/Eternity-Myth/HotelSystem</a> <br><br>邮箱：530711667@QQ.com<br><br>TEL：13590629980<br><br>
        </div>
    </div>
</div>
</body>
</html>