<%--
  Created by IntelliJ IDEA.
  User: Eternity-Myth
  Date: 2018/12/9
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>酒店均价查询</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <script type="text/javascript"
            src="${APP_PATH}/js/jquery-3.3.1.js"></script>
    <link
            href="${APP_PATH}/css/bootstrap.min.css"
            rel="stylesheet">
    <link
            href="${APP_PATH}/css/font.css"
            rel="stylesheet">
    <script
            src="${APP_PATH}/js/bootstrap.min.js"></script>
    <script src="../js/sign.js"></script>
</head>
<body style="background-image:url(../pics/UIpic/managementbackground.jpg);background-repeat:no-repeat;background-attachment:fixed;background-size: 100%">
<%--显示用户信息的模态框--%>
<div class="modal fade" id="infoCheckModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLable1">用户信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-10">
                            <p class="form-control-static">${sessionScope.userName}</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <p class="form-control-static">${sessionScope.userEmail}</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">注册时间</label>
                        <div class="col-sm-10">
                            <p class="form-control-static"><fmt:formatDate value="${sessionScope.registerTime}"
                                                                           pattern="yyyy-MM-dd HH:mm:ss"/></p>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2" style="background-color:rgba(0,0,0,0.8); height:800px">
            <div class="panel-group table-responsive" role="tablist"
                 style="background-color:transparent; border-color:transparent">
                <div class="panel panel-primary leftMenu"
                     style="background-color:transparent; border-color:transparent">
                    <div class="panel-heading" id="collapseListGroupHeading1" data-toggle="collapse"
                         data-target="#collapseListGroup1" role="tab"
                         style="background-color:rgba(0,0,0,0); border-color:transparent; margin-top:20px; text-align:center">
                        <p1 class="panel-title"
                            style="text-align:center;padding-top:30px;height:100px;color:#FFFFFF;font-size:20px;font-family:'Gill Sans', 'Gill Sans MT', 'Myriad Pro', 'DejaVu Sans Condensed', Helvetica, Arial, sans-serif">
                            <img src="../pics/UIpic/home.png" style="height:25px">&nbsp;&nbsp;&nbsp;酒店预订&nbsp;&nbsp;&nbsp;
                        </p1>
                        <span class="glyphicon glyphicon-chevron-up right"></span>
                    </div>
                    <div id="collapseListGroup1" class="panel-collapse collapse in" role="tabpanel"
                         aria-labelledby="collapseListGroupHeading1"
                         style="background-color:transparent; color:#FFFFFF; text-align:center">
                        <ul class="list-group" style="background-color:rgba(95,95,95,0.6)">
                            <li class="list-group-item" style="background-color:transparent">
                                <a href="/views/hotelinfo.jsp" style="color:#ffffff">酒店信息一览</a>
                            </li>
                            <li class="list-group-item" style="background-color:transparent">
                                <a href="/views/hotelprice.jsp" style="color: #ffffff">酒店均价查询</a>
                            </li>
                            <li class="list-group-item" style="background-color:transparent">
                                <a href="/views/sameroomtypequery.jsp" style="color: #ffffff">固定房型查询</a>
                            </li>
                            <li class="list-group-item" style="background-color:transparent">
                                <a href="/views/allroomsquery.jsp" style="color: #ffffff">所有房型查询</a>
                            </li>
                            <li class="list-group-item" style="background-color:transparent">
                                <a href="/views/makeorder.jsp" style="color: #ffffff">快速预订酒店</a>
                            </li>
                            <li class="list-group-item" style="background-color:transparent">
                                <a href="/views/order.jsp" style="color: #ffffff">已售订单查询</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-9">
            <div class="col-md-12" style="background-color:rgba(80,77,77,0.9);height:100%;color:#FFFFFF">
                <div class="row" style="height:50px">
                    <div class="col-md-3" style="margin-top:10px;text-align:center;font-size:20px">酒店均价信息</div>
                    <div class="col-md-5" style="margin-top:10px;text-align:center;font-size:20px"></div>
                    <form class="navbar-form navbar-left" role="search">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="指定日期：yyyy-mm-dd" id="SearchDate">
                        </div>
                        <button type="button" class="btn btn-default" id="Search_btn">搜索</button>
                    </form>
                </div>
                <div class="col-md-12" style="background-color:rgba(0,0,0,0.7);height:585px;color:#FFFFFF">
                    <div class="row">
                        <div class="col-md-12">
                            <table class="table table-hover" id="hotel_table">
                                <thead>
                                <tr style="color: #ffffff">
                                    <th style="text-align:center">酒店名</th>
                                    <th style="text-align:center">日期</th>
                                    <th style="text-align:center">平均价格</th>
                                </tr>
                                </thead>
                                <tbody style="text-align:center; color: #ffffff; background-color: transparent">
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="row" style="position:absolute; bottom:10px; text-align:left">
                        <!--分页文字信息  -->
                        <div class="col-md-12" id="page_info_area"></div>
                    </div>
                </div>
            </div>
            <div class="col-md-12"
                 style="background-color:rgba(80,77,77,0.9);height:50px;color:#FFFFFF;text-align:center"
                 id="page_nav_area">
            </div>
        </div>
        <div class="col-md-1" style="background-color:rgba(0,0,0,0.8); height:800px">
            <div class="panel panel-primary leftMenu" style="background-color:transparent; border-color:transparent">
                <div class="panel-heading" id="collapseListGroupHeadingr" data-toggle="collapse"
                     data-target="#collapseListGroupr" role="tab"
                     style="background-color:rgba(0,0,0,0); border-color:transparent; margin-top:20px; text-align:center">
                    <p1 class="panel-title"
                        style="text-align:center;padding-top:30px;height:100px;color:#FFFFFF;font-size:20px;font-family:'Gill Sans', 'Gill Sans MT', 'Myriad Pro', 'DejaVu Sans Condensed', Helvetica, Arial, sans-serif">
                        <img src="../pics/UIpic/sign.png" style="height:25px">
                    </p1>
                    <span class="glyphicon glyphicon-chevron-up right"></span>
                </div>
                <div id="collapseListGroupr" class="panel-collapse collapse in" role="tabpanel"
                     aria-labelledby="collapseListGroupHeadingr"
                     style="background-color:transparent; color:#FFFFFF; text-align:center">
                    <ul class="list-group" style="background-color:rgba(95,95,95,0.6)">
                        <li class="list-group-item" style="background-color:transparent">
                            <a href="#" data-toggle="modal" data-target="#infoCheckModal" style="color:#ffffff">信息</a>
                        </li>
                        <li class="list-group-item" style="background-color:transparent">
                            <a href="#" onclick="sign_out()" style="color:#ffffff">注销</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div style=" position:absolute;bottom:10px; right:4px; text-align:center;height:60px;color:#FFFFFF;font-size:12px;font-family:'Gill Sans', 'Gill Sans MT', 'Myriad Pro', 'DejaVu Sans Condensed', Helvetica, Arial, sans-serif">
                <img src="../pics/UIpic/contact.png" style="height:25px; margin-bottom:8px">
                <a href="/views/contactus.jsp" style="color: #ffffff">CONTACT&nbsp;US</a>
            </div>
        </div>
    </div>
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<%--<script src="js/jquery-1.11.2.min.js"></script>--%>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<%--<script src="js/bootstrap.js"></script>--%>
<script type="text/javascript">
    var totalPages, currentPage;
    //1、页面加载完成以后，直接去发送ajax请求,要到分页数据
    $(function () {
        //去首页
        to_page(1);
    });

    function to_page(pn) {
        $.ajax({
            url: "${APP_PATH}/hotels-price",
            data: "pn=" + pn,
            type: "GET",
            success: function (result) {
                //1、解析并显示酒店数据
                build_hotel_table(result);
                //2、解析并显示分页信息
                build_page_info(result);
                //3、解析显示分页条数据
                build_page_nav(result);
            }
        });
    }

    function build_hotel_table(result) {
        //清空table表格
        $("#hotel_table tbody").empty();
        var price = result.extend.pageInfo.list;
        $.each(price, function (index, item) {
            var hotelNameTd = $("<td></td>").append(item.hotelName);
            var date = getMyDate(item.date).substring(0, 10);
            var dateTd = $("<td></td>").append(date);
            var avgprice = item.price.toString().substring(0, 6);
            var priceTd = $("<td></td>").append(avgprice);
            //append方法执行完成以后还是返回原来的元素
            $("<tr></tr>").append(hotelNameTd)
                .append(dateTd)
                .append(priceTd)
                .appendTo("#hotel_table tbody");
        });
    }

    //获得年月日      得到日期oTime
    function getMyDate(str) {
        var oDate = new Date(str),
            oYear = oDate.getFullYear(),
            oMonth = oDate.getMonth() + 1,
            oDay = oDate.getDate(),
            oHour = oDate.getHours(),
            oMin = oDate.getMinutes(),
            oSen = oDate.getSeconds(),
            oTime = oYear + '-' + getzf(oMonth) + '-' + getzf(oDay) + ' ' + getzf(oHour) + ':' + getzf(oMin) + ':' + getzf(oSen);//最后拼接时间
        return oTime;
    };

    //补0操作
    function getzf(num) {
        if (parseInt(num) < 10) {
            num = '0' + num;
        }
        return num;
    }

    //解析显示分页信息
    function build_page_info(result) {
        $("#page_info_area").empty();
        $("#page_info_area").append("当前第" + result.extend.pageInfo.pageNum + "页,总" +
            result.extend.pageInfo.pages + "页,总" +
            result.extend.pageInfo.total + "条记录");
        totalPages = result.extend.pageInfo.pages;
        currentPage = result.extend.pageInfo.pageNum;
    }

    //解析显示分页条，点击分页要能去下一页....
    function build_page_nav(result) {
        //page_nav_area
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");
        //构建元素
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if (result.extend.pageInfo.hasPreviousPage == false) {
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        } else {
            //为元素添加点击翻页的事件
            firstPageLi.click(function () {
                to_page(1);
            });
            prePageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum - 1);
            });
        }
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
        if (result.extend.pageInfo.hasNextPage == false) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        } else {
            nextPageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum + 1);
            });
            lastPageLi.click(function () {
                to_page(result.extend.pageInfo.pages);
            });
        }
        //添加首页和前一页 的提示
        ul.append(firstPageLi).append(prePageLi);
        //1,2，3遍历给ul中添加页码提示
        $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if (result.extend.pageInfo.pageNum == item) {
                numLi.addClass("active");
            }
            numLi.click(function () {
                to_page(item);
            });
            ul.append(numLi);
        });
        //添加下一页和末页 的提示
        ul.append(nextPageLi).append(lastPageLi);
        //把ul加入到nav
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }

    $("#Search_btn").click(function () {
        // 1、搜索栏中填写的数据提交给服务器进行保存
        // 2、发送ajax请求查找对应日期的信息
        searchDate = $("#SearchDate").val().toString();
        if (searchDate.trim().length == 0) {
            to_page(1);
        }
        else {
            $.ajax({
                url: "${APP_PATH}/hotels-price" + "/" + searchDate,
                data: "pn=" + 1,
                type: "GET",
                success: function (result) {
                    //1、解析并显示酒店数据
                    build_hotel_table(result);
                    //2、解析并显示分页信息
                    build_page_info(result);
                    //3、解析显示分页条数据
                    build_page_nav(result);
                }
            });
        }
    });

</script>
</body>
<style type="text/css">
    p {
        border-right: thin solid #FFFFFF;
    }

    p1 {
    }

    nav {
        font-family: bradleyhanditcttbold;
        font-size: 15px;
    }
</style>

<script>
    $(function () {
        $(".panel-heading").click(function (e) {
            /*切换折叠指示图标*/
            $(this).find("span").toggleClass("glyphicon-chevron-down");
            $(this).find("span").toggleClass("glyphicon-chevron-up");
        });
    });
</script>
</html>

