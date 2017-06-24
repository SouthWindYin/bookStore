package com.bookStore.mapper;

import com.bookStore.model.BookInfo;
import com.bookStore.model.BookInfoExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BookInfoMapper {
    int countByExample(BookInfoExample example);

    int deleteByExample(BookInfoExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(BookInfo record);

    int insertSelective(BookInfo record);

    List<BookInfo> selectByExample(BookInfoExample example);

    BookInfo selectByPrimaryKey(Integer id);
    
    List<BookInfo> selectTopBookInfo(int num);

    int updateByExampleSelective(@Param("record") BookInfo record, @Param("example") BookInfoExample example);

    int updateByExample(@Param("record") BookInfo record, @Param("example") BookInfoExample example);

    int updateByPrimaryKeySelective(BookInfo record);

    int updateByPrimaryKey(BookInfo record);
}