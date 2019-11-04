package management.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import management.bean.CountryInfoDTO;
import member.bean.MemberDTO;
import travel.bean.TripDTO;


@Component
@Transactional
public class ManagementDAOMybatis implements ManagementDAO {
	@Autowired
	private SqlSession sqlSession;


	// 마이페이지 구분
	@Override
	public String getMemberType(String id) {
		return sqlSession.selectOne("managementSQL.getMemberType", id);
	}


	@Override
	public List<Map<String, String>> heartList(String memId) {
		return sqlSession.selectList("managementSQL.heartList", memId);
	}


	@Override
	public void updateInfo(MemberDTO memberDTO) {
		sqlSession.selectOne("managementSQL.updateInfo", memberDTO);
	}

	@Override
	public void userHeartDelete(String id) {
		sqlSession.delete("managementSQL.userHeartDelete", id);
	}

	@Override
	public void userDelete(Map<String, String> map) {
		sqlSession.delete("managementSQL.userDelete", map);
	}


	@Override
	public List<MemberDTO> getMemberByType(String type) {
		return sqlSession.selectList("managementSQL.getMemberByType", type);
	}


	@Override
	public String getMemberTotal() {
		return sqlSession.selectOne("managementSQL.getMemberTotal");
	}


	@Override
	public void memberDelete(String id) {
		sqlSession.delete("managementSQL.memberDelete", id);
	}


	@Override
	public void memberPwdModify(String id, String modifyPwd) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("modifyPwd", modifyPwd);

		sqlSession.update("managementSQL.memberPwdModify", map);
	}


	@Override
	public List<Map<String, Object>> recommendList() {
		return sqlSession.selectList("managementSQL.recommendList");
	}


	@Override
	public void recommendCountryDelete() {
		sqlSession.delete("managementSQL.recommendCountryDelete");
	}


	@Override
	public void recommendCountryRegist(String value) {
		sqlSession.insert("managementSQL.recommendCountryRegist",value);
	}


	@Override
	public String getTotalCountry() {
		return sqlSession.selectOne("managementSQL.getTotalCountry");
	}


	@Override
	public List<String> getCountryName() {
		return sqlSession.selectList("managementSQL.getCountryName");
	}


	@Override
	public List<TripDTO> getCountryList(String countryName) {
		return sqlSession.selectList("managementSQL.getCountryList", countryName);
	}


	@Override
	public void countryDelete(String wordname) {
		sqlSession.delete("managementSQL.countryDelete", wordname);
	}


	@Override
	public int countryInsert_Image(Map<String, Object> map) {
		return sqlSession.insert("managementSQL.countryInsert_Image", map);
	}


	@Override
	public int countryInsert_Not_Image(Map<String, Object> map) {
		return sqlSession.insert("managementSQL.countryInsert_Not_Image", map);
	}


	@Override
	public List<Map<String, String>> checkCountryList(String wordname) {
		return sqlSession.selectList("managementSQL.checkCountryList", wordname);
	}


	
	

	
}
