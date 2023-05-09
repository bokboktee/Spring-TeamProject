package com.wan.nss.biz.board;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

//@Repository("boardDAO")
public class BoardDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	/*
	 * C
	 */
	// 글 작성
	private final String INSERT = "INSERT INTO BOARD (M_NO, B_TITLE, B_CONTENT) VALUES((SELECT M_NO FROM MEMBER WHERE M_ID = ?), ?, ?)";

	/*
	 * R
	 */
	// (사용자의 좋아요 여부 표시된) 삭제되지 않은 게시글 전체 가져오기
	// ? : 로그인한 아이디
	private final String SELECT_ALL = "SELECT IFNULL(i.I_NM, 'img/default.jpg') AS I_NM, "
			+ "	EXISTS(SELECT LK_NO FROM BLIKE bl WHERE bl.B_NO = b.B_NO AND M_NO = (SELECT M_NO FROM MEMBER WHERE M_ID = ?)) AS ISCHECKED, "
			+ "	COUNT(DISTINCT bl.LK_NO) AS LIKE_CNT, COUNT(DISTINCT r.RE_NO) AS REPLY_CNT, m.M_ID, b.* "
			+ " FROM BOARD b INNER JOIN MEMBER m ON b.M_NO = m.M_NO "
			+ " LEFT JOIN BLIKE bl ON b.B_NO = bl.B_NO LEFT JOIN REPLY r ON b.B_NO = r.B_NO "
			+ " LEFT JOIN (SELECT * FROM IMAGE WHERE TYPE_NO = 201) i ON b.B_NO = i.TARGET_NO "
			+ " WHERE b.STATUS != 3 GROUP BY b.B_NO, i.I_NO ORDER BY B_NO DESC";

	// 관리자 게시글 관리
	private final String SELECT_ALL_ADMIN = "SELECT b.B_NO, b.M_NO, m.M_ID, b.B_TITLE, b.B_CONTENT, b.B_DATE, b.STATUS, b.B_VIEW FROM BOARD b "
			+ " INNER JOIN `MEMBER` m ON b.M_NO = m.M_NO ORDER BY B_NO DESC";

	// TOP3 : 좋아요 많이 받은 글의 작성자의 고양이, 글의 대표 사진 가져오기
	private final String SELECT_ALL_TOP3 = "SELECT m.CAT_NM, b.B_NO, b.B_VIEW, COUNT(DISTINCT LK_NO) AS LIKE_CNT, COUNT(DISTINCT RE_NO) AS REPLY_CNT, IFNULL(i.I_NM, 'img/default.jpg') AS I_NM "
			+ " FROM BOARD b LEFT JOIN BLIKE bl ON b.B_NO = bl.B_NO LEFT JOIN REPLY r ON b.B_NO = r.B_NO "
			+ " LEFT JOIN MEMBER m ON b.M_NO = m.M_NO "
			+ " LEFT JOIN (SELECT * FROM IMAGE WHERE TYPE_NO = 201) i ON b.B_NO = i.TARGET_NO WHERE b.STATUS != 3 "
			+ " GROUP BY B_NO, i.I_NM ORDER BY LIKE_CNT DESC, b.B_VIEW DESC, REPLY_CNT DESC LIMIT 3";

	// 내가 좋아요 누른 글 목록
	private final String SELECT_ALL_MYLIKE = "SELECT b.B_NO, b.B_TITLE, b.B_DATE, m.M_ID "
			+ " FROM BOARD b INNER JOIN `MEMBER` m ON b.M_NO = m.M_NO INNER JOIN BLIKE bl ON b.B_NO = bl.B_NO AND bl.M_NO = (SELECT M_NO FROM MEMBER WHERE M_ID = ?) "
			+ " WHERE b.STATUS != 3 GROUP BY b.B_NO ORDER BY B_NO DESC";

	// 게시글 제목 검색
	// ? : 로그인한 사용자 아이디, 검색어, 로그인한 사용자 아이디 (id가 null일 경우 ISCHECKED 는 모두 false
	private final String SELECT_ALL_SEARCH_TITLE = "SELECT b.*, COUNT(DISTINCT LK_NO) AS LIKE_CNT, COUNT(DISTINCT RE_NO) AS REPLY_CNT, IFNULL(i.I_NM, 'img/default.jpg') AS I_NM, IF(bl.M_NO = (SELECT M_NO FROM MEMBER WHERE M_ID = ?), TRUE, FALSE) AS ISCHECKED "
			+ " FROM (SELECT b.*, m.M_ID FROM BOARD b INNER JOIN MEMBER m ON b.M_NO = m.M_NO WHERE STATUS != 3 AND b.B_TITLE LIKE CONCAT('%', ? ,'%')) b "
			+ " LEFT JOIN BLIKE bl ON b.B_NO = bl.B_NO LEFT JOIN REPLY r ON b.B_NO = r.B_NO "
			+ " LEFT JOIN (SELECT * FROM IMAGE WHERE TYPE_NO = 201) i ON b.B_NO = i.TARGET_NO "
			+ " GROUP BY b.B_NO, i.I_NM, bl.M_NO ORDER BY B_NO DESC";

	// 게시글 내용 검색
	// ? : 로그인한 사용자 아이디, 검색어, 로그인한 사용자 아이디 (id가 null일 경우 ISCHECKED 는 모두 false
	private final String SELECT_ALL_SEARCH_CONTENT = "SELECT b.*, COUNT(DISTINCT LK_NO) AS LIKE_CNT, COUNT(DISTINCT RE_NO) AS REPLY_CNT, IFNULL(i.I_NM, 'img/default.jpg') AS I_NM, IF(bl.M_NO = (SELECT M_NO FROM MEMBER WHERE M_ID = ?), TRUE, FALSE) AS ISCHECKED "
			+ "FROM (SELECT b.*, m.M_ID FROM BOARD b INNER JOIN MEMBER m ON b.M_NO = m.M_NO WHERE STATUS != 3 AND b.B_CONTENT LIKE CONCAT('%', ? ,'%')) b "
			+ "LEFT JOIN BLIKE bl ON b.B_NO = bl.B_NO LEFT JOIN REPLY r ON b.B_NO = r.B_NO "
			+ "LEFT JOIN (SELECT * FROM IMAGE WHERE TYPE_NO = 201) i ON b.B_NO = i.TARGET_NO "
			+ "GROUP BY b.B_NO, i.I_NM, bl.M_NO ORDER BY B_NO DESC";

	// 게시글 작성자 검색
	// ? : 로그인한 사용자 아이디, 검색어, 로그인한 사용자 아이디 (id가 null일 경우 ISCHECKED 는 모두 false
	private final String SELECT_ALL_SEARCH_WRITER = "SELECT b.*, COUNT(DISTINCT LK_NO) AS LIKE_CNT, COUNT(DISTINCT RE_NO) AS REPLY_CNT, IFNULL(i.I_NM, 'img/default.jpg') AS I_NM, IF(bl.M_NO = (SELECT M_NO FROM MEMBER WHERE M_ID = ?), TRUE, FALSE) AS ISCHECKED "
			+ "FROM (SELECT b.*, m.M_ID FROM BOARD b INNER JOIN MEMBER m ON b.M_NO = m.M_NO WHERE STATUS != 3 AND m.M_ID LIKE CONCAT('%', ? ,'%')) b "
			+ "LEFT JOIN BLIKE bl ON b.B_NO = bl.B_NO LEFT JOIN REPLY r ON b.B_NO = r.B_NO "
			+ "LEFT JOIN (SELECT * FROM IMAGE WHERE TYPE_NO = 201) i ON b.B_NO = i.TARGET_NO "
			+ "GROUP BY b.B_NO, i.I_NM, bl.M_NO ORDER BY B_NO DESC";

	// 글 상세보기 + 작성자 id
	// ? : bNum, 로그인한 아이디, bNum
	private final String SELECT_ONE = "SELECT b.*, m.M_ID, COUNT(DISTINCT bl.LK_NO) AS LIKE_CNT, COUNT(DISTINCT r.RE_NO) AS REPLY_CNT, EXISTS(SELECT LK_NO FROM BLIKE WHERE B_NO = ? AND M_NO = (SELECT M_NO FROM MEMBER WHERE M_ID = ?)) AS ISCHECKED "
			+ " FROM BOARD b INNER JOIN MEMBER m ON b.M_NO = m.M_NO LEFT JOIN BLIKE bl ON b.B_NO = bl.B_NO "
			+ " LEFT JOIN REPLY r ON b.B_NO = r.B_NO WHERE b.B_NO = ? AND b.STATUS != 3 GROUP BY b.B_NO";

	// 가장 최근에 추가한 board
	// ? :
	private final String SELECT_ONE_NEWEST = "SELECT MAX(B_NO) AS B_NO FROM BOARD";

	/*
	 * U
	 */
	// 관리자 모드 : 게시글 상태 변경 (1: 정상, 2: 신고, 3: 삭제)
	private final String UPDATE_ADMIN = "UPDATE BOARD SET STATUS = ? WHERE B_NO = ?";
	// 회원 : 게시글 수정
	private final String UPDATE = "UPDATE BOARD SET B_TITLE = ?, B_CONTENT = ?, B_DATE = CURTIME() WHERE B_NO = ?";
	// 게시글 조회수 +1
	private final String UPDATE_VIEWS = "UPDATE BOARD SET B_VIEW = B_VIEW + 1 WHERE B_NO = ?";

	/*
	 * D
	 */
	// 회원 : 게시글 삭제
	private final String DELETE = "UPDATE BOARD SET STATUS = 3 WHERE B_NO = ?";

	public boolean insert(BoardVO vo) {
		if (jdbcTemplate.update(INSERT, vo.getUserId(), vo.getBoardTitle(), vo.getBoardContent()) < 1) {
			return false;
		}
		// 컨트롤러 TODO : 이미지 테이블 insert
		return true;
	}

	public boolean update(BoardVO vo) {
		int res = 0;
		if (vo.getSearchCondition().equals("changeStatus")) {
			// 1. 관리자 모드 : 게시글 상태 변경 STATUS가 있는 경우 status != null
			res = jdbcTemplate.update(UPDATE_ADMIN, vo.getBoardStatus(), vo.getBoardNum());
		} else if (vo.getSearchCondition().equals("edit")) {
			// 2. 회원: 게시글 수정
			/* 컨트롤러 TODO : 이미지 update */
			res = jdbcTemplate.update(UPDATE, vo.getBoardTitle(), vo.getBoardContent(), vo.getBoardNum());
		} else if (vo.getSearchCondition().equals("viewCnt")) {
			// 3. 게시글 조회수 수정
			res = jdbcTemplate.update(UPDATE_VIEWS, vo.getBoardNum());
		}

		if (res < 1) {
			return false;
		}
		return true;
	}

	public boolean delete(BoardVO vo) {
		if (jdbcTemplate.update(DELETE, vo.getBoardNum()) < 1) {
			return false;
		}
		return true;
	}

	public BoardVO selectOne(BoardVO vo) {
		/* 주의 : 로그인 했을 경우 BoardVO의 userId에 '현재 로그인한 멤버의 아이디'를 세팅해주세요. */
		try {
			if ("newest".equals(vo.getSearchCondition())) {
				// 2. 가장 최근에 등록된 게시글 번호 보기 (이미지 insert 할 때)
				// pSearchCondition = "newest"
				return jdbcTemplate.queryForObject(SELECT_ONE_NEWEST, (rs, rowNum) -> {
					BoardVO data = new BoardVO();
					data.setBoardNum(rs.getInt("B_NO"));
					data.setUserNum(rs.getInt("M_NO"));
					data.setBoardTitle(rs.getString("B_TITLE"));
					data.setBoardContent(rs.getString("B_CONTENT"));
					data.setBoardDate(rs.getString("B_DATE"));
					data.setBoardStatus(rs.getInt("STATUS"));
					data.setBoardView(rs.getInt("B_VIEW"));

					// vo에만 존재하는 멤버변수. join 사용해 set
					data.setUserId(rs.getString("M_ID")); // 별칭으로 가져온 작성자 아이디
					data.setLikeCnt(rs.getInt("LIKE_CNT")); // 좋아요 수
					data.setChecked(rs.getBoolean("ISCHECKED")); // 좋아요 여부
					data.setReplyCnt(rs.getInt("REPLY_CNT")); // 댓글 수
					return data;
				}, vo.getUserId());
			}

			return jdbcTemplate.queryForObject(SELECT_ONE, (rs, rowNum) -> {
				BoardVO data = new BoardVO();
				data.setBoardNum(rs.getInt("B_NO"));
				data.setUserNum(rs.getInt("M_NO"));
				data.setBoardTitle(rs.getString("B_TITLE"));
				data.setBoardContent(rs.getString("B_CONTENT"));
				data.setBoardDate(rs.getString("B_DATE"));
				data.setBoardStatus(rs.getInt("STATUS"));
				data.setBoardView(rs.getInt("B_VIEW"));

				// vo에만 존재하는 멤버변수. join 사용해 set
				data.setUserId(rs.getString("M_ID")); // 별칭으로 가져온 작성자 아이디
				data.setLikeCnt(rs.getInt("LIKE_CNT")); // 좋아요 수
				data.setChecked(rs.getBoolean("ISCHECKED")); // 좋아요 여부
				data.setReplyCnt(rs.getInt("REPLY_CNT")); // 댓글 수
				return data;
			}, vo.getBoardNum(), vo.getUserId(), vo.getBoardNum());
		} catch (Exception e) {
			System.out.println("BoardDAO selectOne 결과 없음");
			return null;
		}
	}

	public ArrayList<BoardVO> selectAll(BoardVO vo) {
		/* 주의 : 로그인 했을 경우 BoardVO의 userId에 '현재 로그인한 멤버의 아이디'를 세팅해주세요. */

		if (vo.getSearchCondition() == null) { // 1. 글 전체 보기
			// 로그인 안 한 경우 전체 좋아요가 false로 나옴
			System.out.println("BoardDAO  전체 보기");
			return (ArrayList<BoardVO>) jdbcTemplate.query(SELECT_ALL, new BoardRowMapper(), vo.getUserId());

		}
		if (vo.getSearchCondition().equals("admin")) { // 관리자 : 게시글 관리
			return (ArrayList<BoardVO>) jdbcTemplate.query(SELECT_ALL_ADMIN, (rs, rowNum) -> {
				BoardVO data = new BoardVO();
				data.setBoardNum(rs.getInt("B_NO"));
				data.setUserNum(rs.getInt("M_NO"));
				data.setUserId(rs.getString("M_ID"));
				data.setBoardTitle(rs.getString("B_TITLE"));
				data.setBoardContent(rs.getString("B_CONTENT"));
				data.setBoardDate(rs.getString("B_DATE"));
				data.setBoardStatus(rs.getInt("STATUS"));
				data.setBoardView(rs.getInt("B_VIEW"));
				return data;
			});

		} else if (vo.getSearchCondition().equals("top3")) { // 2. 전체 3등보기
			return (ArrayList<BoardVO>) jdbcTemplate.query(SELECT_ALL_TOP3, (rs, rowNum) -> {
				BoardVO data = new BoardVO();
				data.setCatName(rs.getString("CAT_NM"));
				data.setBoardNum(rs.getInt("B_NO"));
				data.setBoardView(rs.getInt("B_VIEW"));
				data.setLikeCnt(rs.getInt("LIKE_CNT"));
				data.setReplyCnt(rs.getInt("REPLY_CNT"));
				data.setImageName(rs.getString("I_NM"));
				return data;
			});

		} else if (vo.getSearchCondition().equals("myLike")) {
			return (ArrayList<BoardVO>) jdbcTemplate.query(SELECT_ALL_MYLIKE, (rs, rowNum) -> {
				BoardVO data = new BoardVO();
				data.setBoardNum(rs.getInt("B_NO"));
				data.setBoardTitle(rs.getString("B_TITLE"));
				data.setBoardContent(rs.getString("B_CONTENT"));
				data.setUserId(rs.getString("M_ID"));
				return data;
			}, vo.getUserId());
		} else if (vo.getSearchContent() != null) { // 3. 글 검색
			if (vo.getSearchCondition().equals("title")) { // 제목 검색
				return (ArrayList<BoardVO>) jdbcTemplate.query(SELECT_ALL_SEARCH_TITLE, new BoardRowMapper(),
						vo.getUserId(), vo.getSearchContent());

			} else if (vo.getSearchCondition().equals("content")) { // 내용 검색
				return (ArrayList<BoardVO>) jdbcTemplate.query(SELECT_ALL_SEARCH_CONTENT, new BoardRowMapper(),
						vo.getUserId(), vo.getSearchContent());

			} else if (vo.getSearchCondition().equals("writer")) { // 작성자 검색
				return (ArrayList<BoardVO>) jdbcTemplate.query(SELECT_ALL_SEARCH_WRITER, new BoardRowMapper(),
						vo.getUserId(), vo.getSearchContent());
			}
		}
		// 아무것도 해당 안 될시 null 반환
		return null;
	}
}

class BoardRowMapper implements RowMapper<BoardVO> {
	@Override
	public BoardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		BoardVO data = new BoardVO();
		data.setBoardNum(rs.getInt("B_NO"));
		data.setUserNum(rs.getInt("M_NO"));
		data.setBoardTitle(rs.getString("B_TITLE"));
		data.setBoardContent(rs.getString("B_CONTENT"));
		data.setBoardDate(rs.getString("B_DATE"));
		data.setBoardStatus(rs.getInt("STATUS"));
		data.setBoardView(rs.getInt("B_VIEW"));

		// vo에만 존재하는 멤버변수. join 사용해 set
		data.setUserId(rs.getString("M_ID")); // 별칭으로 가져온 작성자 아이디
		data.setLikeCnt(rs.getInt("LIKE_CNT")); // 좋아요 수
		data.setImageName(rs.getString("I_NM")); // 대표 이미지 이름
		data.setChecked(rs.getBoolean("ISCHECKED")); // 좋아요 여부
		data.setReplyCnt(rs.getInt("REPLY_CNT")); // 댓글 수
		return data;
	}
}
