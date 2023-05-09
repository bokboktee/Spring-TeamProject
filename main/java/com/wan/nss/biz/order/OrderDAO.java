package com.wan.nss.biz.order;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("orderDAO")
public class OrderDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	// 주문 추가
	private final String SQL_INSERT = "INSERT INTO `ORDER` (M_NO, RCV_NM, RCV_PHONE_NO, RCV_ADDRESS, O_PAY) VALUES((SELECT M_NO FROM MEMBER WHERE M_ID = ?), ?, ?, ?, ?)";
	// 주문 삭제
	private final String SQL_DELETE = "DELETE FROM `ORDER` WHERE O_NO=? ";

	// 현재 회원이 가장 최근에 추가한 주문
	final String SQL_SELECTONE_LATESTORDER = "SELECT O_NO FROM `ORDER` WHERE M_NO = (SELECT M_NO FROM MEMBER WHERE M_ID = ?) ORDER BY O_NO DESC LIMIT 1;";

	// 올해 주문 총 금액
	final String SELECT_ONE_THIS_YEAR = "SELECT SUM(od.OD_PRICE) AS O_PRICE FROM `ORDER` o INNER JOIN ORDER_DETAIL od "
			+ " ON o.O_NO = od.O_NO WHERE YEAR(o.O_DT) = YEAR(CURDATE()) GROUP BY YEAR(o.O_DT)";

	// 작년 주문 총 금액
	final String SELECT_ONE_LAST_YEAR = "SELECT SUM(od.OD_PRICE) AS O_PRICE FROM `ORDER` o INNER JOIN ORDER_DETAIL od "
			+ "ON o.O_NO = od.O_NO WHERE YEAR(o.O_DT) = YEAR(CURDATE()) - 1 GROUP BY YEAR(o.O_DT)";

	// 해당 회원의 주문 내역 전체 + 총 금액
	final String SELECT_ALL_ORDER = "SELECT o.*, SUM(od.OD_PRICE) AS O_PRICE FROM `ORDER` o "
			+ " INNER JOIN ORDER_DETAIL od ON o.O_NO = od.O_NO WHERE o.M_NO = (SELECT M_NO FROM MEMBER WHERE M_ID = ?) GROUP BY o.O_NO"
			+ " ORDER BY o.O_NO DESC";

	// 관리자 - 최근 거래. 최근 거래 내역의 결제 방법과 총 금액.
	final String SELECT_ALL_ADMIN_ORDER = "SELECT o.O_NO, o.O_PAY , SUM(od.OD_PRICE) AS O_PRICE FROM `ORDER` o "
			+ "INNER JOIN ORDER_DETAIL od ON o.O_NO = od.O_NO GROUP BY o.O_NO ORDER BY o.O_NO DESC";

	// 주문 추가
	public boolean insert(OrderVO vo) {
		System.out.println(vo);
		jdbcTemplate.update(SQL_INSERT, vo.getUserId(), vo.getRcvName(), vo.getRcvPhoneNum(), vo.getRcvAddress(),
				vo.getoPay());
		return true;
	}

	// 주문 삭제
	public boolean delete(OrderVO vo) {
		jdbcTemplate.update(SQL_DELETE, vo.getoNum());
		return true;
	}

	public OrderVO selectOne(OrderVO vo) {
		try {
			if (vo.getoSearchCondition() == null) {
				System.out.println("searchCondition 없음");
				return null;
			}
			if (vo.getoSearchCondition().equals("lastOrder")) {
				// 현재 회원이 가장 최근에 추가한 주문
				System.out.println("vo.getUserId(): " + vo.getUserId());
				Object[] args = { vo.getUserId() };
				return jdbcTemplate.queryForObject(SQL_SELECTONE_LATESTORDER, args, (rs, rowNum) -> {
					OrderVO data = new OrderVO();
					data.setoNum(rs.getInt("O_NO"));
					return data;
				});
			} else if (vo.getoSearchCondition().equals("thisYear")) {
				// 올해 총 주문 금액
				return jdbcTemplate.queryForObject(SELECT_ONE_THIS_YEAR, (rs, rowNum) -> {
					OrderVO data = new OrderVO();
					data.setoPrice(rs.getInt("O_PRICE"));
					return data;
				});
			} else if (vo.getoSearchCondition().equals("lastYear")) {
				// 작년 총 주문 금액
				return jdbcTemplate.queryForObject(SELECT_ONE_LAST_YEAR, (rs, rowNum) -> {
					OrderVO data = new OrderVO();
					data.setoPrice(rs.getInt("O_PRICE"));
					return data;
				});
			}
			return null;
		} catch (Exception e) {
			System.out.println("OrderDAO : selectOne 결과 없음");
			return new OrderVO();
		}
	}

	public ArrayList<OrderVO> selectAll(OrderVO vo) {

		if (vo.getUserId() != null) {
			// 주문 완료 했을 때 해당 회원의 주문 전체 내역
			// 총 금액을 oPrice 에 세팅
			return (ArrayList<OrderVO>) jdbcTemplate.query(SELECT_ALL_ORDER, new OrderRowMapper(), vo.getUserId());

		} else if (vo.getoSearchCondition().equals("adminOrderChart")) {
			// 카카오페이 뜨는 거
			// 총 금액을 oPrice 에 세팅
			return (ArrayList<OrderVO>) jdbcTemplate.query(SELECT_ALL_ADMIN_ORDER, (rs, rowNum) -> {
				OrderVO data = new OrderVO();
				data.setoNum(rs.getInt("O_NO"));
				data.setoPay(rs.getString("O_PAY"));
				data.setoPrice(rs.getInt("O_PRICE"));
				return data;
			});

		}
		return null;
	}

	class OrderRowMapper implements RowMapper<OrderVO> {
		@Override
		public OrderVO mapRow(ResultSet rs, int rowNum) throws SQLException {

			OrderVO vo = new OrderVO();
			vo.setoNum(rs.getInt("O_NO"));
			vo.setUserNum(rs.getInt("M_NO"));
			vo.setoDate(rs.getString("O_DT"));
			vo.setRcvName(rs.getString("RCV_NM"));
			vo.setRcvPhoneNum(rs.getString("RCV_PHONE_NO"));
			vo.setRcvAddress(rs.getString("RCV_ADDRESS"));
			vo.setoPay(rs.getString("O_PAY"));

			vo.setoPrice(rs.getInt("O_PRICE")); // 주문당 총 금액
			return vo;

		}
	}
}
