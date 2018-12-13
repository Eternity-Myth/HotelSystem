<%--
  Created by IntelliJ IDEA.
  User: Eternity-Myth
  Date: 2018/12/10
  Time: 0:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>快速预订酒店</title>
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
                                <a href="/views/hotelinfo.jsp" style="color: #ffffff">酒店信息一览</a>
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
                    <div class="col-md-3" style="margin-top:10px;text-align:center;font-size:20px">快速预订酒店</div>
                </div>
                <div class="col-md-12" style="background-color:rgba(0,0,0,0.7);height:585px;color:#FFFFFF">
                    <div class="col-md-12" style="margin-top:50px;text-align: left;font-size:20px;height: 20px">
                        选择日期与预订数量:
                    </div>
                    <div class="col-md-3" style="margin-top:60px;text-align: right;font-size:20px;height: 20px">
                        <input type="text" class="form-control" placeholder="起始日期：yyyy-mm-dd" id="StartDate"
                               style="width: 200px">
                    </div>
                    <div class="col-md-3" style="margin-top:60px;text-align: left;font-size:20px;height: 20px">
                        <input type="text" class="form-control" placeholder="结束日期：yyyy-mm-dd" id="LeaveDate"
                               style="width: 200px">
                    </div>
                    <div class="col-md-1" style="margin-top:60px;text-align: left;font-size:20px;height: 20px">
                        <input type="text" class="form-control" placeholder="预订数量" id="require"
                               style="width: 90px">
                    </div>
                    <div class="col-md-2" style="margin-top:60px;text-align: center;font-size:20px;height: 20px">
                        <button type="button" class="btn btn-default" id="Confirm_btn">确认</button>
                    </div>
                    <div class="col-md-12" style="margin-top:110px;text-align:left;font-size:20px;height: 80px">
                        请选择酒店及房型：
                        <select id="mySelect" style="width: 300px;color:#000000;text-align: center">
                            <option style="color:#000000;text-align: center"></option>
                        </select>
                    </div>
                    <div class="col-md-12" style="margin-top:130px;text-align: center;font-size:20px;height: 20px">
                        <button type="button" class="btn btn-default" id="Submit_btn">提交订单</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-1" style="background-color:rgba(0,0,0,0.8); height:615px">
            <div class="panel panel-primary leftMenu"
                 style="background-color:transparent; border-color:transparent">
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
                            <a href="#" data-toggle="modal" data-target="#infoCheckModal"
                               style="color: #ffffff">信息</a>
                        </li>
                        <li class="list-group-item" style="background-color:transparent">
                            <a href="#" onclick="sign_out()" style="color: #ffffff">注销</a>
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
<script type="text/javascript">
    // $(function () {
    //
    // });

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

    $("#Confirm_btn").click(function () {
        startDate = $("#StartDate").val().toString();
        leaveDate = $("#LeaveDate").val().toString();
        require = $("#require").val();
        if (startDate.trim().length != 0 && leaveDate.trim().length != 0 && require.length != 0) {
            getHotelAndRoomtype("#mySelect");
        }
        else {
            alert("请填写完整的订单信息！");
        }
    });

    function getHotelAndRoomtype(ele) {
        $(ele).empty();
        $.ajax({
            url: "${APP_PATH}/hotels-price-roomtype" + "/" + startDate + "~" + leaveDate + "*" + require,
            data: "pn=" + 1,
            type: "GET",
            success: function (result) {
                // console.info(result);
                $.each(result.extend.pageInfo.list, function () {
                    var optionEle = $("<option></option>").append(this.hotelName + "-" + this.roomName + "：" + this.price.toString().substring(0, 6) + "RMB");
                    optionEle.appendTo(ele);
                });
            }
        });
    }

    $("#Submit_btn").click(function () {
        startDate = $("#StartDate").val().toString();
        leaveDate = $("#LeaveDate").val().toString();
        require = $("#require").val().toString();
        hotel = $("#mySelect").val().toString();
        if (startDate.trim().length != 0 && leaveDate.trim().length != 0 && require.length != 0 && hotel.trim().length != 0) {
            $.ajax({
                url: "${APP_PATH}/orders-makeorders" + "/" + startDate + "~" + leaveDate + "*" + require,
                contentType: "application/json",
                data: JSON.stringify({
                    "amount": require,
                    "hotelName": hotel
                }),
                dataType: "json",
                type: "POST",
                success: function () {
                    alert("提交订单成功");
                    window.location.reload();
                }
            });
        }
        else {
            alert("请填写完整的订单信息！");
        }
    });

</script>
</body>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<%--<script src="js/jquery-1.11.2.min.js"></script>--%>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<%--<script src="js/bootstrap.js"></script>--%>
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
