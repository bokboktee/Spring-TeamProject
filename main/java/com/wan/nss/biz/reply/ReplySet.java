package com.wan.nss.biz.reply;

import java.util.ArrayList;

public class ReplySet {
	private ReplyVO reply; // 댓글 한 개
	private ArrayList<ReplyVO> replyList; // 그에 대한 대댓글들

	public ReplyVO getReply() {
		return reply;
	}

	public void setReply(ReplyVO reply) {
		this.reply = reply;
	}

	public ArrayList<ReplyVO> getReplyList() {
		return replyList;
	}

	public void setReplyList(ArrayList<ReplyVO> replyList) {
		this.replyList = replyList;
	}

	@Override
	public String toString() {
		return "ReplySet [reply=" + reply + ", replyList=" + replyList + "]";
	}
}