package com.wan.nss.biz.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO2 boardDAO;

	@Override
	public boolean insert(BoardVO vo) {
		return boardDAO.insert(vo);
	}

	@Override
	public boolean update(BoardVO vo) {
		return boardDAO.update(vo);
	}

	@Override
	public boolean delete(BoardVO vo) {
		return boardDAO.delete(vo);
	}
	
	@Override
	public List<BoardVO> selectAll(BoardVO vo) {
		return boardDAO.selectAll(vo);
	}

	@Override
	public BoardVO selectOne(BoardVO vo) {
		return boardDAO.selectOne(vo);
	}

}
