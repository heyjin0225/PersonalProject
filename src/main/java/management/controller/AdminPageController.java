package management.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import fileUpload.realPath.FileUploadRealPath;
import management.bean.CountryInfoDTO;
import management.bean.ReservationPaging;
import management.dao.ManagementDAO;

import member.bean.MemberDTO;
import member.dao.MemberDAO;
import travel.bean.TripDTO;

@Component
@RequestMapping(value = "/adminPage")
public class AdminPageController {
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private MemberDTO memberDTO;
	@Autowired
	private ManagementDAO managementDAO;
	@Autowired
	private ReservationPaging reservationPaging;
	@Autowired
	private TripDTO tripDTO;
	@Autowired
	private CountryInfoDTO countryInfoDTO;
	
/////////////////////////// 메뉴이동 ///////////////////////////

	// 회원 관리 메뉴 이동
	@RequestMapping(value = "memberManagement", method = RequestMethod.GET)
	public ModelAndView memberManagement(HttpSession session) {
		ModelAndView mav = new ModelAndView();

		if (session.getAttribute("memId") != null) {
			mav.addObject("display", "/managementPage/adminPage/adminPage.jsp");
			mav.addObject("myPageBody", "/managementPage/adminPage/memberManagement.jsp");
		} else {
			mav.addObject("display", "/main/body.jsp");
		}
		mav.setViewName("/main/index");

		return mav;
	}
	
	// 회원 관리 메뉴 이동
		@RequestMapping(value = "insertManagement", method = RequestMethod.GET)
		public ModelAndView insertManagement(HttpSession session) {
			ModelAndView mav = new ModelAndView();

			if (session.getAttribute("memId") != null) {
				mav.addObject("display", "/managementPage/adminPage/adminPage.jsp");
				mav.addObject("myPageBody", "/managementPage/adminPage/insertManagement.jsp");
			} else {
				mav.addObject("display", "/main/body.jsp");
			}
			mav.setViewName("/main/index");

			return mav;
		}
	
	// 추천나라관리이동
	@RequestMapping(value = "recommendManagement", method = RequestMethod.GET)
	public ModelAndView recommendManagement(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		if (session.getAttribute("memId") != null) {
			
			List<Map<String,Object>> recommendCountryList = managementDAO.recommendList();
			mav.addObject("recommendCountryList", recommendCountryList);
			mav.addObject("display", "/managementPage/adminPage/adminPage.jsp");
			mav.addObject("myPageBody", "/managementPage/adminPage/recommendManagement.jsp");
		} else {
			mav.addObject("display", "/main/body.jsp");
		}
		mav.setViewName("/main/index");
		return mav;
	}
	// 추천나라관리이동
	@RequestMapping(value = "recommendCountryUpdate", method = RequestMethod.POST)
	public ModelAndView recommendCountryUpdate(HttpSession session, @RequestParam String[] recommendCountrySelect) {
		ModelAndView mav = new ModelAndView();
		managementDAO.recommendCountryDelete();
		for(String value : recommendCountrySelect) {
			managementDAO.recommendCountryRegist(value);
		}
		mav.addObject("display", "/managementPage/adminPage/adminPage.jsp");
		mav.addObject("myPageBody", "/managementPage/adminPage/recommendRegister.jsp");
		mav.setViewName("/main/index");
		return mav;
	}
	


/////////////////////////// 회원 관리 ///////////////////////////

	// 개인회원 조회
	@RequestMapping(value = "getMemberList", method = RequestMethod.POST)
	public ModelAndView getMemberList() {
		List<MemberDTO> memberList = managementDAO.getMemberByType("0");

		ModelAndView mav = new ModelAndView();
		mav.addObject("memberList", memberList);
		mav.setViewName("jsonView");

		return mav;
	}

	// 개인회원 total 조회
	@RequestMapping(value = "getMemberTotal", method = RequestMethod.POST)
	public @ResponseBody String getMemberTotal() {
		return managementDAO.getMemberTotal();
	}

	// 개인회원 삭제
	@RequestMapping(value = "memberDelete", method = RequestMethod.POST)
	public @ResponseBody void memberDelete(@RequestParam String id) {
		managementDAO.memberDelete(id);
	}

