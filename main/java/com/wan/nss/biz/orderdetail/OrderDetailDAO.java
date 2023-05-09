package com.wan.nss.biz.orderdetail;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;



@Repository("orderDetailDAO")
public class OrderDetailDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	// 주문 상세 추가 / 상품 가격 ((100 - 할인율 /100)* 상품 수량 -> 컨트롤러에서 해주고 있음
	private final String SQL_INSERT = "INSERT INTO ORDER_DETAIL (O_NO, P_NO, OD_CNT, OD_PRICE) VALUES(?, ?, ?, ?)";
	// 주문 전체 목록 출력
	private final String SQL_SELECTALL = "SELECT od.O_NO, od.OD_NO, p.P_NM, od.OD_CNT, p.P_NO, od.OD_PRICE * od.OD_CNT AS OD_PRICE FROM PRODUCT p INNER JOIN ORDER_DETAIL od ON p.P_NO = od.P_NO GROUP BY p.P_NM, od.OD_CNT, od.O_NO, od.OD_NO, p.P_NO ORDER BY od.O_NO DESC";
	// 주문 상세 내역 
	private final String SQL_SELECTALL_ONUM = "SELECT  od.O_NO, p.P_NM, od.OD_CNT, od.OD_PRICE, p.P_NO, i.I_NM FROM PRODUCT p INNER JOIN ORDER_DETAIL od ON p.P_NO = od.P_NO AND od.O_NO = ? INNER JOIN IMAGE i ON p.P_NO = i.TARGET_NO AND i.TYPE_NO = 101 GROUP BY od.O_NO, p.P_NM, od.OD_CNT, od.OD_PRICE, p.P_NO, i.I_NM";
	// 상품 수량 및 가격 (관리자) / 카테고리별 주문 수량
	private final String SQL_SELECTONE_CATEGORY_CNT_SUM = "SELECT COUNT(od.OD_NO) AS CNT, SUM(od.OD_PRICE) AS SUM FROM ORDER_DETAIL od INNER JOIN PRODUCT p ON p.P_NO = od.P_NO WHERE p.P_CATEGORY = ? ";
	

	
	// 주문 상세
	public boolean insert(OrderDetailVO odvo) {
		jdbcTemplate.update(SQL_INSERT, odvo.getoNum(), odvo.getpNum(), odvo.getOdCnt(), odvo.getOdPrice());
		return true;
	}

	public OrderDetailVO selectOne(OrderDetailVO odvo) {
		try {
			Object[] args = { odvo.getCategory()}; 
			return (OrderDetailVO) jdbcTemplate.queryForObject(SQL_SELECTONE_CATEGORY_CNT_SUM, args, (rs, rowNum) -> {
				OrderDetailVO data = new OrderDetailVO();
				data.setOdCnt(rs.getInt("CNT"));
				data.setSum(rs.getInt("SUM"));
				return data;
			});
			
		} catch (Exception e) {
			System.out.println("OdrerDetailDAO selectOne 결과 없음");
		}
		return null;
	}
	
	public ArrayList<OrderDetailVO> selectAll(OrderDetailVO odvo) {

		if (odvo.getOdNum() > 0) {
			// 회원 상세 주문 내역  
			System.out.println("주문");
			Object[] args = { odvo.getoNum() };
			return (ArrayList<OrderDetailVO>) jdbcTemplate.query(SQL_SELECTALL_ONUM, args, (rs, rowNum) -> {
			OrderDetailVO data = new OrderDetailVO();
			data.setoNum(rs.getInt("O_NO"));
			data.setpName(rs.getString("P_NM"));
			data.setOdCnt(rs.getInt("OD_CNT"));
			data.setOdPrice(rs.getInt("OD_PRICE"));
			data.setpNum(rs.getInt("P_NO"));
			data.setImageName(rs.getString("I_NM"));
			return data;
			});
			
		} else { 
			// 상세 주문 전체 목록
			return (ArrayList<OrderDetailVO>) jdbcTemplate.query(SQL_SELECTALL, (rs, rowNum) -> {
				OrderDetailVO data = new OrderDetailVO();
				data.setoNum(rs.getInt("O_NO"));
				data.setpName(rs.getString("P_NM"));
				data.setOdCnt(rs.getInt("OD_CNT"));
				data.setOdPrice(rs.getInt("OD_PRICE"));
				data.setpNum(rs.getInt("P_NO"));
				data.setOdNum(rs.getInt("OD_NO"));
				return data;
			});
		}
	}

	class OrderDetailRowMapper implements RowMapper<OrderDetailVO> {

		@Override
		public OrderDetailVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			OrderDetailVO odvo = new OrderDetailVO();
			odvo.setOdNum(rs.getInt("OD_NO"));
			odvo.setoNum(rs.getInt("O_NO"));
			odvo.setpNum(rs.getInt("P_NO"));
			odvo.setOdCnt(rs.getInt("OD_CNT"));
			odvo.setOdPrice(rs.getInt("OD_PRICE"));
			
			odvo.setOdPrice(rs.getInt("SUM"));
			odvo.setOdPrice(rs.getInt("CNT"));
			

			return odvo;
		}
	}
}
