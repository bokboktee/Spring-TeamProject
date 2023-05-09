package com.wan.nss.biz.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Repository;

@Repository("boardDAO")
public class BoardDAO2 {
	@Autowired
	private SqlSessionTemplate myBatis;

	public boolean insert(BoardVO vo) {
		int res = myBatis.insert("BoardDAO.insertBoard", vo);
		if (res < 1) {
			return false;
		}
		return true;
	}

	public boolean update(BoardVO vo) {
		int res = myBatis.update("BoardDAO.updateBoard", vo);
		if (res < 1) {
			return false;
		}
		return true;
	}

	public boolean delete(BoardVO vo) {
		int res = myBatis.delete("BoardDAO.deleteBoard", vo);
		if (res < 1) {
			return false;
		}
		return true;
	}

	public BoardVO selectOne(BoardVO vo) {
		try {
			return myBatis.selectOne("BoardDAO.selectOneBoard", vo);
		} catch (EmptyResultDataAccessException e) {
			System.out.println("BoardDAO2 selectOne 결과 없음");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<BoardVO> selectAll(BoardVO vo) {
		return myBatis.selectList("BoardDAO.selectAllBoard", vo);
	}
}

