package com.wan.nss.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wan.nss.biz.member.MemberService;
import com.wan.nss.biz.member.MemberVO;
import com.wan.nss.biz.order.OrderService;
import com.wan.nss.biz.order.OrderVO;
import com.wan.nss.biz.orderdetail.OrderDetailService;
import com.wan.nss.biz.orderdetail.OrderDetailVO;
import com.wan.nss.biz.product.ProductService;
import com.wan.nss.biz.product.ProductVO;

@Controller
public class OrderController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderDetailService orderDetailService;
	@Autowired
	private ProductService productService;

	// 주문하기 페이지로 이동
	@RequestMapping(value = "/buyProducts.do")
	public String checkoutView(Model model, HttpSession session, HttpServletRequest request) {

		System.out.println("buyProducts.do");

		String userId = (String) session.getAttribute("memberId");

		if (userId == null) { // 로그인 안 돼 있으면 로그인 창으로 이동
			try {
				model.addAttribute("msg", "로그인이 필요합니다.");
				model.addAttribute("location", "login.do");
				
				return "alert.jsp";
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		} else { // 로그인 돼 있으면 주문하기 페이지로 이동
			
			MemberVO mvo = new MemberVO();
			mvo.setUserId((String)session.getAttribute("memberId"));
			
			MemberVO loginMvo = memberService.selectOne(mvo);
			System.out.println("loginMvo: " + loginMvo);
			
			model.addAttribute("memberPhoneNum", loginMvo.getPhoneNum());
			model.addAttribute("memberPostNum", loginMvo.getPostNum());
			model.addAttribute("memberAddress1", loginMvo.getAddress1());
			model.addAttribute("memberAddress2", loginMvo.getAddress2());
			
			ArrayList<ProductVO> cList = (ArrayList) session.getAttribute("cList"); // 장바구니에 담긴 상품들
			
			if (cList.isEmpty()) { // 장바구니가 비었을 때
				try {
					model.addAttribute("msg", "장바구니가 비었습니다.");
					model.addAttribute("location", "main.do");
					
					return "alert.jsp";
				} catch (Exception e) {
					e.printStackTrace();
					return null;
				}
			} else {
				return "checkout.jsp";
			}
		}
	}

	// 주문하기 페이지에서 결제 및 최종 주문 수행
	@RequestMapping(value = "/insertOrder.do")
	public String insertOrder(OrderVO ovo, OrderDetailVO odvo, ProductVO pvo, Model model, HttpSession session,	HttpServletResponse response) {
		System.out.println("insertOrder.do 진입");
		String userId = (String) session.getAttribute("memberId"); // 로그인 무조건 돼 있음
		ovo.setUserId(userId);
		System.out.println("insert OrderVO: " + ovo);
		
		// Order insert
		if (!orderService.insert(ovo)) { // insert 에서 실패했다면
			try {
				model.addAttribute("msg", "주문내역 생성 실패...관리자에게 문의하세요.");
				model.addAttribute("location", "checkout.jsp");
				
				return "alert.jsp";
			} catch (Exception e) {
				return null;
			}
		}
		System.out.println("오더 인서트 성공");
		// ovo insert 성공
		// → odvo insert!
		ovo.setoSearchCondition("lastOrder");
		System.out.println("ovo.userId: " + ovo.getUserId());
		OrderVO thisOvo = orderService.selectOne(ovo); // 방금 추가한 ovo
		// SELECT O_NO FROM ORDER_INFO WHERE USER_ID = ? ORDER BY O_NO DESC;
		System.out.println("thisOvo: " + thisOvo);
		ArrayList<ProductVO> cList = (ArrayList) session.getAttribute("cList"); // 장바구니에 담긴 상품들
		
		if (cList == null) {
			cList = new ArrayList<ProductVO>();
		}
		
		for (int i = 0; i < cList.size(); i++) {
			odvo.setoNum(thisOvo.getoNum()); // oNum 세팅
			odvo.setpNum(cList.get(i).getpNum()); // pNum 세팅
			odvo.setOdCnt(cList.get(i).getpCnt()); // pCnt 세팅
			odvo.setOdPrice(cList.get(i).getDc_price() * cList.get(i).getpCnt()); // 실제 결제 금액으로 odPrice 세팅
			System.out.println("insert OrderDetailVO: " + odvo);
			orderDetailService.insert(odvo); // 주문 상세 내역 DB에 저장
			// 장바구니에 있는 상품들의 pNum과 pCnt(개수)를 받아서
			// DB 에 업데이트
			pvo.setpNum(cList.get(i).getpNum());
			pvo.setpCnt(cList.get(i).getpCnt());
			pvo.setpSearchCondition("buy");
			if (!productService.update(pvo)) {
				try {
					model.addAttribute("msg", "ERROR : UPDATE 실패");
					model.addAttribute("location", "checkout.jsp");
					
					return "alert.jsp";
				} catch (Exception e) {
					return null;
				}
			}
		}

		session.removeAttribute("cList"); // 장바구니 비우기
		return "orderList.do";

	}

	// 주문 내역 페이지로 이동
	@RequestMapping(value = "/orderList.do")
	public String selectAllOrderList(OrderVO vo, Model model, HttpSession session) {
		System.out.println("orderList.do 진입");
		// 현재 로그인한 회원의 주문내역을 가져와야 함
		String userId = (String) session.getAttribute("memberId");
		vo.setUserId(userId);
		List<OrderVO> oList;
		oList = orderService.selectAll(vo); // 현재 로그인한 회원의 주문 내역 리스트
		model.addAttribute("oList", oList);

		return "order_list.jsp";
	}

	// 주문 상세 내역 페이지로 이동
	@RequestMapping(value = "/orderDetailList.do")
	public String selectAllOrderDetailList(OrderVO ovo, OrderDetailVO odvo, Model model) {
		System.out.println("orderDetailList.do 진입");
		System.out.println("oNum: " + ovo.getoNum());
		odvo.setOdNum(ovo.getoNum());
		List<OrderDetailVO> odList = orderDetailService.selectAll(odvo); // 주문 번호가 oNum인 주문 상세 내역들
		model.addAttribute("odList", odList); // 주문 상세 보내주기
		
		return "order_detail.jsp";
	}
	
}
