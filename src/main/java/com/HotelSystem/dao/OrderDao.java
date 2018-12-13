package com.HotelSystem.dao;

import com.HotelSystem.entity.Order;
import com.HotelSystem.entity.OrderExample;

import java.util.List;

import com.HotelSystem.entity.Total;
import org.apache.ibatis.annotations.Param;

public interface OrderDao {
    long countByExample(OrderExample example);

    int deleteByExample(OrderExample example);

    int deleteByPrimaryKey(Integer orderId);

    int insert(Order record);

    int insertSelective(Order record);

    List<Order> selectByExample(OrderExample example);

    Order selectByPrimaryKey(Integer orderId);

    int updateByExampleSelective(@Param("record") Order record, @Param("example") OrderExample example);

    int updateByExample(@Param("record") Order record, @Param("example") OrderExample example);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);

    List<Total> getOrders();

    List<Total> getOrdersWithDate(String StartDate);
}