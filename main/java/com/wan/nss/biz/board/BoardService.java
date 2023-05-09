package com.wan.nss.biz.board;

import java.util.List;

public interface BoardService {
	public boolean insert(BoardVO vo);
	public boolean update(BoardVO vo);
	public boolean delete(BoardVO vo);
	public List<BoardVO> selectAll(BoardVO vo);
	public BoardVO selectOne(BoardVO vo);
}
