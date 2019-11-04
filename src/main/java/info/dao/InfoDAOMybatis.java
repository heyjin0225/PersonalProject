package info.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import info.bean.InfoDTO;

@Component
@Transactional
public class InfoDAOMybatis implements InfoDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void write(Map<String, String> map) {
		sqlSession.insert("infoSQL.write",map);
	}

	@Override
	public List<InfoDTO> boardList(Map<String, Integer> map) {
		return sqlSession.selectList("infoSQL.boardList", map);
	}

	@Override
	public int boardTotalA() {
		return sqlSession.selectOne("infoSQL.boardTotalA");
	}

}
