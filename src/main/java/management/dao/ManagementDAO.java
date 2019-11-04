package management.dao;

import java.util.List;
import java.util.Map;

import management.bean.CountryInfoDTO;
import member.bean.MemberDTO;
import travel.bean.TripDTO;

public interface ManagementDAO {

	public String getMemberType(String memId);

	public List<Map<String, String>> heartList(String memId);

	public void updateInfo(MemberDTO memberDTO);

	public void userHeartDelete(String id);
	
	public void userDelete(Map<String, String> map);

	public List<MemberDTO> getMemberByType(String type);

	public String getMemberTotal();

	public void memberDelete(String id);

	public void memberPwdModify(String id, String modifyPwd);

	public List<Map<String, Object>> recommendList();

	public void recommendCountryDelete();

	public void recommendCountryRegist(String value);

	public String getTotalCountry();

	public List<String> getCountryName();

	public List<TripDTO> getCountryList(String countryName);

	public void countryDelete(String wordname);

	public int countryInsert_Image(Map<String, Object> map);

	public int countryInsert_Not_Image(Map<String, Object> map);

	public List<Map<String, String>> checkCountryList(String wordname);

	

	

}
