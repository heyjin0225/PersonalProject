package info.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import info.bean.InfoDTO;
import info.bean.InfoPaging;
import info.dao.InfoDAO;
import member.bean.MemberDTO;

@Component
@RequestMapping(value="/info")
public class InfoController {
	@Autowired
	private InfoDTO infoDTO;
	@Autowired
	private InfoDAO infoDAO;
	@Autowired
	private InfoPaging infoPaging;

	//글쓰기
	@RequestMapping(value="writeForm",method=RequestMethod.GET)
	public String writeForm(Model model) {
		model.addAttribute("display", "/info/writeForm.jsp");
		
		return "/main/index";
	}
	
	//글등록
	@RequestMapping(value="write",method=RequestMethod.POST)
	public String write(@RequestParam Map<String,String> map, HttpSession session, Model model){
		String name = (String)session.getAttribute("memName");
		String id = (String)session.getAttribute("memId");
		String email = (String)session.getAttribute("memEmail");
		
		System.out.println(name+","+id+","+email);
		
		map.put("id",id);
		map.put("name",name);
		map.put("email",email);
		
		
		infoDAO.write(map);
		
		model.addAttribute("pg", "1");
		model.addAttribute("display", "/info/infomation.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="infomation",method=RequestMethod.GET)
	public String infomation(@RequestParam(required=false, defaultValue="1") String pg,  Model model) {
		
		model.addAttribute("pg", pg);
		model.addAttribute("display", "/info/infomation.jsp");
		return "/main/index";
	}
	
	
	@RequestMapping(value="boardList",method=RequestMethod.POST)
	public ModelAndView boardList(@RequestParam(required=false, defaultValue="1") String pg) {
		//1페이지당 5개씩 
		int endNum = Integer.parseInt(pg)*5;
		int startNum = endNum-4;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		List<InfoDTO> list = infoDAO.boardList(map);
		
		//페이징처리
		int totalA = infoDAO.boardTotalA();
		
		infoPaging.setCurrentPage(Integer.parseInt(pg));
		infoPaging.setPageBlock(3);
		infoPaging.setPageSize(5);
		infoPaging.setTotalA(totalA);
		infoPaging.makePagingHTML();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("infoPaging", infoPaging);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
}
