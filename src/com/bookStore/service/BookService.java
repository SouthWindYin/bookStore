package com.bookStore.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bookStore.mapper.BookInfoMapper;
import com.bookStore.model.BookInfo;

@Service
public class BookService {
	@Resource
	private BookInfoMapper bookInfoMapper;
	
	public List<BookInfo> getHotBookInfo(){
		return bookInfoMapper.selectTopBookInfo(10);
	}
}
