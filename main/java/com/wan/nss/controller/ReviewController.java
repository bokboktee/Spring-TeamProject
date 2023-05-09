package com.wan.nss.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.wan.nss.biz.product.ProductService;
import com.wan.nss.biz.product.ProductVO;
import com.wan.nss.biz.review.ReviewService;
import com.wan.nss.biz.review.ReviewVO;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	@Autowired
	private ProductService productService;

	//리뷰 페이지 이동 (완)
	@RequestMapping(value="/reviewPage.do")
	public String reviewView(ReviewVO rvo,ProductVO pvo,Model model,HttpSession session,
			HttpServletResponse response, HttpServletRequest request) {
		System.out.println("reviewViewController 진입");

		// 세션에서 로그인 한 회원아이디 받아 저장
		String memberId = (String) session.getAttribute("memberId");

		System.out.println("memberId="+memberId);

		// 해당 제품의 리뷰 전체보기
		rvo.setrSearchCondition("pNum");
		ArrayList<ReviewVO> rdatas = reviewService.selectAll(rvo); //pNum을 세팅하여 selectAll 

		System.out.println("rdatas= "+rdatas); 

		// View가 보내준 pNum 확인
		System.out.println("pNum: " + pvo.getpNum()); 	
		System.out.println("pNum: " + rvo.getpNum()); 	

		// pNum으로 선택된 상품 정보를 pvo에 저장하여 View에서 사용하게 보냄
		ProductVO resPvo = productService.selectOne(pvo); 

		System.out.println("pvo: "+resPvo); // pvo가 저장되지 않았음

		model.addAttribute("pvo", resPvo);


		// 해당 상품의 리뷰목록의 작성자 중에 현재 로그인한 회원이 있을 경우, 리뷰 작성 창 닫기 처리
		for (ReviewVO v : rdatas) { 
			if (v.getUserId().equals(memberId)) { 
				model.addAttribute("msg", "이미 리뷰를 작성하셨습니다.");
				model.addAttribute("location", "");
				return "alert.jsp";			
			}
			//System.out.println("for문 1번 수행 완료");
		}
		return "review.jsp"; // View에서 리뷰창으로 갈 수 있도록 리뷰페이지 return
	}

	// 사용자 리뷰 추가 (알림창만 띄워줌) (완)
	@RequestMapping(value="/insertReview.do")
	public String insertReview(ReviewVO rvo, Model model,HttpServletResponse response, HttpServletRequest request) {
		System.out.println("insertReviewController 진입");

		// insert input 잘 들어오는지 확인
		System.out.println("pNum: "+rvo.getpNum());
		System.out.println("memberId: "+rvo.getUserId());
		System.out.println("rContent: "+rvo.getrContent());
		System.out.println("rRate: "+rvo.getrRate());
		System.out.println("리뷰 추가 완료");

		if(reviewService.insert(rvo)) {  
			model.addAttribute("msg", "리뷰가 등록되었습니다.");
			model.addAttribute("location", "");
			return "alert.jsp";	
		}
		else { // 실패 시 
			model.addAttribute("msg", "에러 발생. 잠시 후 다시 시도해주세요.");
			model.addAttribute("location", "");
			return "alert.jsp";	
		}
	}

	// 내 리뷰 모아보기 페이지 (완)
	@RequestMapping(value = "/myReviewView.do") 
	public String myReviewView(ReviewVO rvo,Model model,HttpSession session) { 
		System.out.println("myReviewViewController 진입");

		rvo.setrSearchCondition("myReviews");
		rvo.setUserId((String)session.getAttribute("memberId"));
		model.addAttribute("rList", reviewService.selectAll(rvo));
		return "my_review.jsp";
	}

	// (관리자)리뷰 삭제
	@RequestMapping(value="/deleteReview.do")
	public String deleteReview(ReviewVO rvo, HttpSession session,
			HttpServletResponse response, Model model) {
		System.out.println("deleteReviewController 입장");

		//유저 아이디 세션에서 받아오기
		String id = (String)session.getAttribute("memberId");

		//세션에 아이디가 없거나 관리자가 아닌 회원이 접근한 경우 경고와 함께 메인으로 돌려보냄
		if (id == null || !(id.equals("admin"))) {
			// 로그인을 안 하거나 admin이 아니면 접근 권한 없음.
			model.addAttribute("msg", "접근 권한이 없습니다.");
			model.addAttribute("location", "main.do"); //main에서 lang을 전달해줌
			return "alert.jsp";
		}
		
		if (!reviewService.delete(rvo)) { // 리뷰 삭제 실패 시
			model.addAttribute("msg", "Delete 실패. 잠시 후 다시 시도하세요.");
			model.addAttribute("location", "review_manage.jsp");
			return "alert.jsp";
		}
		return "redirect:review_manage.jsp"; //null, forward 상황
	}

	//ReviewListController (완)
	@ResponseBody
	@RequestMapping(value="getReviewList.do", method = RequestMethod.POST)
	public JsonArray getReviewList(ReviewVO rvo) {
		System.out.println("getReviewListServletController 진입");

		rvo.setrSearchCondition("pNum"); // "해당 상품의 리뷰 보기"에 걸리도록 설정
		ArrayList<ReviewVO> list = reviewService.selectAll(rvo); // ajax로 받은 pNum을 selectAll (리뷰리스트 결과)
		JsonArray datas = new Gson().toJsonTree(list).getAsJsonArray(); // JsonArry로 변경하여 반환

		return datas;
	}


}
