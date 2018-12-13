package com.HotelSystem.service.impl;

import com.HotelSystem.dao.HotelDao;
import com.HotelSystem.entity.Hotel;
import com.HotelSystem.entity.Total;
import com.HotelSystem.service.HotelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Hotel的业务逻辑实现类
 *
 * @author 关文聪
 * @version 1.0
 * @email 530711667@qq.com
 */
@Service
public class HotelServiceImpl implements HotelService {
    @Autowired
    HotelDao hotelDao;

    //查看所有酒店信息
    @Override
    public List<Hotel> getAll() {
        return hotelDao.selectByExample(null);
    }

    @Override
    public List<Total> getHotel(Integer id) {
        List<Total> room_types = hotelDao.selectByPrimaryKeyWithRoomType(id);
        return room_types;
    }

    @Override
    public List<Total> getPrice() {
        List<Total> prices = hotelDao.selectHotelAveragePrice();
        return prices;
    }

    @Override
    public List<Total> getPriceWithDate(String SearchDate) {
        List<Total> prices = hotelDao.selectHotelAveragePriceWithDate(SearchDate);
        return prices;
    }

    @Override
    public List<Total> getPriceWithRoomtype() {
        List<Total> prices = hotelDao.selectHotelAveragePriceWithRoomtype();
        return prices;
    }

    @Override
    public List<Total> getPriceWithRoomtypeWithDate(String startDate, String leaveDate, Integer require) {
        List<Total> prices = hotelDao.selectHotelAveragePriceWithRoomtypeWithDate(startDate, leaveDate, require);
        return prices;
    }

    @Override
    public List<Total> getPriceWithAllType() {
        List<Total> prices = hotelDao.selectHotelAveragePriceWithAllType();
        return prices;
    }

    @Override
    public List<Total> getPriceWithAllTypeWithDate(String startDate, String leaveDate, Integer require) {
        List<Total> prices = hotelDao.selectHotelAveragePriceWithAllTypeWithDate(startDate, leaveDate, require);
        return prices;
    }

    @Override
    public void makeOrder(String roomName, String startDate, String leaveDate, String amount, String payment) throws IOException {
        String orderid = (hotelDao.getMaxOrderId().getOrderId()).toString();
        String roomid = hotelDao.getRoomidByRoomname(roomName).getRoomId().toString();
        String createDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        hotelDao.insertIntoOrder(orderid, roomid, startDate, leaveDate, amount, payment, createDate);
        hotelDao.minusRemain(amount, startDate, leaveDate, roomid);
//        File f = new File("D:\\test.txt");
//        FileOutputStream fos = new FileOutputStream(f);
//        OutputStreamWriter ows = new OutputStreamWriter(fos);
//        ows.write(orderid + "\t" + roomid + "\t" + startDate + "\t" + leaveDate + "\t" + amount + "\t" + payment + "\t" + createDate);
//        ows.close();
    }
}
