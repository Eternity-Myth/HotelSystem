package com.HotelSystem.service;

import com.HotelSystem.entity.Total;

import java.util.List;

public interface OrderService {
    public List<Total> getOrders();

    public List<Total> getOrdersWithDate(String SearchDate);
}
