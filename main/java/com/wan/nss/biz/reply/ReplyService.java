package com.wan.nss.biz.reply;

import java.util.ArrayList;

public interface ReplyService {
	public boolean insert(ReplyVO vo);
	public ArrayList<ReplySet> selectAll(ReplyVO vo);
	public ReplyVO selectOne(ReplyVO vo);
	public boolean update(ReplyVO vo);
	public boolean delete(ReplyVO vo);
}
