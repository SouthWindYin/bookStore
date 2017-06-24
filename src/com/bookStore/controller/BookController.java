package com.bookStore.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.bookStore.model.BookInfo;
import com.bookStore.service.BookService;

@Controller
public class BookController {
	@Resource
	private BookService bookService;
	
	@ResponseBody
	@RequestMapping("/hotBook.action")
	public ModelAndView hotBook(){
		return new ModelAndView(new MappingJackson2JsonView(),"hotList", bookService.getHotBookInfo());
	}
}
