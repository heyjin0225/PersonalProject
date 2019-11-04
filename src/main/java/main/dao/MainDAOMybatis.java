package main.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@Transactional
public class MainDAOMybatis implements MainDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Map<String, Object>> getRecommendView() {
		return sqlSession.selectList("mainSQL.getRecommendView");
	}

}
