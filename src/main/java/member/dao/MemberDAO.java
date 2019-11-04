package member.dao;

import javax.servlet.http.HttpServletResponse;

import member.bean.MemberDTO;

public interface MemberDAO {
	//로그인
	public MemberDTO login(String id, String pwd);
	//회원가입
	public void write(MemberDTO memberDTO) throws Exception;
	
	public String createKey() throws Exception;
	public int updatePwd(MemberDTO memberDTO);
	//메일 보내기
	public void sendMail(MemberDTO memberDTO, String div) throws Exception;
	//이메일 체크
	public MemberDTO isCheckEmail(String email);
	//아이디 체크
	public MemberDTO isCheckId(String id);
	//회원 인증
	public void approvalMember(MemberDTO memberDTO, HttpServletResponse response) throws Exception;
	//회원 인증 일부분
	public int approval_member(MemberDTO memberDTO) throws Exception;
	
	public MemberDTO changeUserInfo(String id);
	//아이디 찾기
	public String searchId(MemberDTO memberDTO);
	//비밀번호 찾기
	public void find_pw(HttpServletResponse response, MemberDTO memberDTO) throws Exception;
	
}
