package management.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import management.dao.ManagementDAO;
import member.bean.MemberDTO;
import member.dao.MemberDAO;

@Component
@RequestMapping(value="/privatePage")
public class PrivatePageController {	
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private ManagementDAO managementDAO;
	// 하트 리스트
	@RequestMapping(value="heartList", method=RequestMethod.GET)
	public ModelAndView heartList(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/managementPage/privatePage/memberPage.jsp");
		mav.addObject("memberPage", "/managementPage/privatePage/heartList.jsp");
		mav.setViewName("/main/index");
		return mav;
	}
	// 하트 리스트 ajax
	@RequestMapping(value="getHeartList", method=RequestMethod.POST)
	public ModelAndView getHeartList(HttpSession session) {
		System.out.println(session.getAttribute("memId"));
		ModelAndView mav = new ModelAndView();
		List<Map<String,String>> heartList = managementDAO.heartList((String)session.getAttribute("memId"));
		System.out.println(heartList.size());
		
		mav.addObject("heartList", heartList);
		mav.addObject("heartListSize", heartList.size());
		mav.setViewName("jsonView");
		return mav;
	}
	
	//나라가 DB에 존재하는지의 여부
	@RequestMapping(value="checkCountryList", method=RequestMethod.POST)
	public ModelAndView checkCountryList(String wordname) {
		ModelAndView mav = new ModelAndView();
		List<Map<String,String>> checkCountry = managementDAO.checkCountryList(wordname);
		System.out.println(checkCountry.size());
		
		mav.addObject("checkCountrySize", checkCountry.size());
		mav.setViewName("jsonView");
		return mav;
	}

	
	//memberPage에서 email을 받아와 회원정보수정 테이블에 불러온 데이터 출력
	@RequestMapping(value="modifyForm", method=RequestMethod.GET)
	public ModelAndView modifyForm(HttpSession session) {
		MemberDTO memberDTO = memberDAO.isCheckId((String)session.getAttribute("memId"));
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/managementPage/privatePage/memberPage.jsp");
		mav.addObject("memberPage", "/managementPage/privatePage/modifyForm.jsp");
		mav.addObject("memberDTO", memberDTO);
		mav.addObject("memId",(String)session.getAttribute("memId"));
		mav.setViewName("/main/index");
		
		return mav;
	}
	
	// modifyForm에서 넘어온 데이터로 업데이트
	@RequestMapping(value="modify", method=RequestMethod.POST)
	public @ResponseBody String modify(@ModelAttribute MemberDTO memberDTO, HttpSession session) {
		managementDAO.updateInfo(memberDTO);
		memberDTO = memberDAO.changeUserInfo(memberDTO.getId());
		session.setAttribute("memName", memberDTO.getName());
		session.setAttribute("memId", memberDTO.getId());
		
		return "success";
	}
	
	// 회원탈퇴폼 불러내기
	@RequestMapping(value="deleteForm", method=RequestMethod.GET)
	public ModelAndView deleteForm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/managementPage/privatePage/memberPage.jsp");
		mav.addObject("memberPage", "/managementPage/privatePage/deleteForm.jsp");
		mav.setViewName("/main/index");
		return mav;
	}
	
	//회원탈퇴
	@RequestMapping(value="delete", method=RequestMethod.POST)
	public @ResponseBody String delete(String id, String pwd, Model model) {
		System.out.println(id+","+pwd);
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("pwd", pwd);
		
		
		
		managementDAO.userDelete(map);
		
		managementDAO.userHeartDelete(id);
		
		model.addAttribute("memId", id);
		
		return "success";
	}
	
	
	
}
