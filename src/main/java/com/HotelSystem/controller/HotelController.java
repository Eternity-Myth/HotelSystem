package com.HotelSystem.controller;

import com.HotelSystem.dao.Room_TypeDao;
import com.HotelSystem.entity.*;
import com.HotelSystem.service.impl.HotelServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.*;
import java.util.List;

/**
 * 控制、处理、实现酒店相关的操作
 *
 * @author 关文聪
 * @version 1.0
 * @email 530711667@qq.com
 */
@Controller
public class HotelController {
    @Autowired
    HotelServiceImpl hotelServiceImpl;

    @RequestMapping("/hotels-list")
    @ResponseBody
    //pn:pagenumber，即当前页数
    public Msg getHotelsWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
        //pageSize：10，指每页显示的数据数
        PageHelper.startPage(pn, 10);
        List<Hotel> hotels = hotelServiceImpl.getAll();
        //navigatePages：5，指在页面需要连续显示的页码数
        PageInfo page = new PageInfo(hotels, 5);
        return Msg.success().add("pageInfo", page);
    }


    //根据id查询酒店信息
    @RequestMapping(value = "/hotel/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Msg getField(@PathVariable("id") Integer id) {
        List<Total> room_types = hotelServiceImpl.getHotel(id);
        return Msg.success().add("room_types", room_types);
    }

    @RequestMapping("/hotels-price")
    @ResponseBody
    //pn:pagenumber，即当前页数
    public Msg getHotelPriceWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
        //pageSize：10，指每页显示的数据数
        PageHelper.startPage(pn, 10);
        List<Total> prices = hotelServiceImpl.getPrice();
        //navigatePages：5，指在页面需要连续显示的页码数
        PageInfo page = new PageInfo(prices, 5);
        return Msg.success().add("pageInfo", page);
    }


    //根据搜索栏传进的日期作为参数查询指定日期的信息
    @RequestMapping("/hotels-price/{SearchDate}")
    @ResponseBody
    //pn:pagenumber，即当前页数
    public Msg getHotelPriceWithDateWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model, @PathVariable("SearchDate") String SearchDate) {
        //pageSize：10，指每页显示的数据数
        PageHelper.startPage(pn, 10);
        List<Total> prices = hotelServiceImpl.getPriceWithDate(SearchDate);
        //navigatePages：5，指在页面需要连续显示的页码数
        PageInfo page = new PageInfo(prices, 5);
        return Msg.success().add("pageInfo", page);
    }

    @RequestMapping("/hotels-price-roomtype")
    @ResponseBody
    //pn:pagenumber，即当前页数
    public Msg getHotelPriceWithRoomtypeWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
        //pageSize：10，指每页显示的数据数
        PageHelper.startPage(pn, 10);
        List<Total> prices = hotelServiceImpl.getPriceWithRoomtype();
        //navigatePages：5，指在页面需要连续显示的页码数
        PageInfo page = new PageInfo(prices, 5);
        return Msg.success().add("pageInfo", page);
    }

    @RequestMapping("/hotels-price-roomtype/{parameters}")
    @ResponseBody
    //pn:pagenumber，即当前页数
    public Msg getHotelPriceWithRoomtypeWithDateWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model, @PathVariable("parameters") String parameters) {
        //pageSize：10，指每页显示的数据数
        PageHelper.startPage(pn, 10);
        String startDate = parameters.substring(0, parameters.indexOf("~"));
        String leaveDate = parameters.substring(parameters.indexOf("~") + 1, parameters.indexOf("*"));
        Integer require = Integer.parseInt(parameters.substring(parameters.indexOf("*") + 1));
        List<Total> prices = hotelServiceImpl.getPriceWithRoomtypeWithDate(startDate, leaveDate, require);
        //navigatePages：5，指在页面需要连续显示的页码数
        PageInfo page = new PageInfo(prices, 5);
        return Msg.success().add("pageInfo", page);
    }

    @RequestMapping("/hotels-price-alltype")
    @ResponseBody
    //pn:pagenumber，即当前页数
    public Msg getHotelPriceWithAlltypeWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
        //pageSize：10，指每页显示的数据数
        PageHelper.startPage(pn, 10);
        List<Total> prices = hotelServiceImpl.getPriceWithAllType();
        //navigatePages：5，指在页面需要连续显示的页码数
        PageInfo page = new PageInfo(prices, 5);
        return Msg.success().add("pageInfo", page);
    }

    @RequestMapping("/hotels-price-alltype/{parameters}")
    @ResponseBody
    //pn:pagenumber，即当前页数
    public Msg getHotelPriceWithAlltypeWithDateWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model, @PathVariable("parameters") String parameters) {
        //pageSize：10，指每页显示的数据数
        PageHelper.startPage(pn, 10);
        String startDate = parameters.substring(0, parameters.indexOf("~"));
        String leaveDate = parameters.substring(parameters.indexOf("~") + 1, parameters.indexOf("*"));
        Integer require = Integer.parseInt(parameters.substring(parameters.indexOf("*") + 1));
        List<Total> prices = hotelServiceImpl.getPriceWithAllTypeWithDate(startDate, leaveDate, require);
        //navigatePages：5，指在页面需要连续显示的页码数
        PageInfo page = new PageInfo(prices, 5);
        return Msg.success().add("pageInfo", page);
    }

    @RequestMapping("/orders-makeorders/{parameters}")
    @ResponseBody
    public Msg MakeOrders(@RequestBody Total orders, @PathVariable("parameters") String parameters) throws IOException {
        String startDate = parameters.substring(0, parameters.indexOf("~"));
        String leaveDate = parameters.substring(parameters.indexOf("~") + 1, parameters.indexOf("*"));
        String roomName = orders.getHotelName().substring(orders.getHotelName().indexOf("-") + 1, orders.getHotelName().indexOf("："));
        String price = orders.getHotelName().substring(orders.getHotelName().indexOf("：") + 1, orders.getHotelName().indexOf("R"));
        String require = orders.getAmount().toString();
        String payment = (Integer.valueOf((int) (Float.parseFloat(price) * Integer.parseInt(require)))).toString();
        hotelServiceImpl.makeOrder(roomName, startDate, leaveDate, require, payment);
        return Msg.success();
    }
}
