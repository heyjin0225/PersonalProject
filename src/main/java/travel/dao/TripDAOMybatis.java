package travel.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import management.bean.CountryInfoDTO;
import travel.bean.HeartDTO;
import travel.bean.TripDTO;
@Component
@Transactional
public class TripDAOMybatis implements TripDAO {
	@Autowired
	private SqlSession sqlSession;


	@Override
	public void travel_write_image(TripDTO tripDTO) {
		System.out.println(tripDTO.getCountryid2());
		sqlSession.insert("travelSQL.travel_write_image",tripDTO);
	}

	@Override
	public List<TripDTO> domesticList(String countryid) {
		return sqlSession.selectList("travelSQL.domesticList", countryid);
	}

	@Override
	public List<TripDTO> overseasList(String countryid) {
		return sqlSession.selectList("travelSQL.overseasList", countryid);
	}
	
	@Override
	public List<CountryInfoDTO> KoreaList(String countryid2) {
		return sqlSession.selectList("travelSQL.KoreaList", countryid2);
	}

	@Override
	public List<CountryInfoDTO> AsiaList(String countryid2) {
		return sqlSession.selectList("travelSQL.AsiaList", countryid2);
	}

	@Override
	public List<CountryInfoDTO> EuropeList(String countryid2) {
		return sqlSession.selectList("travelSQL.EuropeList", countryid2);
	}

	@Override
	public List<CountryInfoDTO> MiddleEastList(String countryid2) {
		return sqlSession.selectList("travelSQL.MiddleEastList", countryid2);
	}
	@Override
	public List<CountryInfoDTO> AfricaList(String countryid2) {
		return sqlSession.selectList("travelSQL.AfricaList", countryid2);
	}


	@Override
	public List<CountryInfoDTO> NorthAmericaList(String countryid2) {
		return sqlSession.selectList("travelSQL.NorthAmericaList", countryid2);
	}

	@Override
	public List<CountryInfoDTO> SouthAmericaList(String countryid2) {
		return sqlSession.selectList("travelSQL.SouthAmericaList", countryid2);
	}

	@Override
	public List<CountryInfoDTO> OceaniaList(String countryid2) {
		return sqlSession.selectList("travelSQL.OceaniaList", countryid2);
	}

	@Override
	public List<CountryInfoDTO> Search(Map<String, String> map) {
		return sqlSession.selectList("travelSQL.Search", map);
	}

	@Override
	public Map<String, Object> getWordnameInfo(String wordname) {
		return sqlSession.selectOne("travelSQL.getWordnameInfo", wordname);
	}

	@Override
	public List<TripDTO> continentList(String countryid2) {
		return sqlSession.selectList("travelSQL.continentList", countryid2);
	}

	//좋아요
	@Override
	public List<HeartDTO> getHeart(String heart_id) {
		return sqlSession.selectList("travelSQL.getHeart", heart_id);
	}

	@Override
	public void insertHeart(Map<String, String> map) {
		sqlSession.insert("travelSQL.insertHeart", map);
	}

	@Override
	public void deleteHeart(Map<String, String> map) {
		sqlSession.delete("travelSQL.deleteHeart", map);
	}

	
	

	


	

}
