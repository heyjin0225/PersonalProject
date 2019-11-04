package member.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

@Component
@RequestMapping(value="/member")
public class MemberController {
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private MemberDTO memberDTO;
	
	//회원가입
	@RequestMapping(value="write", method=RequestMethod.POST)
	public @ResponseBody String write(@ModelAttribute MemberDTO memberDTO) throws Exception {
		memberDAO.write(memberDTO);
		
		return "success";
	}
	
	// 이메일 확인
	@RequestMapping(value="checkEmail", method=RequestMethod.POST)
	public @ResponseBody String checkEmail(@RequestParam String email){
		if(email.equals("")) return "empty";
		
		boolean exist = memberDAO.isCheckEmail(email)!=null;
		
		if(exist) return "exist";
		
		else return "non_exist";
	}
	
	// 아이디 확인
	@RequestMapping(value="checkId", method=RequestMethod.POST)
	public @ResponseBody String checkId(@RequestParam String id){
		if(id.equals("")) return "empty";
		
		boolean exist = memberDAO.isCheckId(id)!=null;
		
		if(exist) return "exist";
		
		else return "non_exist";
	}
	
	// id 찾기
	@RequestMapping(value="findId", method=RequestMethod.POST)
	public @ResponseBody String findId(@ModelAttribute MemberDTO memberDTO) {
		String id = memberDAO.searchId(memberDTO);
		
		return id;
	}
	
	// password 찾기
	@RequestMapping(value="findMember", method=RequestMethod.POST)
	public @ResponseBody String findMember(@RequestParam String id, HttpServletResponse response) throws Exception {
		System.out.println(id);
		
		memberDTO = memberDAO.isCheckId(id);
		
		/*System.out.println(memberDTO);
		System.out.println(memberDAO.login(email, memberDTO.getPwd()));*/
		if(memberDTO==null) {
			return "fail";
		} else if(memberDAO.login(id, memberDTO.getPwd())==null) {
			return "invalid_email";
		} else {
			System.out.println("memberDTO = "+memberDTO);
			memberDAO.find_pw(response, memberDTO);
			
			return "success";
		}
	}
	// 회원 인증
	@RequestMapping(value="approval_member", method=RequestMethod.POST)
	public void approvalMember(@ModelAttribute MemberDTO memberDTO, HttpServletResponse response) throws Exception{
		memberDAO.approvalMember(memberDTO, response);
	}
}
