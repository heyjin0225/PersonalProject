package country.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import management.bean.CountryInfoDTO;
import travel.bean.TripDTO;
import travel.dao.TripDAO;

@Component
@RequestMapping(value="/country")
public class CountryController {
	@Autowired
	private TripDTO tripDTO;
	@Autowired
	private TripDAO tripDAO;
	@Autowired
	private CountryInfoDTO countryInfoDTO;
	
	
	@RequestMapping(value="Korea", method=RequestMethod.GET)
	public ModelAndView korea() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/country/Korea.jsp");
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping(value="KoreaList",method=RequestMethod.POST)
	public ModelAndView KoreaList(@RequestParam String countryid2) {
		
		List<CountryInfoDTO> list = tripDAO.KoreaList(countryid2);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	/*아시아*/
	@RequestMapping(value="Asia", method=RequestMethod.GET)
	public ModelAndView Asia() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/country/Asia.jsp");
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping(value="AsiaList",method=RequestMethod.POST)
	public ModelAndView AsiaList(@RequestParam String countryid2) {
		
		List<CountryInfoDTO> list = tripDAO.AsiaList(countryid2);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	/*유럽*/
	@RequestMapping(value="Europe", method=RequestMethod.GET)
	public ModelAndView Europe() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/country/Europe.jsp");
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping(value="EuropeList", method=RequestMethod.POST)
	public ModelAndView EuropeList(@RequestParam String countryid2) {

		List<CountryInfoDTO> list = tripDAO.EuropeList(countryid2);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	/*중동*/
	@RequestMapping(value="MiddleEast", method=RequestMethod.GET)
	public ModelAndView MiddleEast() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/country/MiddleEast.jsp");
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping(value="MiddleEastList", method=RequestMethod.POST)
	public ModelAndView MiddleEastList(@RequestParam String countryid2) {

		List<CountryInfoDTO> list = tripDAO.MiddleEastList(countryid2);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	/*아프리카*/
	@RequestMapping(value="Africa", method=RequestMethod.GET)
	public ModelAndView Africa() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/country/Africa.jsp");
		mav.setViewName("/main/index");
		
		return mav;
	}
	
	@RequestMapping(value="AfricaList", method=RequestMethod.POST)
	public ModelAndView AfricaList(@RequestParam String countryid2) {
		
		List<CountryInfoDTO> list = tripDAO.AfricaList(countryid2);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	/*북아메리카*/
	@RequestMapping(value="NorthAmerica", method=RequestMethod.GET)
	public ModelAndView NorthAmerica() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/country/NorthAmerica.jsp");
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping(value="NorthAmericaList", method=RequestMethod.POST)
	public ModelAndView NorthAmericaList(@RequestParam String countryid2) {

		List<CountryInfoDTO> list = tripDAO.NorthAmericaList(countryid2);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	/*남아메리카*/
	@RequestMapping(value="SouthAmerica", method=RequestMethod.GET)
	public ModelAndView SouthAmerica() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/country/SouthAmerica.jsp");
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping(value="SouthAmericaList", method=RequestMethod.POST)
	public ModelAndView SouthAmericaList(@RequestParam String countryid2) {

		List<CountryInfoDTO> list = tripDAO.SouthAmericaList(countryid2);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	/*오세아니아*/
	@RequestMapping(value="Oceania", method=RequestMethod.GET)
	public ModelAndView Oceania() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/country/Oceania.jsp");
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping(value="OceaniaList", method=RequestMethod.POST)
	public ModelAndView OceaniaList(@RequestParam String countryid2) {

		List<CountryInfoDTO> list = tripDAO.OceaniaList(countryid2);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	/*검색*/
	@RequestMapping(value="Search")
	public ModelAndView Search(@RequestParam(required=false) Map<String,String> map) {
		
		List<CountryInfoDTO> list = tripDAO.Search(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	/*나라 / 도시 detail*/
	@RequestMapping(value = "country_detail", method = RequestMethod.GET)
	public ModelAndView country_detail(@RequestParam String wordname, HttpSession session) { // 사용자가 만든 콜백 메소드
		ModelAndView mav = new ModelAndView();
		mav.addObject("wordname", wordname);
		mav.addObject("display", "/country/country_detail.jsp");
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping(value = "getWordnameInfo", method = RequestMethod.POST)
	public ModelAndView getHairShopInfo(@RequestParam String wordname, HttpSession session) {
		if (session.getAttribute("memId") != null) {
			String id = (String) session.getAttribute("memId");
			System.out.println("getWordnameInfo 세션" + id);
		}
			
		ModelAndView mav = new ModelAndView();
		System.out.println("ajax wordname" + wordname);
		Map<String, Object> map = tripDAO.getWordnameInfo(wordname);
		

		for (Iterator<String> iterator = map.keySet().iterator(); iterator.hasNext();) {
			String keyName = (String) iterator.next();
			Object valueName = map.get(keyName);
			System.out.println(keyName + " = " + valueName);
		}
		mav.addObject("map", map);
		mav.setViewName("jsonView");
		return mav;
	}
	
}
