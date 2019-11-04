package travel.controller;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import fileUpload.realPath.FileUploadRealPath;
import travel.bean.HeartDTO;
import travel.bean.TripDTO;
import travel.bean.TripPaging;
import travel.dao.TripDAO;


@Component
@RequestMapping(value="/travel")
public class TravelController {
	@Autowired
	private TripDTO tripDTO;
	@Autowired
	private TripDAO tripDAO;
	@Autowired
	private TripPaging tripPaging;
	
	/* 여행지 - 국내 */
	@RequestMapping(value="domestic", method=RequestMethod.GET)
	public ModelAndView domestic() {
		ModelAndView mav = new ModelAndView();
			mav.addObject("display", "/travel/domestic.jsp");
			mav.setViewName("/main/index");
		return mav;
	}
	
	/* 여행지 - 해외 */
	@RequestMapping(value="overseas", method=RequestMethod.GET)
	public ModelAndView overseas() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/travel/overseas.jsp");
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping(value="domesticList",method=RequestMethod.POST)
	public ModelAndView domesticList(@RequestParam String countryid) {
		
		List<TripDTO> list = tripDAO.domesticList(countryid);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping(value="overseasList",method=RequestMethod.POST)
	public ModelAndView overseasList(@RequestParam String countryid) {
		
		List<TripDTO> list = tripDAO.overseasList(countryid);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping(value="travel_writeForm",method=RequestMethod.GET)
	public String travel_writeForm(Model model) {
		model.addAttribute("display", "/managementPage/privatePage/memberPage.jsp");
		model.addAttribute("memberPage", "/travel/travel_writeForm.jsp");
		return "/main/index";
	}
	
	//이미지가 하나일떄
	@RequestMapping(value="travel_write",method=RequestMethod.POST)
	public String travel_write(@ModelAttribute TripDTO tripDTO, HttpSession session, @RequestParam MultipartFile Cimg, Model model) {
		tripDTO.setId((String) session.getAttribute("memId"));
		System.out.println(tripDTO);
		String filePath = new FileUploadRealPath().travelImagePath;
		String fileName = Cimg.getOriginalFilename();
		File file = new File(filePath,fileName);
		
		
		try {
			FileCopyUtils.copy(Cimg.getInputStream(), new FileOutputStream(file));//Cimg안에 있는 내용을 file에 복사하기 원한다.
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		tripDTO.setCityimage(fileName);
		
		//DB
		tripDAO.travel_write_image(tripDTO);
		
		model.addAttribute("display", "/travel/travel_write.jsp");
		return "/main/index";
	}
	
	
	//대륙 선택
	@RequestMapping(value="continentList", method=RequestMethod.POST)
	public ModelAndView continentList(@RequestParam String countryid2) {
		System.out.println(countryid2);
		List<TripDTO> list = tripDAO.continentList(countryid2);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	//좋아요 버튼
	@RequestMapping(value="getHeart", method=RequestMethod.POST)
	public ModelAndView getHeart(@RequestParam String heart_id) {
		System.out.println(heart_id);
		ModelAndView mav = new ModelAndView();
		List<HeartDTO> list  = tripDAO.getHeart(heart_id);
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
		
	@RequestMapping(value="insertHeart",method=RequestMethod.POST)
	public ModelAndView insertHeart(@RequestParam Map<String, String> map) {
		ModelAndView mav = new ModelAndView();
		tripDAO.insertHeart(map);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="deleteHeart",method=RequestMethod.POST)
	public ModelAndView deleteHeart(@RequestParam Map<String, String> map) {
		ModelAndView mav = new ModelAndView();
		tripDAO.deleteHeart(map);
		mav.setViewName("jsonView");
		return mav;
	}
}

























