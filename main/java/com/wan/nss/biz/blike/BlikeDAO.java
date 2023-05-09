package com.wan.nss.biz.blike;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("blikeDAO")
public class BlikeDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final String INSERT = "INSERT INTO BLIKE (B_NO, M_NO) VALUES(?, (SELECT M_NO FROM MEMBER WHERE M_ID = ?))";
	private final String DELETE = "DELETE FROM BLIKE WHERE B_NO = ? AND M_NO = (SELECT M_NO FROM `MEMBER` WHERE M_ID = ?)";
	
	
	public boolean insert(BlikeVO vo) {
		if(jdbcTemplate.update(INSERT, vo.getBoardNum(), vo.getUserId()) < 1) {
			return false;
		}
		return true;
	}
	
	public boolean delete(BlikeVO vo) {
		if(jdbcTemplate.update(DELETE, vo.getBoardNum(), vo.getUserId()) < 1) {
			return false;
		}
		return true;
	}
}
