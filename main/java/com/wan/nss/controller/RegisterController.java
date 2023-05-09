package com.wan.nss.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wan.nss.biz.member.MemberService;
import com.wan.nss.biz.member.MemberVO;
import com.wan.nss.biz.sms.SmsService;
import com.wan.nss.biz.sms.SmsVO;

@Controller
public class RegisterController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private SmsService smsService;
	
	// 회원가입 페이지로 이동
	@RequestMapping(value = "/register.do")
	public String registerView(Model model, HttpSession session, HttpServletRequest request) {
		System.out.println("register.do 진입");
		model.addAttribute("lang", session.getAttribute("lang"));
		
		return "register.jsp";
	}
	
	// 회원가입 성공시 결과 페이지로 이동
	@RequestMapping(value = "/registerResultView.do")
	public String registerResultView(HttpServletRequest request, HttpSession session) {
		System.out.println("registerResultView.do 진입");
		
		return "result_register.jsp";
	}
	
	// 아이디, 전화번호 중복 확인
	@ResponseBody
	@RequestMapping(value="/checkDuplication.do")
	public String isDuplicated(MemberVO mvo) {
		System.out.println("checkDuplication.do 진입");

		if(memberService.selectOne(mvo) == null) {
			// 중복 없음 !
			// 아이디 만들 수 있음
			System.out.println("중복 없음");
			System.out.println("id = " + mvo.getUserId() + ", phone= " + mvo.getPhoneNum());
			
			return "1";
		} else {
			return "0";
		}
	}
	
	// 회원가입시 문자 인증 번호 발송
	@ResponseBody
	@RequestMapping(value="/sms.do")
	public String sendSms(SmsVO svo) {
		System.out.println("sms.do 진입");
		System.out.println(svo.getPhoneNum()); //사용자 전화번호 가져오기
		int randNum = smsService.sms(svo);  //sns메서드 통해 randNum값 리턴받아옴.
		System.out.println("randNum: " + randNum);

		//받아온 randNum값을 다시 ajax으로 보낸다 ->  success: function(randNum)  
		return Integer.toString(randNum);
	}
	
	// 회원가입시 문자 인증 번호 확인
	@ResponseBody
	@RequestMapping(value="/checkSms.do")
	public String checkSms(SmsVO svo) {
		System.out.println("checkSms.do 진입");
		System.out.println("로그:" + svo.getRandNum());
		System.out.println("로그:" + svo.getCheckNum());

		if (svo.getRandNum().equals(svo.getCheckNum())) { // 인증번호와 사용자입력값 비교
			System.out.println("인증번호 일치함");
			return "1"; // => result == "1" 을 뜻함
		} else {
			System.out.println("인증번호 불일치");
			return "-1"; // => result == "-1" 을 뜻함
		}
	}
	
	// 회원가입 수행
	@RequestMapping(value = "/signUp.do")
	public String insertBoard(MemberVO mvo, Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("signUp.do 진입");
		System.out.println("회원가입하는 회원 정보 ↓");
		System.out.println(mvo);
		String urlBack = request.getParameter("urlBack"); // 페이지 진입 전전 주소
		System.out.println("request.urlBack: " + urlBack);

		if(urlBack == null) {
			session.setAttribute("urlBack", "main.do");
		}
		else {
			if(!urlBack.contains("login") && !urlBack.contains("Login") && !urlBack.contains("findId") && !urlBack.contains("findPw") 
					&& !urlBack.contains("register")
					&& !urlBack.contains("signUp")) { // urlBack에 저장하지 않고 건너뛸 페이지들
				session.setAttribute("urlBack", urlBack); // 세션의 urlBack 갱신
			}
		}
		System.out.println("session.urlBack: " + session.getAttribute("urlBack"));
		
		if (memberService.insert(mvo)) { // 회원가입 성공시
			return "registerResultView.do";
		} else { // 회원가입 실패시
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out;
			try {
				out = response.getWriter();
				model.addAttribute("lang", session.getAttribute("lang"));
				model.addAttribute("msg", "회원가입에 실패하였습니다... nyangsinsa@gmail.com로 문의해주세요.");
				model.addAttribute("location", "register.jsp");
				return "alert.jsp";
			} catch (IOException e) {
				e.printStackTrace();
				return null;
			}
		}

	}
	
}
