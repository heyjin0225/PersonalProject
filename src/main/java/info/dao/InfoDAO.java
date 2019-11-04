package info.dao;

import java.util.List;
import java.util.Map;

import info.bean.InfoDTO;

public interface InfoDAO {

	public void write(Map<String, String> map);

	public List<InfoDTO> boardList(Map<String, Integer> map);

	public int boardTotalA();

}
