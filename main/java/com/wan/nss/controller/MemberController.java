package com.wan.nss.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wan.nss.biz.member.MemberService;
import com.wan.nss.biz.member.MemberVO;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	// 로그인 페이지로 이동
	@RequestMapping(value = "/login.do")
	public String loginView(Model model, HttpSession session, HttpServletRequest request) {
		System.out.println("login.do 진입");
		
		return "login.jsp";
	}
	
	// 아이디 찾기 페이지로 이동
	@RequestMapping(value = "/findIdView.do")
	public String findIdView(HttpServletRequest request, HttpSession session) {
		System.out.println("findIdView.do 진입");
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
		
		return "find_id.jsp";
	}
	
	// 비밀번호 찾기 페이지로 이동
	@RequestMapping(value = "/findPwView.do")
	public String findPwView(HttpServletRequest request, HttpSession session) {
		System.out.println("findPwView.do 진입");
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
		
		return "find_pw.jsp";
	}
	
	// 회원정보변경 클릭시 비밀번호 확인 페이지로 이동
	@RequestMapping(value = "/checkPassword.do", method=RequestMethod.GET)
	public String checkPasswordView() {
		System.out.println("checkPassword.do 진입");
		
		return "check_password.jsp";
	}
	
	// CONTACT 페이지로 이동
	@RequestMapping(value = "/contact.do", method=RequestMethod.GET)
	public String contactView() {
		System.out.println("contact.do 진입");
		
		return "contact.jsp";
	}
	
	// 로그아웃 수행
	@RequestMapping(value = "/logout.do")
	public String logoutView(Model model, HttpServletRequest request, HttpSession session) {
		System.out.println("logout.do 진입");
		model.addAttribute("lang", session.getAttribute("ko"));
		session.invalidate(); // 세션정보비우기
		
		return "index.jsp";
	}

	// 비밀번호 찾기 결과에서 비밀번호 변경하기 수행
	@RequestMapping(value = "/changePw.do")
	public String updateMemberChangePw(MemberVO vo, Model model, HttpSession session, HttpServletRequest request) {
		System.out.println("changePw.do 진입");
		if (!memberService.update(vo)) { // 업데이트 실패 시 알림창
			model.addAttribute("msg", "회원 정보 수정 실패. 잠시 후 다시 시도하세요.");
			model.addAttribute("location", "change_pw.jsp");
			return "alert.jsp";
		}
		else {
			return "login.do";
		}
	}

	// 회원정보변경에서 비밀번호 변경하기 수행
	@RequestMapping(value = "/updatePw.do")
	public String updateMemberPw(MemberVO mvo, HttpServletRequest request, HttpSession session, Model model) {
		System.out.println("updatePw.do 진입");
		mvo.setUserId((String)session.getAttribute("memberId"));

		if (memberService.selectOne(mvo) == null) { // 현재 비밀번호가 일치하지 않으면
			model.addAttribute("msg", "현재 비밀번호를 확인하세요.");
			model.addAttribute("location", "profileView.do");
			
			return "alert.jsp";
		}
		
		String memberPwNew = (String) request.getParameter("memberPwNew"); // 새 비밀번호
		mvo.setUserPw(memberPwNew);
		
		if (!memberService.update(mvo)) { // 업데이트에 실패하면 알림창
			model.addAttribute("msg", "업데이트 실패. 잠시 후 다시 시도해주세요.");
			model.addAttribute("location", "profileView.do");
			
			return "alert.jsp";
		}
		return "profileView.do";
	}

	// 회원 등급 수정 수행
		@RequestMapping(value = "/updateMemberRole.do")
		public String updateMemberRole(MemberVO mvo) {
			System.out.println("멤버 업데이트 입장");
			System.out.println(mvo);
			// mvo : memberNum, role
			memberService.update(mvo);
			
			return "memberManagePage.do";
		}
	
	// 회원정보 수정 수행
	@RequestMapping(value = "/updateMember.do")
	public String updateMemberProfile(MemberVO mvo, Model model, HttpSession session, HttpServletRequest request) {
		System.out.println("updateMember.do 진입");
		mvo.setUserId((String)session.getAttribute("memberId"));
		
		if (!memberService.update(mvo)) {
			model.addAttribute("msg", "회원 정보 수정 실패. 잠시 후 다시 시도하세요.");
			model.addAttribute("location", "profile.jsp");
			
			return "alert.jsp";
		} else {
			return "profileView.do";
		}
	}
	
	// 회원정보 수정 수행 성공시 다시 프로필페이지로 이동
	@RequestMapping(value = "/profileView.do")
	public String profileView(MemberVO searchMvo, MemberVO loginMvo, Model model, HttpSession session) {
		System.out.println("profileView.do 진입");
		System.out.println("memberId: " + session.getAttribute("memberId"));
		searchMvo.setUserId((String)session.getAttribute("memberId"));
		System.out.println("searchMvo.userId: " + searchMvo.getUserId());
		searchMvo.setUserPw(null);
		loginMvo = memberService.selectOne(searchMvo); // 로그인한 회원 VO를 member에 저장
		System.out.println("loginMvo: " + loginMvo);
		model.addAttribute("memberCatName", loginMvo.getCatName());
		model.addAttribute("memberPhoneNum", loginMvo.getPhoneNum());
		model.addAttribute("memberPostNum", loginMvo.getPostNum());
		model.addAttribute("memberAddress1", loginMvo.getAddress1());
		model.addAttribute("memberAddress2", loginMvo.getAddress2());
		
		return "profile.jsp";
	}
	
	
	// 관리자 페이지 - 회원 삭제(강퇴)
	@RequestMapping(value = "/deleteMem.do")
	public String deleteMember(MemberVO vo, HttpSession session, HttpServletRequest request, Model model) {
		System.out.println("deleteMem.do 진입");
		String id = (String)session.getAttribute("memberId"); // 세션의 멤버 Id 를 가져오기

		if (id == null || !(id.equals("admin"))) { // 로그인을 안 하거나 admin이 아니면 접근 권한 없음.
			model.addAttribute("msg", "접근 권한이 없습니다.");
			model.addAttribute("location", "memberManagePage.do");
			
			return "alert.jsp";
		}
		if (!memberService.delete(vo)) {
			model.addAttribute("msg", "Delete 실패. 잠시 후 다시 시도하세요.");
			model.addAttribute("location", "memberManagePage.do");
			
			return "alert.jsp";
		}
		else {
			return "memberManagePage.do";
		}
	}

	// 로그인 수행
	@RequestMapping(value = "/selectOneMemberLogin.do")
	public String selectOneMemberLogin(MemberVO vo, Model model, HttpServletRequest request, HttpSession session) {
		System.out.println("selectOneMemberLogin.do 진입");
		System.out.println("로그인하려는 회원 정보 ↓");
		System.out.println(vo);
		System.out.println();
		MemberVO loginMvo = memberService.selectOne(vo);
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
		
		if (loginMvo == null) { // 로그인 실패시
			System.out.println("로그: 로그인 실패!");
			model.addAttribute("msg", "아이디/비밀번호를 확인해주세요.");
			model.addAttribute("location", "login.do"); // 세션에 저장된 urlBack을 이동할 페이지로 세팅
			
			return "alert.jsp";
		} else { // 로그인 성공시
			System.out.println("로그: 로그인 성공!");
			session.setAttribute("memberNum", loginMvo.getUserNum()); // 세션에 로그인한 회원의 번호, 아이디, 이름, 등급 저장
			session.setAttribute("memberId", loginMvo.getUserId());
			session.setAttribute("memberName", loginMvo.getUserName());
			session.setAttribute("memberRole", loginMvo.getRole());
			System.out.println("login_bridge.jsp로 이동");
			model.addAttribute("location", session.getAttribute("urlBack"));
			return "login_bridge.jsp"; // 로그인 브릿지로 이동
		}
	}

	// 카카오톡으로 로그인시 회원가입되어있는지 체크
	@RequestMapping(value = "/loginCheck.do")
	public String selectOneMemberKakaoLogin(MemberVO vo, HttpSession session, Model model, HttpServletRequest request) {
		System.out.println("loginCheck.do 진입");
		MemberVO loginMvo = memberService.selectOne(vo);

		if (loginMvo != null) { // 가입정보가 있으면 메인으로
			// 이름, 아이디, 패스워드 (id, pw는 고유 번호)
			// 받아서 회원 정보가 있으면 로그인
			session.setAttribute("memberId", loginMvo.getUserId()); // 세션에 로그인한 회원의 아이디, 이름 저장
			session.setAttribute("memberName", loginMvo.getUserName());
			session.setAttribute("memberRole", loginMvo.getRole());
			
			return "main.do";
		} else { // 가입정보가 없으면 카카오 회원가입
			model.addAttribute("data", vo); // 카카오에서 제공한 아이디와 이름이 저장된 MemberVO를 Set
			
			return "kakao_register.jsp";
		}
	}

	// 아이디 찾기 수행
	@RequestMapping(value = "/findId.do")
	public String selectOneMemberId(MemberVO mvo, Model model, HttpServletRequest request, HttpSession session) {
		System.out.println("findId.do 진입");
		MemberVO loginMvo = memberService.selectOne(mvo); // id, 이름이 담긴 멤버
		System.out.println("loginMvo: " + loginMvo);
		
		if (loginMvo == null) { // 가입정보가 없는 경우
			model.addAttribute("msg", "회원정보가 존재하지 않습니다. Please check your information.");
			model.addAttribute("location", "findIdView.do");
			
			return "alert.jsp";
		} else { // 가입정보가 있는 경우
			model.addAttribute("findId", loginMvo.getUserId());
			model.addAttribute("findName", loginMvo.getUserName());
			
			return "result_find_id.jsp";
		}
	}

	// 비밀번호 찾기 수행
	@RequestMapping(value = "/findPw.do")
	public String selectOneMemberPw(MemberVO vo, Model model, HttpServletRequest request, HttpSession session) {
		System.out.println("findPw.do 진입");
		// 인증번호로 폰 본인 건지 확인 후,
		// 폰 번호로 비밀번호 찾기 버튼 누르면 :
		// mdao에서 해당하는 멤버 가져오고, 아이디만 전달
		MemberVO loginMvo = memberService.selectOne(vo);
		
		if (loginMvo == null) { // 없는 회원인 경우\
			model.addAttribute("msg", "존재하지 않는 회원입니다. Please check your information.");
			model.addAttribute("location", "findPwView.do");
			
			return "alert.jsp";
		} else {
			model.addAttribute("changeId", loginMvo.getUserId());
			
			return "change_pw.jsp";
		}
	}

	// 회원정보변경 클릭시 비밀번호 확인 페이지에서 비밀번호 확인 수행
	@RequestMapping(value = "/checkPw.do") // 
	public String selectOneMemberCheckPw(MemberVO vo, Model model, HttpServletRequest request) {
		System.out.println("checkPw.do 진입");
		MemberVO loginMvo = memberService.selectOne(vo); // id, pw가 일치하는 회원이 있는경우만 not null

		if (loginMvo == null) { // 비밀번호가 일치하지 않으면, 알림창 뜨고 뒤로 돌아가야 함
			model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
			model.addAttribute("location", "checkPassword.do");
			
			return "alert.jsp";
		} else {
			System.out.println("loginMvo: " + loginMvo);

			return "profileView.do"; // 회원정보변경 페이지로 진행
		}
	}

	// 마이페이지로 이동
	@RequestMapping(value = "/mypage.do")
	public String selectOneMemberMyPage(MemberVO vo, Model model, HttpSession session, HttpServletRequest request) {
		System.out.println("mypage.do 진입");
		String id = (String) session.getAttribute("memberId"); // 세션에 저장된 '로그인한 회원의 아이디'
		if (id == null) { // 로그인한 회원이 없다면 로그인 페이지로 이동
			model.addAttribute("msg", "로그인을 해주세요.");
			model.addAttribute("location", "login.do");
			
			return "alert.jsp";
		} else {
			vo.setUserId(id);
			System.out.println("memberId: " + vo.getUserId());
			MemberVO loginMvo = memberService.selectOne(vo); // 로그인한 회원 VO를 member에 저장
			System.out.println("loginMvo: " + loginMvo);
			model.addAttribute("memberCatName", loginMvo.getCatName());
			model.addAttribute("memberPhoneNum", loginMvo.getPhoneNum());
			model.addAttribute("memberPostNum", loginMvo.getPostNum());
			model.addAttribute("memberAddress1", loginMvo.getAddress1());
			model.addAttribute("memberAddress2", loginMvo.getAddress2());

			return "mypage.jsp";
		}

	}

}
