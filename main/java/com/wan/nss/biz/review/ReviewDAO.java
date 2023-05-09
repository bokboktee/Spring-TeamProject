package com.wan.nss.biz.review;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("reviewDAO")
public class ReviewDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	// 리뷰 작성
	private final String SQL_INSERT = "INSERT INTO REVIEW (P_NO, M_NO, R_CONTENT, R_RATE) VALUES(?, (SELECT M_NO FROM MEMBER WHERE M_ID = ?), ?, ?)";

	// 리뷰 전체보기 (관리자)
	private final String SQL_SELECTALL = "SELECT r.*, m.M_ID, p.P_NM FROM REVIEW r INNER JOIN MEMBER m ON r.M_NO = m.M_NO INNER JOIN PRODUCT p ON r.P_NO = p.P_NO ORDER BY R_NO DESC";

	// 제품 번호에 대한 리뷰 보기
	private final String SQL_SELECTALL_PRODUCT = "SELECT r.*, m.M_ID, p.P_NM FROM REVIEW r INNER JOIN MEMBER m ON r.M_NO = m.M_NO INNER JOIN PRODUCT p ON r.P_NO = p.P_NO WHERE r.P_NO = ? ORDER BY R_NO DESC";

	// 내가 작성한 리뷰 보기
	private final String SQL_SELECTALL_USER = "SELECT r.*, m.M_ID, p.P_NM FROM REVIEW r INNER JOIN MEMBER m ON r.M_NO = m.M_NO AND m.M_ID = ? INNER JOIN PRODUCT p ON r.P_NO = p.P_NO ORDER BY R_NO DESC";

	// 리뷰 삭제
	private final String SQL_DELETE = "DELETE FROM REVIEW WHERE R_NO=?";

	public boolean insert(ReviewVO rvo) {
		// 리뷰 작성
		jdbcTemplate.update(SQL_INSERT, rvo.getpNum(), rvo.getUserId(), rvo.getrContent(), rvo.getrRate());
		return true;
	}

	public boolean delete(ReviewVO rvo) {
		// 리뷰 삭제
		jdbcTemplate.update(SQL_DELETE, rvo.getrNum());
		return true;
	}

	public ArrayList<ReviewVO> selectAll(ReviewVO rvo) {
		if (rvo.getrSearchCondition() == null) {
			// 전체 리뷰 보기 (관리자)
			return (ArrayList<ReviewVO>) jdbcTemplate.query(SQL_SELECTALL, new ReviewRowMapper());

		} else if (rvo.getrSearchCondition().equals("pNum")) {
			// 해당 제품의 리뷰 보기
			return (ArrayList<ReviewVO>) jdbcTemplate.query(SQL_SELECTALL_PRODUCT, new ReviewRowMapper(), rvo.getpNum());

		} else if (rvo.getrSearchCondition().equals("myReviews")) {
			// 내가 작성한 리뷰 보기
			return (ArrayList<ReviewVO>) jdbcTemplate.query(SQL_SELECTALL_USER, new ReviewRowMapper(), rvo.getUserId());
		}
		return null;
	}

	class ReviewRowMapper implements RowMapper<ReviewVO> {

		@Override
		public ReviewVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			ReviewVO rvo = new ReviewVO();
			rvo.setrNum(rs.getInt("R_NO"));
			rvo.setpNum(rs.getInt("P_NO"));
			rvo.setrWriter(rs.getInt("M_NO"));
			rvo.setrContent(rs.getString("R_CONTENT"));
			rvo.setrDate(rs.getString("R_DT"));
			rvo.setrRate(rs.getInt("R_RATE"));
			rvo.setUserId(rs.getString("M_ID"));
			rvo.setpName(rs.getString("P_NM"));

			return rvo;
		}
	}
}
