package com.wan.nss.biz.image;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("ImageDAO")
public class ImageDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	// 이미지 추가
	private final String SQL_INSERT = "INSERT INTO IMAGE (TARGET_NO, TYPE_NO, I_NM) VALUES(?, ?, ?)";
	// 이미지 번호 / I_NO 대신 TARGET_NO, TYPE_NO 사용
	private final String SQL_SELECTONE = "SELECT * FROM IMAGE WHERE TYPE_NO = ? AND TARGET_NO = ?";
	// 이미지 전체 보기
	private final String SQL_SELECTALL = "SELECT * FROM IMAGE ORDER BY I_NO ASC";
	// 이미지 수정
//	private final String SQL_UPDATE = "UPDATE IMAGE SET I_NM = ?, TYPE_NO = ? WHERE I_NO=?";
	// 이미지 삭제 targetNum, TypeNum 받아와서 이미지 삭제 
	private final String SQL_DELETE_ALL = "DELETE FROM IMAGE WHERE TARGET_NO = ? AND TYPE_NO < ?+100 AND TYPE_NO > ?";

	public boolean insert(ImageVO ivo) {
		jdbcTemplate.update(SQL_INSERT, ivo.getTargetNum(), ivo.getTypeNum(), ivo.getImageName());
		return true;
	}

//	public boolean update(ImageVO ivo) {
//		jdbcTemplate.update(SQL_UPDATE, ivo.getImageName(), ivo.getTypeNum(), ivo.getImageNum());
//		return true;
//	}

	public boolean delete(ImageVO ivo) {
		jdbcTemplate.update(SQL_DELETE_ALL, ivo.getTargetNum(), ivo.getTypeNum(), ivo.getTypeNum());
		return true;
	}

	public ArrayList<ImageVO> selectAll(ImageVO ivo) {
		return (ArrayList<ImageVO>) jdbcTemplate.query(SQL_SELECTALL, new ImageRowMapper());
	}

	public ImageVO selectOne(ImageVO ivo) {
	  try {
		  Object[] args = { ivo.getTypeNum(), ivo.getTargetNum() };
		  return jdbcTemplate.queryForObject(SQL_SELECTONE, args, new ImageRowMapper());
	  } catch(Exception e) {
		  System.out.println("imageDAO selectOne 결과 없음");
		  return null;
	  }
   }

	class ImageRowMapper implements RowMapper<ImageVO> {

		@Override
		public ImageVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			ImageVO ivo = new ImageVO();
			ivo.setImageNum(rs.getInt("I_NO"));
			ivo.setImageName(rs.getString("I_NM"));
			ivo.setTargetNum(rs.getInt("TARGET_NO"));
			ivo.setTypeNum(rs.getInt("TYPE_NO"));

			return ivo;
		}
	}
}
