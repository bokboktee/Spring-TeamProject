package com.wan.nss.biz.member;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("memberDAO")
public class MemberDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	// 회원가입
	private final String SQL_INSERT = "INSERT INTO MEMBER (M_ID, M_PW, M_NM, CAT_NM, PHONE_NO, POST_NO, ADDRESS1, ADDRESS2) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

	// 회원정보 업데이트
	private final String SQL_UPDATE = "UPDATE MEMBER SET CAT_NM = ?, POST_NO = ?, ADDRESS1 = ?, ADDRESS2 = ? WHERE M_ID = ?";

	// 회원 비밀번호 수정
	// !!
	private final String UPDATE_PW = "UPDATE MEMBER SET M_PW = ? WHERE M_ID = ?";

	// 신고 당한 회원 등급 변경
	private final String SQL_UPDATE_ROLE = "UPDATE MEMBER m SET m.WARN_CNT =(m.WARN_CNT+1), m.`ROLE` =CASE WHEN m.WARN_CNT=3 THEN 'BLOCKED' ELSE ROLE END WHERE M_ID = ?";

	// 회원 삭제
	private final String SQL_DELETE = "UPDATE MEMBER SET ROLE = 'DELETED' WHERE M_NO = (SELECT M_NO FROM (SELECT M_NO FROM MEMBER WHERE M_ID = ?) m)";

	// 회원 등급 변경
	private final String SQL_UPDATE_CHANGE_ROLE = "UPDATE MEMBER SET ROLE = ? ,WARN_CNT = IF( ? ='MEMBER',0,WARN_CNT ) WHERE M_NO = ?; ";

	// 로그인
	private final String SELECTONE = "SELECT M_NO, M_NM, M_ID, CAT_NM, PHONE_NO, ROLE, WARN_CNT, POST_NO, ADDRESS1, ADDRESS2 FROM MEMBER WHERE M_ID = ? AND M_PW = ? AND ROLE != 'DELETED'";

	// 암호화된 비밀번호 조회
	private final String SELECT_ONE_PW = "SELECT M_PW FROM `MEMBER` m WHERE M_ID = ?";

	// 아이디 중복 검사, 마이페이지 이동
	private final String SQL_SELECTONE_ID = "SELECT M_NO, M_NM, M_ID, CAT_NM, PHONE_NO, ROLE, WARN_CNT, POST_NO, ADDRESS1, ADDRESS2 FROM MEMBER WHERE M_ID = ? ";

	// 핸드폰 번호 중복 검사
	private final String SQL_SELECTONE_PHONE = "SELECT PHONE_NO, M_NM, M_ID FROM MEMBER WHERE PHONE_NO = ? AND ROLE != 'DELETED'";

	// 회원 전체 목록 보기
	private final String SQL_SELECTALL = "SELECT M_NO, M_NM, M_ID, CAT_NM, PHONE_NO, ROLE, WARN_CNT, POST_NO, ADDRESS1, ADDRESS2 FROM MEMBER ORDER BY M_NO DESC";

	// 비밀번호 찾기 할 때 필요
	private final String SQL_SELECTONE_FIND_PW = "SELECT M_NO, M_NM, M_ID, CAT_NM, PHONE_NO, ROLE, WARN_CNT, POST_NO, ADDRESS1, ADDRESS2 FROM MEMBER WHERE M_ID = ? AND M_NM = ? AND PHONE_NO = ?  AND ROLE != 'DELETED'";

	// 회원가입
	public boolean insert(MemberVO vo) {
		int res = jdbcTemplate.update(SQL_INSERT, vo.getUserId(), vo.getUserPw(), vo.getUserName(), vo.getCatName(),
				vo.getPhoneNum(), vo.getPostNum(), vo.getAddress1(), vo.getAddress2());
		if (res < 1) {
			return false;
		}
		return true;
	}

	// 회원 정보 변경
	public boolean update(MemberVO vo) {
		if (vo.getUserPw() != null) {
			// 비밀번호 변경
			int res = jdbcTemplate.update(UPDATE_PW, vo.getUserPw(), vo.getUserId());
			if (res < 1) {
				return false;
			}
			return true;
		} else if (vo.getRole() != null) {
			// 회원 등급 변경
			int res = jdbcTemplate.update(SQL_UPDATE_CHANGE_ROLE, vo.getRole(), vo.getRole(), vo.getUserNum());
			if (res < 1) {
				return false;
			}
			return true;
		} else if (vo.getPostNum() == null) {
			// 신고 당한 회원 등급 변경
			int res = jdbcTemplate.update(SQL_UPDATE_ROLE, vo.getUserId());
			if (res < 1) {
				return false;
			}
			return true;
		} else {
			// 회원정보 변경
			int res = jdbcTemplate.update(SQL_UPDATE, vo.getCatName(), vo.getPostNum(), vo.getAddress1(),
					vo.getAddress2(), vo.getUserId());
			if (res < 1) {
				return false;
			}
			return true;
		}

	}

	// 회원탈퇴, 회원 삭제
	public boolean delete(MemberVO vo) {
		int res = jdbcTemplate.update(SQL_DELETE, vo.getUserId());
		if (res < 1) {
			return false;
		}
		return true;
	}

	public MemberVO selectOne(MemberVO vo) {
		System.out.println("멤버 인자 : " + vo);
		try {
			if (vo.getUserId() != null && vo.getUserName() != null && vo.getPhoneNum() != null) {
				// 비밀번호 찾기. id, 이름, phoneNum 입력
				return jdbcTemplate.queryForObject(SQL_SELECTONE_FIND_PW, new MemberRowMapper(), vo.getUserId(),
						vo.getUserName(), vo.getPhoneNum());
			}
			if (vo.getUserPw() != null) {
				// 로그인시
				return jdbcTemplate.queryForObject(SELECTONE, new MemberRowMapper(), vo.getUserId(), vo.getUserPw());
			} else if (vo.getUserId() != null) {
				// 회원가입시 아이디 중복 확인 & 마이페이지 회원 정보
				return jdbcTemplate.queryForObject(SQL_SELECTONE_ID, new MemberRowMapper(), vo.getUserId());
			} else if (vo.getPhoneNum() != null) {
				// 휴대폰 번호 중복확인, 휴대폰 번호로 id 찾기
				return jdbcTemplate.queryForObject(SQL_SELECTONE_PHONE, (rs, rowNum) -> {
					MemberVO data = new MemberVO();
					data.setUserName(rs.getString("M_NM"));
					data.setUserId(rs.getString("M_ID"));
					data.setPhoneNum(rs.getString("PHONE_NO"));
					return data;
				}, vo.getPhoneNum());
			}
		} catch (EmptyResultDataAccessException e) {
			System.out.println("MemberDAO : selectOne 결과 없음");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public MemberVO selectOnePw(MemberVO vo) {
		// 해당 아이디의 암호화된 비밀번호 조회
		try {
			return jdbcTemplate.queryForObject(SELECT_ONE_PW, (rs, rowNum) -> {
				MemberVO data = new MemberVO();
				data.setUserPw(rs.getString("M_PW"));
				return data;
			}, vo.getUserId());
		} catch(EmptyResultDataAccessException e) {
			System.out.println("MemberDAO : selectOne 결과 없음");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// 회원 아이디 검색, 회원 전체 출력
	public ArrayList<MemberVO> selectAll(MemberVO vo) {
		return (ArrayList<MemberVO>) jdbcTemplate.query(SQL_SELECTALL, new MemberRowMapper());
	}

}

class MemberRowMapper implements RowMapper<MemberVO> {
	@Override
	public MemberVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		MemberVO vo = new MemberVO();
		vo.setUserName(rs.getString("M_NM"));
		vo.setUserId(rs.getString("M_ID"));
		vo.setUserNum(rs.getInt("M_NO"));
		vo.setCatName(rs.getString("CAT_NM"));
		vo.setPhoneNum(rs.getString("PHONE_NO"));
		vo.setPostNum(rs.getString("POST_NO"));
		vo.setAddress1(rs.getString("ADDRESS1"));
		vo.setAddress2(rs.getString("ADDRESS2"));
		vo.setWarnCnt(rs.getInt("WARN_CNT"));
		vo.setRole(rs.getNString("ROLE"));

		return vo;
	}
}
