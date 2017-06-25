package com.bookStore.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bookStore.mapper.BookInfoMapper;
import com.bookStore.model.BookInfo;
import com.bookStore.model.BookInfoExample;

@Service
public class BookService {
	@Resource
	private BookInfoMapper bookInfoMapper;

	private static int PER_PAGE_DATA_NUM = 8;

	public List<BookInfo> getHotBookInfo() {
		return bookInfoMapper.selectTopBookInfo(10);
	}

	public List<BookInfo> getAllBookInfo() {
		BookInfoExample example = new BookInfoExample();
		// BookInfoExample.Criteria criteria = example.createCriteria();

		return bookInfoMapper.selectByExample(example);
	}

	public void createBookInfo(BookInfo bi) {
		bookInfoMapper.insertSelective(bi);
	}

	public int delBookInfoById(int id) {
		return bookInfoMapper.deleteByPrimaryKey(id);
	}

	public BookInfo getBookInfoById(int id) {
		return bookInfoMapper.selectByPrimaryKey(id);
	}

	public int updateBookInfo(BookInfo bi) {
		return bookInfoMapper.updateByPrimaryKeySelective(bi);
	}

	public List<BookInfo> getBookInfoByPage(int page) {
		return bookInfoMapper.selectBookInfoByPage((page - 1) * PER_PAGE_DATA_NUM, page * PER_PAGE_DATA_NUM);
	}

	public int getPageSum() {
		BookInfoExample example = new BookInfoExample();

		int countData = bookInfoMapper.countByExample(example);
		return countData / PER_PAGE_DATA_NUM + 1;
	}

	public List<BookInfo> getBookInfoByBookType(int page, String bookType) {
		return bookInfoMapper.selectBookInfoByBookType(bookType, (page - 1) * PER_PAGE_DATA_NUM,
				page * PER_PAGE_DATA_NUM );
	}

	public int getPageSumWithBookType(String bookType) {
		BookInfoExample example = new BookInfoExample();
		BookInfoExample.Criteria criteria = example.createCriteria();
		criteria.andBookTypeEqualTo(bookType);
		
		int countData = bookInfoMapper.countByExample(example);
		return countData / PER_PAGE_DATA_NUM + 1;
	}
}
