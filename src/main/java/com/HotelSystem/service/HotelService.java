package com.HotelSystem.service;

import com.HotelSystem.entity.Hotel;
import com.HotelSystem.entity.Total;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

public interface HotelService {
    public List<Hotel> getAll();

    public List<Total> getHotel(Integer id);

    public List<Total> getPrice();

    public List<Total> getPriceWithDate(String SearchDate);

    public List<Total> getPriceWithRoomtype();

    public List<Total> getPriceWithRoomtypeWithDate(String startDate, String leaveDate, Integer require);

    public List<Total> getPriceWithAllType();

    public List<Total> getPriceWithAllTypeWithDate(String startDate, String leaveDate, Integer require);

    void makeOrder(String roomName, String startDate, String leaveDate, String amount, String payment) throws IOException;
}
