package com.HotelSystem.controller;

import com.HotelSystem.entity.Msg;
import com.HotelSystem.entity.Total;
import com.HotelSystem.service.impl.OrderServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 控制、处理、实现订单相关的操作
 *
 * @author 关文聪
 * @version 1.0
 * @email 530711667@qq.com
 */
@Controller
public class OrderController {
    @Autowired
    OrderServiceImpl orderServiceImpl;

    @RequestMapping("/orders")
    @ResponseBody
    //pn:pagenumber，即当前页数
    public Msg getOrdersWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
        //pageSize：10，指每页显示的数据数
        PageHelper.startPage(pn, 10);
        List<Total> orders = orderServiceImpl.getOrders();
        //navigatePages：5，指在页面需要连续显示的页码数
        PageInfo page = new PageInfo(orders, 5);
        return Msg.success().add("pageInfo", page);
    }

    //根据搜索栏传进的日期作为参数查询指定日期的信息
    @RequestMapping("/orders/{SearchDate}")
    @ResponseBody
    //pn:pagenumber，即当前页数
    public Msg getOrdersWithDateWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model, @PathVariable("SearchDate") String SearchDate) {
        //pageSize：10，指每页显示的数据数
        PageHelper.startPage(pn, 10);
        List<Total> orders = orderServiceImpl.getOrdersWithDate(SearchDate);
        //navigatePages：5，指在页面需要连续显示的页码数
        PageInfo page = new PageInfo(orders, 5);
        return Msg.success().add("pageInfo", page);
    }
}
