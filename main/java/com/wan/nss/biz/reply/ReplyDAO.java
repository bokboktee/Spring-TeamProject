package com.wan.nss.biz.reply;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("replyDAO")
public class ReplyDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	// 댓글 작성 - 글 번호, 댓글 작성자 id, 내용 필요
	private final String INSERT_REPLY = "INSERT INTO REPLY (B_NO, M_NO, RE_CONTENT, RE_STEP) VALUES "
			+ "(?, (SELECT M_NO FROM MEMBER WHERE M_ID = ?), ?, 2)";

	// 대댓글 작성 - 글 번호, 대댓글 작성자 id, 부모 댓글 pk, 내용 필요
	private final String INSERT_REREPLY = "INSERT INTO REPLY (B_NO, M_NO, PARENT_NO, RE_CONTENT, RE_STEP) VALUES "
			+ "(?, (SELECT M_NO FROM MEMBER WHERE M_ID = ?), ?, ?, 3)";

	// 댓글 가져오기 - 글 번호 필요
	private final String SELECT_ALL_REPLY = "SELECT	RE_NO, B_NO, m.M_ID, r.M_NO, PARENT_NO, RE_DATE, " + "	CASE "
			+ "		WHEN STATUS = 2 " + "		THEN '*** 관리자가 검토중인 댓글입니다. ***' " + "		WHEN STATUS = 3 "
			+ "		THEN '*** 해당 댓글은 삭제된 댓글입니다. ***' " + "		ELSE RE_CONTENT " + "	END AS RE_CONTENT "
			+ "	, STATUS, RE_STEP " + " FROM REPLY r " + " INNER JOIN `MEMBER` m " + " ON r.M_NO = m.M_NO "
			+ " WHERE B_NO = ? AND RE_STEP = 2 ORDER BY RE_NO ASC";

	// 대댓글 가져오기 - 글 번호 필요
	private final String SELECT_ALL_REREPLY = "SELECT RE_NO, B_NO, m.M_ID, r.M_NO, PARENT_NO, RE_DATE, " + "	CASE "
			+ "		WHEN STATUS = 2 " + "		THEN '*** 관리자가 검토중인 댓글입니다. ***' " + "		WHEN STATUS = 3 "
			+ "		THEN '*** 해당 댓글은 삭제된 댓글입니다. ***' " + "		ELSE RE_CONTENT " + "	END AS RE_CONTENT "
			+ "	, STATUS, RE_STEP " + " FROM REPLY r " + " INNER JOIN `MEMBER` m " + " ON r.M_NO = m.M_NO "
			+ " WHERE B_NO = ? AND RE_STEP = 3 ORDER BY PARENT_NO,RE_NO ASC";

	private final String SELECT_ONE = "SELECT RE_NO, B_NO, m.M_ID, r.M_NO, PARENT_NO, RE_DATE, "
			+ "	RE_CONTENT, STATUS, RE_STEP FROM REPLY r INNER JOIN `MEMBER` m ON r.M_NO = m.M_NO WHERE RE_NO = ?";

	// 관리자 : 댓글 상태 수정 (1: 정상, 2: 신고, 3:삭제)
	private final String UPDATE = "UPDATE REPLY SET STATUS = ? WHERE RE_NO = ?";

	// 댓글 삭제
	private final String DELETE = "UPDATE REPLY SET STATUS = 3 WHERE RE_NO = ?";

	public boolean insert(ReplyVO vo) {
		int res = 0;
		if (vo.getParentNum() == 0) { // 댓글 작성
			res = jdbcTemplate.update(INSERT_REPLY, vo.getBoardNum(), vo.getUserId(), vo.getReplyContent());
		} else { // 대댓글 작성
			res = jdbcTemplate.update(INSERT_REREPLY, vo.getBoardNum(), vo.getUserId(), vo.getParentNum(),
					vo.getReplyContent());
		}

		if (res < 1) {
			return false;
		}
		return true;
	}

	public ArrayList<ReplySet> selectAll(ReplyVO vo) {
		ArrayList<ReplySet> rsList = new ArrayList<>(); // 해당 글의 댓글, 대댓글 모음

		// 해당 글의 댓글들
		ArrayList<ReplyVO> rDatas = (ArrayList<ReplyVO>) jdbcTemplate.query(SELECT_ALL_REPLY, new ReplyRowMapper(),
				vo.getBoardNum());

		// 해당 글의 대댓글들
		ArrayList<ReplyVO> rrDatas = (ArrayList<ReplyVO>) jdbcTemplate.query(SELECT_ALL_REREPLY, new ReplyRowMapper(),
				vo.getBoardNum());

		for (int i = 0; i < rDatas.size(); i++) { // 댓글 하나하나를
			ReplyVO reply = rDatas.get(i);

			ReplySet rs = new ReplySet(); // 댓글 하나와 그에 달린 대댓글들
			rs.setReply(reply);

			ArrayList<ReplyVO> rrList = new ArrayList<>(); // ReplySet에 넣을 대댓글 AL

			for (int j = 0; j < rrDatas.size(); j++) {
				// 만약 대댓글이 존재한다면 (댓글의 RE_NO == 대댓글의 PARENT_NO 이면 )
				if (reply.getReplyNum() == rrDatas.get(j).getParentNum()) {
					rrList.add(rrDatas.get(j));
				}
			}
			rs.setReplyList(rrList);
			// ReplySet을 rsList에 추가
			rsList.add(rs);
		}
		return rsList;
	}

	public ReplyVO selectOne(ReplyVO vo) {
		try {
			return jdbcTemplate.queryForObject(SELECT_ONE, new ReplyRowMapper(), vo.getReplyNum());
		} catch (Exception e) {
			System.out.println("replyDAO selectOne 결과 없음");
			return null;
		}
	}

	public boolean update(ReplyVO vo) {
		if (jdbcTemplate.update(UPDATE, vo.getReplyStatus(), vo.getReplyNum()) < 1) {
			return false;
		}
		return true;
	}

	public boolean delete(ReplyVO vo) {
		if (jdbcTemplate.update(DELETE, vo.getReplyNum()) < 1) {
			return false;
		}
		return true;
	}
}

class ReplyRowMapper implements RowMapper<ReplyVO> {

	@Override
	public ReplyVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		ReplyVO data = new ReplyVO();
		data.setReplyNum(rs.getInt("RE_NO"));
		data.setBoardNum(rs.getInt("B_NO"));
		data.setUserId(rs.getString("M_ID"));
		data.setUserNum(rs.getInt("M_NO"));
		data.setParentNum(rs.getInt("PARENT_NO"));
		data.setReplyDate(rs.getString("RE_DATE"));
		data.setReplyContent(rs.getString("RE_CONTENT"));
		data.setReplyStatus(rs.getInt("STATUS"));
		data.setReplyStep(rs.getInt("RE_STEP"));
		return data;
	}

}
