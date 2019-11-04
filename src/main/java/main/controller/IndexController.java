package main.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import main.dao.MainDAO;



@Component
@RequestMapping(value="/main")
public class IndexController {
	@Autowired
	private MainDAO mainDAO;
	
	@RequestMapping(value="index", method=RequestMethod.GET)
	public ModelAndView input(HttpSession session) {  //사용자가 만든 콜백 메소드 
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/main/body.jsp");
		mav.addObject("memId", session.getAttribute("memId"));
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping(value="getRecommendView", method=RequestMethod.POST)
	public ModelAndView recommendView() {
		ModelAndView mav = new ModelAndView();
		List<Map<String, Object>> list = mainDAO.getRecommendView();
		System.out.println(list);
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	
	
	
}
