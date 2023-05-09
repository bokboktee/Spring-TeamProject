package com.wan.nss.biz.product;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("productDAO")
public class ProductDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	// 상품 추가
	private final String SQL_INSERT = "INSERT INTO PRODUCT (P_NM, P_CATEGORY, P_PRICE, P_AMT, P_DETAIL, DC_PERCENT) VALUES(?, ?, ?, ?, ?, ?)";
	// 상품 업데이트
	private final String SQL_UPDATE = "UPDATE PRODUCT SET P_NM = ?, P_CATEGORY = ?, P_PRICE = ?, P_AMT = ?, P_DETAIL = ?, DC_PERCENT = ? WHERE P_NO = ?";
	// 상품 구매시 재고에서 구매한 개수 빼기
	private final String SQL_UPDATE_AMOUNT = "UPDATE PRODUCT SET P_AMT = P_AMT - ? WHERE P_NO = ?";
	// 상품 삭제
	private final String SQL_DELETE = "DELETE FROM PRODUCT WHERE P_NO=?";

	// 상세보기 - ? : pNum
	private final String SQL_SELECTONE = "SELECT p.*, i.*, (p.P_PRICE * (100 - p.DC_PERCENT)/100) AS DC_PRICE "
			+ " FROM PRODUCT p INNER JOIN IMAGE i ON p.P_NO = i.TARGET_NO AND TYPE_NO = 101 WHERE p.P_NO = ?";
	// 가장 최근에 추가한 상품 pNum 가져오기
	private final String SELECT_ONE_NEWEST = "SELECT MAX(P_NO) AS P_NO FROM PRODUCT";
	// 상품 최고가 가져오기
	private final String SELECT_ONE_MAX_PRICE = "SELECT MAX(P_PRICE) AS MAX_PRICE FROM PRODUCT";

	// *** selectAll ***
	// 전체 카테고리 인기순(판매량순)
	// ? : lowPrice, highPrice
	private final String SELECT_ALL_WHOLE_POP = "SELECT p.*, i.*, SUM(OD_CNT), (p.P_PRICE * (100 - p.DC_PERCENT)/100) AS DC_PRICE "
			+ " FROM PRODUCT p INNER JOIN IMAGE i ON p.P_NO = i.TARGET_NO AND i.TYPE_NO = 101 "
			+ " INNER JOIN ORDER_DETAIL od ON od.P_NO = p.P_NO WHERE p.P_PRICE BETWEEN ? AND ? "
			+ " GROUP BY p.P_NO, i.I_NO ORDER BY SUM(OD_CNT) DESC";
	// 전체 카테고리 가격순(낮은 가격순, 높은 가격순) 혹은 최신순
	// ? : lowPrice, highPrice
	// %s : DC_PRICE ASC || DC_PRICE DESC || P_NO DESC
	private final String SELECT_ALL_WHOLE_SORT = "SELECT p.*, i.*, (p.P_PRICE * (100 - p.DC_PERCENT)/100) AS DC_PRICE "
			+ " FROM PRODUCT p INNER JOIN (SELECT * FROM IMAGE WHERE TYPE_NO = 101) i "
			+ " ON p.P_NO = i.TARGET_NO WHERE P_PRICE BETWEEN ? AND ? ORDER BY %s";

	// 전체 할인 상품 - 홈 할인상품
	private final String SELECT_ALL_WHOLE_DC = "SELECT p.*, i.*, SUM(od.OD_CNT), (p.P_PRICE * (100 - p.DC_PERCENT)/100) AS DC_PRICE "
			+ " FROM PRODUCT p INNER JOIN IMAGE i ON p.P_NO = i.TARGET_NO  AND i.TYPE_NO = 101 "
			+ " INNER JOIN ORDER_DETAIL od ON p.P_NO = od.P_NO WHERE DC_PERCENT != 0 "
			+ " GROUP BY p.P_NO, i.I_NO ORDER BY SUM(od.OD_CNT) DESC";

	// 카테고리별 인기순(판매량 순)
	// ? : category, lowPrice, highPrice
	private final String SELECT_ALL_CATEGORY_POP = "SELECT p.*, i.*, SUM(OD_CNT), (p.P_PRICE * (100 - p.DC_PERCENT)/100) AS DC_PRICE "
			+ " FROM PRODUCT p INNER JOIN IMAGE i ON p.P_NO = i.TARGET_NO AND i.TYPE_NO = 101 "
			+ " INNER JOIN ORDER_DETAIL od ON od.P_NO = p.P_NO AND P_CATEGORY = ? "
			+ " WHERE p.P_PRICE BETWEEN ? AND ? GROUP BY p.P_NO, i.I_NO ORDER BY SUM(OD_CNT) DESC";

	// 카테고리별 가격순(낮은 가격순, 높은 가격순) 혹은 최신순
	// ? : category, lowPrice, highPrice
	// %s : DC_PRICE ASC || DC_PRICE DESC || P_NO DESC
	private final String SELECT_ALL_CATEGORY_SORT = "SELECT p.*, i.*, (p.P_PRICE * (100 - p.DC_PERCENT)/100) AS DC_PRICE "
			+ " FROM PRODUCT p INNER JOIN (SELECT * FROM IMAGE WHERE TYPE_NO = 101) i "
			+ " ON p.P_NO = i.TARGET_NO WHERE P_CATEGORY = ? AND P_PRICE BETWEEN ? AND ? ORDER BY %s ";

	// 카테고리별 할인 상품
	// ? : category
	private final String SELECT_ALL_CATEGORY_DC = "SELECT p.*, i.*, SUM(od.OD_CNT), (p.P_PRICE * (100 - p.DC_PERCENT)/100) AS DC_PRICE "
			+ " FROM PRODUCT p INNER JOIN IMAGE i ON p.P_NO = i.TARGET_NO INNER JOIN ORDER_DETAIL od "
			+ " ON p.P_NO = od.P_NO AND TYPE_NO = 101 WHERE DC_PERCENT != 0 AND p.P_CATEGORY = ? "
			+ " GROUP BY p.P_NO, i.I_NO ORDER BY SUM(od.OD_CNT) DESC";

	// 상품 검색
	private final String SELECT_ALL_SEARCH = "SELECT p.*, i.*, (p.P_PRICE * (100 - p.DC_PERCENT)/100) AS DC_PRICE, SUM(od.OD_CNT) "
			+ " FROM PRODUCT p INNER JOIN (SELECT * FROM IMAGE WHERE TYPE_NO = 101) i "
			+ " ON p.P_NO = i.TARGET_NO LEFT JOIN ORDER_DETAIL od ON p.P_NO = od.P_NO "
			+ " WHERE p.P_NM LIKE CONCAT('%', ?, '%') GROUP BY p.P_NO, i.I_NO ORDER BY SUM(od.OD_CNT) DESC";

	// 상품 추가
	public boolean insert(ProductVO pvo) {
		int res = jdbcTemplate.update(SQL_INSERT, pvo.getpName(), pvo.getCategory(), pvo.getPrice(), pvo.getpAmt(),
				pvo.getpDetail(), pvo.getpDcPercent());
		if(res < 1) {
			return false;
		}
		return true;
	}

	// 상품 & 재고 업데이트
	public boolean update(ProductVO pvo) {
		if (pvo.getpSearchCondition() == null) { // 상품 정보 수정
			int res = jdbcTemplate.update(SQL_UPDATE, pvo.getpName(), pvo.getCategory(), pvo.getPrice(), pvo.getpAmt(),
					pvo.getpDetail(), pvo.getpDcPercent(), pvo.getpNum());
			if (res < 1) {
				return false;
			}
			return true;
		}
		if (pvo.getpSearchCondition().equals("buy")) { // 구매시 재고 빼기
			int res = jdbcTemplate.update(SQL_UPDATE_AMOUNT, pvo.getpCnt(), pvo.getpNum());
			if (res < 1) {
				return false;
			}
			return true;
		}
		return false;
	}

	// 상품 삭제
	public boolean delete(ProductVO pvo) {
		if(jdbcTemplate.update(SQL_DELETE, pvo.getpNum()) < 1) {
			return false;
		}
		return true;
	}

	public ArrayList<ProductVO> selectAll(ProductVO pvo) {

		if (pvo.getCategory() == null) {
			if (pvo.getpSearchContent() != null) { // 상품 검색
				return (ArrayList<ProductVO>) jdbcTemplate.query(SELECT_ALL_SEARCH, new ProductRowMapper(),
						pvo.getpSearchContent());
			}
			return null;
		}

		if (pvo.getCategory().equals("all")) { // 전체 카테고리일 때
			String sql = "";

			if (pvo.getSort() == null) {
				if (pvo.getpSearchCondition() != null && pvo.getpSearchCondition().equals("dc")) {
					// 전체 할인 상품
					return (ArrayList<ProductVO>) jdbcTemplate.query(SELECT_ALL_WHOLE_DC, new ProductRowMapper());
				}
			} else if (pvo.getSort().equals("sellDesc")) { // 인기순
				return (ArrayList<ProductVO>) jdbcTemplate.query(SELECT_ALL_WHOLE_POP, new ProductRowMapper(),
						pvo.getSearchLowPrice(), pvo.getSearchHighPrice());

			} else if (pvo.getSort().equals("priceAsc")) { // 낮은 가격순
				sql = String.format(SELECT_ALL_WHOLE_SORT, "DC_PRICE ASC");

				return (ArrayList<ProductVO>) jdbcTemplate.query(sql, new ProductRowMapper(), pvo.getSearchLowPrice(),
						pvo.getSearchHighPrice());

			} else if (pvo.getSort().equals("priceDesc")) { // 높은 가격순
				sql = String.format(SELECT_ALL_WHOLE_SORT, "DC_PRICE DESC");

				return (ArrayList<ProductVO>) jdbcTemplate.query(sql, new ProductRowMapper(), pvo.getSearchLowPrice(),
						pvo.getSearchHighPrice());

			} else if (pvo.getSort().equals("regiDesc")) { // 최신순
				sql = String.format(SELECT_ALL_WHOLE_SORT, "P_NO DESC");

				return (ArrayList<ProductVO>) jdbcTemplate.query(sql, new ProductRowMapper(), pvo.getSearchLowPrice(),
						pvo.getSearchHighPrice());
			}
		} else { // 카테고리가 food/treat/sand 일 때
			String sql = "";
			if (pvo.getSort() == null) {
				if (pvo.getpSearchCondition() != null && pvo.getpSearchCondition().equals("dc")) {
					// 카테고리별 할인 상품
					return (ArrayList<ProductVO>) jdbcTemplate.query(SELECT_ALL_CATEGORY_DC, new ProductRowMapper(),
							pvo.getCategory());
				}
			} else if (pvo.getSort().equals("sellDesc")) { // 인기순
				return (ArrayList<ProductVO>) jdbcTemplate.query(SELECT_ALL_CATEGORY_POP, new ProductRowMapper(),
						pvo.getCategory(), pvo.getSearchLowPrice(), pvo.getSearchHighPrice());
			} else if (pvo.getSort().equals("priceAsc")) { // 낮은 가격순
				sql = String.format(SELECT_ALL_CATEGORY_SORT, "DC_PRICE ASC");

				return (ArrayList<ProductVO>) jdbcTemplate.query(sql, new ProductRowMapper(), pvo.getCategory(),
						pvo.getSearchLowPrice(), pvo.getSearchHighPrice());
			} else if (pvo.getSort().equals("priceDesc")) { // 높은 가격순
				sql = String.format(SELECT_ALL_CATEGORY_SORT, "DC_PRICE DESC");
				return (ArrayList<ProductVO>) jdbcTemplate.query(sql, new ProductRowMapper(), pvo.getCategory(),
						pvo.getSearchLowPrice(), pvo.getSearchHighPrice());
			} else if (pvo.getSort().equals("regiDesc")) { // 최신 등록순
				sql = String.format(SELECT_ALL_CATEGORY_SORT, "P_NO DESC");
				return (ArrayList<ProductVO>) jdbcTemplate.query(sql, new ProductRowMapper(), pvo.getCategory(),
						pvo.getSearchLowPrice(), pvo.getSearchHighPrice());
			}
		}

		return null;
	}

	public ProductVO selectOne(ProductVO pvo) {
		try {
			if (pvo.getpSearchCondition() == null) {
				// 1. 상세보기 : pNum만 세팅
				return jdbcTemplate.queryForObject(SQL_SELECTONE, new ProductRowMapper(), pvo.getpNum());
			}
			if (pvo.getpSearchCondition().equals("newest")) {
				// 2. 가장 최근에 등록된 상품 번호 조회
				return jdbcTemplate.queryForObject(SELECT_ONE_NEWEST, (rs, rowNum) -> {
					ProductVO data = new ProductVO();
					data.setpNum(rs.getInt("P_NO"));
					return data;
				});
			} else if (pvo.getpSearchCondition().equals("max")) {
				return jdbcTemplate.queryForObject(SELECT_ONE_MAX_PRICE, (rs, rowNum) -> {
					ProductVO data = new ProductVO();
					data.setPrice(rs.getInt("MAX_PRICE"));
					return data;
				});
			}
		} catch (Exception e) {
			System.out.println("ProductDAO selectOne 결과 없음");
		}
		return null;
	}

	class ProductRowMapper implements RowMapper<ProductVO> {

		@Override
		public ProductVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			ProductVO pvo = new ProductVO();
			pvo.setpNum(rs.getInt("P_NO")); // 상품 번호
			pvo.setpName(rs.getString("P_NM")); // 상품 이름
			pvo.setCategory(rs.getString("P_CATEGORY")); // 카테고리
			pvo.setPrice(rs.getInt("P_PRICE")); // 가격
			pvo.setpAmt(rs.getInt("P_AMT")); // 재고
			pvo.setpDetail(rs.getString("P_DETAIL")); // 상세설명
			pvo.setpDcPercent(rs.getInt("DC_PERCENT")); // 할인율
			pvo.setDc_price(rs.getInt("DC_PRICE")); // 할인된 가격
			pvo.setImageName(rs.getString("I_NM")); // 상품 대표 이미지 파일 이름

			return pvo;
		}
	}
}
