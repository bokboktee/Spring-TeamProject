package com.wan.nss.biz.reply;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDAO replyDAO;

	@Override
	public ArrayList<ReplySet> selectAll(ReplyVO rvo) {
		return replyDAO.selectAll(rvo);
	}

	@Override
	public ReplyVO selectOne(ReplyVO rvo) {
		return replyDAO.selectOne(rvo);
	}

	@Override
	public boolean update(ReplyVO rvo) {
		return replyDAO.update(rvo);
	}

	@Override
	public boolean insert(ReplyVO rvo) {
		return replyDAO.insert(rvo);
	}

	@Override
	public boolean delete(ReplyVO rvo) {
		return replyDAO.delete(rvo);
	}
}
