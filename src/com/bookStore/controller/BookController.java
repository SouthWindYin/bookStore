package com.bookStore.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

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
	public ModelAndView hotBook() {
		return new ModelAndView(new MappingJackson2JsonView(), "hotList", bookService.getHotBookInfo());
	}

	@RequestMapping("/admin/bookInfoManage.do")
	public ModelAndView bookManage() {
		ModelAndView mov = new ModelAndView("/admin/bookInfoManage.jsp");
		List<BookInfo> bookInfoList = bookService.getAllBookInfo();
		mov.addObject("bookInfoList", bookInfoList);

		return mov;
	}

	@RequestMapping("/allBook.action")
	public ModelAndView allBook(int page) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("bookList", bookService.getBookInfoByPage(page));
		resultMap.put("page", page);
		resultMap.put("pageSum",bookService.getPageSum());
		return new ModelAndView(new MappingJackson2JsonView(), resultMap);
	}

	@RequestMapping("/admin/createBookInfoSubmit.action")
	public ModelAndView createBookInfoSubmit(String title, String booktype, String description, String author,
			String keyword, String language, Date publishtime) {
		ModelAndView mov = new ModelAndView("redirect:/admin/bookInfoManage.do");
		BookInfo bi = new BookInfo();
		bi.setAuthor(author);
		bi.setTitle(title);
		bi.setBookType(booktype);
		bi.setCollectionType(1);
		bi.setDescription(description);
		bi.setKeyword(keyword);
		bi.setPublishTime(publishtime);
		bi.setLanguage(language);

		bookService.createBookInfo(bi);

		return mov;
	}

	@RequestMapping("/admin/delBookInfo.action")
	public ModelAndView delUser(int id) {
		ModelAndView mov = new ModelAndView("redirect:/admin/bookInfoManage.do");

		int resultNum = bookService.delBookInfoById(id);
		if (resultNum < 1) {
			mov.addObject("message", "删除图书信息失败");
			return mov;
		}
		return mov;
	}

	@RequestMapping("/admin/editBookInfo.do")
	public ModelAndView editBookInfo(int id) {
		ModelAndView mov = new ModelAndView("/admin/editBookInfo.jsp");
		BookInfo bi = bookService.getBookInfoById(id);
		mov.addObject("book", bi);

		return mov;
	}

	@RequestMapping("/admin/editBookInfoSubmit.action")
	public ModelAndView editBookInfoSubmit(int id, String title, String booktype, String description, String author,
			String keyword, String language, Date publishtime) {
		ModelAndView mov = new ModelAndView("redirect:/admin/bookInfoManage.do");
		BookInfo bi = new BookInfo();
		bi.setId(id);
		bi.setAuthor(author);
		bi.setTitle(title);
		bi.setBookType(booktype);
		bi.setCollectionType(1);
		bi.setDescription(description);
		bi.setKeyword(keyword);
		bi.setPublishTime(publishtime);
		bi.setLanguage(language);

		int resultNum = bookService.updateBookInfo(bi);
		if (resultNum < 1) {
			mov.addObject("message", "修改图书信息失败");
			return mov;
		}

		return mov;
	}

	@RequestMapping("/bookDetail.do")
	public ModelAndView bookDetail(int id) {
		ModelAndView mov = new ModelAndView("/bookDetail.jsp");
		BookInfo bi = bookService.getBookInfoById(id);
		mov.addObject("book", bi);

		return mov;
	}
	
	@ResponseBody
	@RequestMapping("/getBookByBookType.action")
	public ModelAndView getBookByBookType(String bookType,int page){
		HashMap<String ,Object> resultMap =new HashMap<>();
		resultMap.put("bookList", bookService.getBookInfoByBookType(page,bookType));
		resultMap.put("page",page);
		resultMap.put("pageSum",bookService.getPageSumWithBookType(bookType));
		
		return new ModelAndView(new MappingJackson2JsonView(), resultMap );
		
		
	}

}
