package com.HotelSystem.service.impl;

import com.HotelSystem.dao.HotelDao;
import com.HotelSystem.dao.OrderDao;
import com.HotelSystem.entity.Hotel;
import com.HotelSystem.entity.Total;
import com.HotelSystem.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Order的业务逻辑实现类
 *
 * @author 关文聪
 * @version 1.0
 * @email 530711667@qq.com
 */
@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    OrderDao orderDao;

    @Override
    public List<Total> getOrders() {
        List<Total> orders = orderDao.getOrders();
        return orders;
    }

    @Override
    public List<Total> getOrdersWithDate(String SearchDate) {
        List<Total> orders = orderDao.getOrdersWithDate(SearchDate);
        return orders;
    }
}
