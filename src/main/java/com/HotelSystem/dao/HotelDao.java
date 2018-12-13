package com.HotelSystem.dao;

import com.HotelSystem.entity.Hotel;
import com.HotelSystem.entity.HotelExample;

import java.util.List;

import com.HotelSystem.entity.Total;
import org.apache.ibatis.annotations.Param;

public interface HotelDao {
    long countByExample(HotelExample example);

    int deleteByExample(HotelExample example);

    int deleteByPrimaryKey(Integer hotelId);

    int insert(Hotel record);

    int insertSelective(Hotel record);

    List<Hotel> selectByExample(HotelExample example);

    Hotel selectByPrimaryKey(Integer hotelId);

    int updateByExampleSelective(@Param("record") Hotel record, @Param("example") HotelExample example);

    int updateByExample(@Param("record") Hotel record, @Param("example") HotelExample example);

    int updateByPrimaryKeySelective(Hotel record);

    int updateByPrimaryKey(Hotel record);

    List<Total> selectByPrimaryKeyWithRoomType(Integer hotelId);

    List<Total> selectHotelAveragePrice();

    List<Total> selectHotelAveragePriceWithDate(String SearchDate);

    List<Total> selectHotelAveragePriceWithRoomtype();

    List<Total> selectHotelAveragePriceWithRoomtypeWithDate(String startDate, String leaveDate, Integer require);

    List<Total> selectHotelAveragePriceWithAllType();

    List<Total> selectHotelAveragePriceWithAllTypeWithDate(String StartDate, String leaveDate, Integer require);

    Total getRoomidByRoomname(String hotelName);

    Total getMaxOrderId();

    void insertIntoOrder(String orderid, String roomid, String startDate, String leaveDate, String amount, String payment, String createDate);

    void minusRemain(String amount, String startDate, String leaveDate, String roomId);
}