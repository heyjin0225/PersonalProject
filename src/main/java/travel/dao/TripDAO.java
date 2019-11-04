package travel.dao;

import java.util.List;
import java.util.Map;

import management.bean.CountryInfoDTO;
import travel.bean.HeartDTO;
import travel.bean.TripDTO;

public interface TripDAO {

	public void travel_write_image(TripDTO tripDTO);

	public List<TripDTO> domesticList(String countryid);

	public List<TripDTO> overseasList(String countryid);
	
	public List<CountryInfoDTO> KoreaList(String countryid2);

	public List<CountryInfoDTO> AsiaList(String countryid2);

	public List<CountryInfoDTO> EuropeList(String countryid2);
	
	public List<CountryInfoDTO> MiddleEastList(String countryid2);
	
	public List<CountryInfoDTO> AfricaList(String countryid2);

	public List<CountryInfoDTO> NorthAmericaList(String countryid2);

	public List<CountryInfoDTO> SouthAmericaList(String countryid2);

	public List<CountryInfoDTO> OceaniaList(String countryid2);

	public List<CountryInfoDTO> Search(Map<String, String> map);

	public Map<String, Object> getWordnameInfo(String wordname);

	public List<TripDTO> continentList(String countryid2);

	public List<HeartDTO> getHeart(String heart_id);

	public void insertHeart(Map<String, String> map);

	public void deleteHeart(Map<String, String> map);

	

	

	

}