	// 개인회원 비밀번호 수정
	@RequestMapping(value = "memberPwdModify", method = RequestMethod.POST)
	public @ResponseBody void memberPwdModify(@RequestParam String id, @RequestParam String modifyPwd) {

		managementDAO.memberPwdModify(id, modifyPwd);
	}
	
	///////////////////////// 나라 관리 ///////////////////////////
		
	// 나라 total 조회
	@RequestMapping(value="getTotalCountry", method=RequestMethod.POST)
	public @ResponseBody String getTotalCountry() {
		return managementDAO.getTotalCountry();
	}
	
	// 나라 이름 조회
	@RequestMapping(value = "getCountryName", method = RequestMethod.POST)
	public ModelAndView getCountryName() {
		List<String> countryNameList = managementDAO.getCountryName();
	
		ModelAndView mav = new ModelAndView();
		mav.addObject("countryNameList", countryNameList);
		mav.setViewName("jsonView");
	
		return mav;
	}
	
	// 나라 리스트 조회
	@RequestMapping(value = "getCountryList", method = RequestMethod.POST)
	public ModelAndView getCountryList(@RequestParam String countryName) {
		//System.out.println("countryName"+countryName);
		List<TripDTO> countryList = managementDAO.getCountryList(countryName);
		ModelAndView mav = new ModelAndView();
		mav.addObject("countryList", countryList);
		mav.setViewName("jsonView");
		
		return mav;
	}

	
	//나라 등록 - 이미지 여러개 선택
	@RequestMapping(value="countryInsert", method=RequestMethod.POST)
	public ModelAndView countryInsert(
			@RequestParam("imageUpload[]") List<MultipartFile> imageUpload, @RequestParam String countryid,
			@RequestParam String countryid2, @RequestParam String cityid, @RequestParam String wordname,
			@RequestParam String cityaddr, @RequestParam String latitud, @RequestParam String longitude,
			@RequestParam String cityinfo, @RequestParam String travelinfo, @RequestParam String climate,
			@RequestParam String visa) {
		
		ModelAndView mav = new ModelAndView();
		System.out.println(latitud + longitude + "경도 위도 들어오나요22222????");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("countryid", countryid);
		map.put("countryid2", countryid2);
		map.put("cityid", cityid);
		map.put("wordname", wordname);
		map.put("cityaddr", cityaddr);
		map.put("latitud", latitud);
		map.put("longitude", longitude);
		map.put("cityinfo", cityinfo);
		map.put("travelinfo", travelinfo);
		map.put("climate", climate);
		map.put("visa", visa);
		
		String fileName = "";
		int su = 0;
		if (!imageUpload.get(0).getOriginalFilename().equals("")) {
			for (int i = 0; i < imageUpload.size(); i++) {
				MultipartFile eachImage = imageUpload.get(i);
				
				String filePath = new FileUploadRealPath().countryImagePath;
				fileName = eachImage.getOriginalFilename();
				
				File file = new File(filePath, fileName);
				map.put("cityimage" + (i + 1), fileName);
				try {
					FileCopyUtils.copy(eachImage.getInputStream(), new FileOutputStream(file));
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (imageUpload.size() == 1) {
				map.put("cityimage" + "2", fileName);
				map.put("cityimage" + "3", fileName);
				map.put("cityimage" + "4", fileName);
				map.put("cityimage" + "5", fileName);
			}
			if (imageUpload.size() == 2) {
				map.put("cityimage" + "3", fileName);
				map.put("cityimage" + "4", fileName);
				map.put("cityimage" + "5", fileName);
			}
			if (imageUpload.size() == 3) {
				map.put("cityimage" + "4", fileName);
				map.put("cityimage" + "5", fileName);
			}
			if (imageUpload.size() == 4) {
				map.put("cityimage" + "5", fileName);
			}
			su = managementDAO.countryInsert_Image(map);
		} else {
			su = managementDAO.countryInsert_Not_Image(map);
		}
	
		
		mav.addObject("su", su);
		mav.addObject("display", "/managementPage/adminPage/adminPage.jsp");
		mav.addObject("myPageBody", "/managementPage/adminPage/insertRegister.jsp");
		mav.setViewName("/main/index");
		return mav;
	}
	
	
	// 나라 삭제
	@RequestMapping(value="countryDelete", method=RequestMethod.POST)
	public @ResponseBody void countryDelete(@RequestParam String wordname) {
		managementDAO.countryDelete(wordname);
	}
	
	
	
	
}
