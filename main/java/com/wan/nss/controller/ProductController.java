package com.wan.nss.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.wan.nss.biz.common.Crawling;
import com.wan.nss.biz.image.ImageService;
import com.wan.nss.biz.image.ImageVO;
import com.wan.nss.biz.product.ConvertEntoKo;
import com.wan.nss.biz.product.ProductService;
import com.wan.nss.biz.product.ProductVO;
import com.wan.nss.biz.review.ReviewService;
import com.wan.nss.biz.review.ReviewVO;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private ImageService imageService;
	@Autowired
	private Crawling crawling;

	// 멤버, 상품
	@RequestMapping(value = "/main.do")
	public String mainView(ProductVO pvo, ProductVO pvo2, Model model, HttpServletRequest request, HttpSession session) {
		// 신상품 데이터. pvo : category == all, sort == regiDesc
		System.out.println("   로그: main.do");

		// 크롤링
		pvo.setCategory("all");
		pvo.setSort("regiDesc");
		pvo.setSearchLowPrice(0);
		pvo2.setpSearchCondition("max"); // selectOne에서 인자로 쓸 것
		pvo.setSearchHighPrice(productService.selectOne(pvo2).getPrice());

		List<ProductVO> datas = productService.selectAll(pvo);
		System.out.println();
		System.out.println("-----------------------------------------------------");
		System.out.println("상품 개수: " + datas.size()); // 상품 개수 로그
		if (datas.size() < 48) {
			for (ProductVO v : datas) {
				System.out.println("상품 번호: " + v.getpNum());
			}			
			System.out.println("-----------------------------------------------------");
			crawling.sample(request);
		}
		else {
			System.out.println("이미 크롤링 됨");
		}

		// 전체 최신순(등록일순): category = all, sort = regiDesc
		model.addAttribute("newPList", productService.selectAll(pvo));

		// 전체 인기순(판매량순): category == all, sort == sellDesc
		pvo.setSort("sellDesc");
		model.addAttribute("popPList", productService.selectAll(pvo)); //주문데이터가 있어야 가능 (지금 사료밖에 없음)
 if(request.getParameter("lang") != null) {
	 session.setAttribute("lang",request.getParameter("lang"));
	}
		
		return "main.jsp";
	}

	// 쇼핑페이지 이동
	@RequestMapping(value = "/shop.do")
	public String shopView(ProductVO pvo, ProductVO pvo2, Model model, HttpSession session) {
		// 파라미터별로 상이한 상품 목록들 세팅하기: shopping.do?category=???
		// 디폴트값: 인기순, 찾을 가격 0 ~ 1000000

		// 할인상품 정렬
		pvo.setpSearchCondition("dc");
		pvo.setSort("sellDesc"); // sort 종류: sellDesc (인기순:주문량순) / priceAsc (낮은 가격순) / priceDesc (높은 가격순) /
		// regiDesc (최신순)
		pvo.setSearchLowPrice(0);
		pvo2.setpSearchCondition("max"); // selectOne에서 인자로 쓸 것
		pvo.setSearchHighPrice(productService.selectOne(pvo2).getPrice());
		model.addAttribute("maxPrice",pvo.getSearchHighPrice());//
		model.addAttribute("pList", productService.selectAll(pvo));

		// 쇼핑페이지 기본 이동 (shop.do?category=all)
		if (pvo.getCategory().equals("all")) {
			return "shop.jsp";
		}
		// 카테고리별 쇼핑페이지 기본 이동 (shop.do?category=food/treat/sand)
		else if (pvo.getCategory().equals("food") || pvo.getCategory().equals("treat")
				|| pvo.getCategory().equals("sand")) {
			return "shop_" + pvo.getCategory() + ".jsp"; // 카테고리 별로 다른 페이지 이동 (all, food, treat, sand)
		}
		return null;// nullPointException 내서 페이지 이동하려고
	}

	// 상품세부페이지 이동: 추후 pvo2 지울 예정
	@RequestMapping(value = "/shopDetails.do")
	public String shopDetailView(ProductVO pvo, ProductVO pvo2, ImageVO ivo, ReviewVO rvo, Model model) {
		System.out.println("pNum: " + pvo.getpNum());
		
		ProductVO resPvo = productService.selectOne(pvo); // 해당 상품 및 달려있는 리뷰 set,  상세페이지에서 보여줄 상품num을 selectAll에 돌린 결과를 resPvo에 저장
			
		// 상세이미지 불러오기
	    ivo.setTargetNum(resPvo.getpNum()); // 상품pk를 이미지pk에 세팅
	    ivo.setTypeNum(102);
	    ImageVO selectIvo = imageService.selectOne(ivo); // 세팅된 이미지pk를 가지고 selectOne하여 상세이미지 정보 불러오기
	    resPvo.setImageName2(selectIvo.getImageName()); // 상세이미지가 selectOne된 ivo의 imageName을 pvo의 ImageName2에 세팅		
		System.out.println("resPvo.getImageName2: "+resPvo.getImageName2()); // 확인

		//해당 제품의 리뷰 보기
		rvo.setrSearchCondition("pNum"); 
		rvo.setpNum(resPvo.getpNum()); //리뷰 num을 해당 상품의 num으로 세팅
		
		// 관련상품 목록 가져오기 조건 : pName==null, 카테고리 nn, 정렬 nn
		pvo.setCategory(resPvo.getCategory());
		pvo.setSort("sellDesc"); // 관련상품(선택된 카테고리의 인기상품들) 가져오기 위해 정렬 set
		pvo.setSearchLowPrice(0);
		pvo2.setpSearchCondition("max"); // selectOne에서 인자로 쓸 것
		pvo.setSearchHighPrice(productService.selectOne(pvo2).getPrice());

		//이거 결과값
		ArrayList<ReviewVO> rList = reviewService.selectAll(rvo); // 리뷰 리스트 
		ArrayList<ProductVO> pList = productService.selectAll(pvo); // 관련 상품 리스트

		System.out.println(rList);
		System.out.println(pList);
		
		model.addAttribute("pvo", resPvo); // 해당 상품의 정보들을 보내줌
		model.addAttribute("rList", rList); //해당 리뷰를 받고 있음??? 뷰에서 확인을 해봐야 할 거 같음.. 이 이상으로 뭘 해줄 수가 없음
		model.addAttribute("pList", pList);

		return "shop_details.jsp";
	}

	
	// (관리자)상품 수정 기능: 해당 상품 관리 페이지에서 "수정" 버튼 클릭 시 실제 수정
	@RequestMapping(value = "/updateProduct.do", method = RequestMethod.POST)
	public String updateProduct(ProductVO pvo, ImageVO ivo, HttpSession session, MultipartHttpServletRequest request, Model model) {
		
		// 각자 이미지 저장할 위치
		String projectPath = session.getServletContext().getRealPath("/"); // 파일 경로 ".../webapp/" 까지
		projectPath = projectPath.substring(0, projectPath.indexOf(".metadata"));
		System.out.println("projectPath: " + projectPath);
		System.out.println();
		
		Map<String, MultipartFile> fileMap = request.getFileMap();
        for (int i = 0; i < fileMap.size(); i++) {
        	
        	String typeNum = Integer.toString(101 + i);
            
            String filePath = projectPath + "NYANGSINSA2/src/main/webapp/img/" + typeNum;
            
            File file = new File(filePath);
            if(!file.exists()) { // 디렉토리가 없으면 생성
                file.mkdirs();
                System.out.println("로그: 디렉토리 생성 완료");
            }
            
			if (fileMap.get("img" + (i + 1)) != null) {
				file = new File(filePath + "/" + pvo.getpNum() + ".jpg");
				if (!file.exists()) { // 기존 파일을 삭제
					file.delete();
					System.out.println("로그: 기존 이미지 파일 삭제 완료");
				}

				try {
					fileMap.get("img" + (i + 1)).transferTo(file); // 새 파일 저장
				} catch (Exception e) {
					// TODO: handle exception
				}
			}
            
        }
	        
		// update ProductVO
        try {
        	productService.update(pvo);
        }catch(Exception e) {
        	model.addAttribute("msg", "ERROR : UPDATE 실패");
			model.addAttribute("location", "main.do");
			return "alert.jsp";
        }
        return "productManagePage.do";
        	
//		if (!productService.update(pvo)) { // 실패 시 알림창
//			try {
//				PrintWriter out = response.getWriter();
//				response.setContentType("text/html; charset=utf-8");
//				out.println("<SCRIPT>alert('ERROR : UPDATE 실패');</SCRIPT>");
//			} catch (Exception e) {
//				// TODO: handle exception
//			}
//			return "adminProductDetail.do?pNum=" + pvo.getpNum();	
//		}
//		else {
//			return "productManagePage.do";                          
//		}

	}

	// 상품 검색
	@RequestMapping(value = "/search.do")
	public String selectAllProductSearch(ProductVO pvo, Model model) {
		
		System.out.println("search.do 진입");
		
		System.out.println("pSearchContent: " + pvo.getpSearchContent());

		model.addAttribute("pSearchContent", pvo.getpSearchContent());

		return "search_result.jsp";
	}

	//ListController
	@ResponseBody
	@RequestMapping(value="/getList.do", method = RequestMethod.POST)
	public JsonArray sendList(ProductVO pvo, Model model) {

		System.out.println("getList.do 진입");

		System.out.println("ListController 실행 조건: ");
		System.out.println("pSearchCondition: " + pvo.getpSearchCondition());
		System.out.println("category: " + pvo.getCategory());
		System.out.println("sort: " + pvo.getSort());
		System.out.println("searchLowPrice: " + pvo.getSearchLowPrice());
		System.out.println("searchHighPrice: " + pvo.getSearchHighPrice());

		// 뷰에서 넘어온 조건으로 상품리스트 가져오기
		ArrayList<ProductVO> list = productService.selectAll(pvo); // 결과 상품 목록

		// 뷰에서 전체상품 최고가 가져온 후 response에 세팅
		pvo.setpSearchCondition("max");
		model.addAttribute("maxPrice", productService.selectOne(pvo).getPrice());

		JsonArray datas = new Gson().toJsonTree(list).getAsJsonArray(); // JsonArry로 변경하여 반환

		return datas;
	}

	//SearchListController
	@ResponseBody
	@RequestMapping(value="/getSearchList.do", method = RequestMethod.POST)
	public JsonArray getSearchList(ProductVO pvo, Model model) {
		
		System.out.println("getSearchList.do 진입");
		
		// ajax가 보낸 searchContent
		System.out.println("pvo.getCategory: " + pvo.getCategory());
		System.out.println("pvo.pSearchContent: " + pvo.getpSearchContent());
		
		// ajax()로 넘어온 pSearchContent를 세팅한 pvo를 가지고 selectAll 
		ArrayList<ProductVO> list = productService.selectAll(pvo); // 상품 검색 결과
		
		if(list.isEmpty()) {
			String engToKor = new ConvertEntoKo().engToKor(pvo.getpSearchContent());
			pvo.setpSearchContent(engToKor);
			list = productService.selectAll(pvo);
		}
		
		JsonArray datas = new Gson().toJsonTree(list).getAsJsonArray(); 
		
		return datas;
	}

}
