package com.HotelSystem.dao;

import com.HotelSystem.entity.Log;
import com.HotelSystem.entity.LogExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Log的数据访问接口
 *
 * @author 关文聪
 * @version 1.0
 * @email 530711667@qq.com
 */

public interface LogDao {
    long countByExample(LogExample example);

    int deleteByExample(LogExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Log record);

    int insertSelective(Log record);

    List<Log> selectByExample(LogExample example);

    Log selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Log record, @Param("example") LogExample example);

    int updateByExample(@Param("record") Log record, @Param("example") LogExample example);

    int updateByPrimaryKeySelective(Log record);

    int updateByPrimaryKey(Log record);
}