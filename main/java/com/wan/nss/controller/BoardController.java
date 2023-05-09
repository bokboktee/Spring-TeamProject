package com.wan.nss.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wan.nss.biz.blike.BlikeService;
import com.wan.nss.biz.blike.BlikeVO;
import com.wan.nss.biz.board.BoardService;
import com.wan.nss.biz.board.BoardVO;
import com.wan.nss.biz.image.ImageService;
import com.wan.nss.biz.image.ImageVO;
import com.wan.nss.biz.member.MemberService;
import com.wan.nss.biz.member.MemberVO;
import com.wan.nss.biz.reply.ReplyService;
import com.wan.nss.biz.reply.ReplyVO;

@Controller
public class BoardController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private BoardService boardService;
	@Autowired
	private BlikeService blikeService;
	@Autowired
	private ImageService imageService;
	@Autowired
	private ReplyService replyService;

	// 고양이 자랑 게시판 페이지 진입
	@RequestMapping(value = "/boardView.do")
	public String boardView(BoardVO bvo, Model model, HttpSession session) {

		System.out.println("boardView.do 진입");
		bvo.setUserId((String) session.getAttribute("memberId"));

		// 전체 자랑글 목록 : bList
		model.addAttribute("bList", boardService.selectAll(bvo));

		// TOP3 자랑글 목록 : top3List
		bvo.setSearchCondition("top3");
		model.addAttribute("top3List", boardService.selectAll(bvo));

		System.out.println();

		return "board.jsp";
	}

	// 고양이 자랑 게시판 게시글 상세보기 페이지 진입
	@RequestMapping(value = "/boardPostView.do")
	public String boardPostView(MemberVO mvo, BoardVO bvo, Model model, HttpServletRequest request,
			HttpSession session) {

//		System.out.println("boardPostView.do 진입");
//		System.out.println("bvo.boardNum: " + bvo.getBoardNum());
//		System.out.println("status: " + boardService.selectOne(bvo).getBoardStatus());
		
		if(boardService.selectOne(bvo)==null) {
			model.addAttribute("msg", "없는 게시글입니다.");
			model.addAttribute("location", "boardView.do");
			
			return "alert.jsp";
		}
		if(boardService.selectOne(bvo).getBoardStatus()==3) {
			model.addAttribute("msg", "삭제된 게시글입니다.");
			model.addAttribute("location", "boardView.do");
			
			return "alert.jsp";
		}
		
		if(boardService.selectOne(bvo).getSearchCondition()!=null) { // 신고, 게시글 관리에서 개별 상세 보기 들어올 때가 아닐 때
			if(!boardService.selectOne(bvo).getSearchCondition().equals("admin")) { // 신고, 게시글 관리에서 개별 상세 보기 들어올 때가 아닐 때
				if (boardService.selectOne(bvo).getBoardStatus() == 3) { // 직접 주소쳐서 들어오는것 방지
					model.addAttribute("msg", "삭제된 게시글입니다.");
					model.addAttribute("location", "boardView.do");
					
					return "alert.jsp";
				}
			}
		}

		ReplyVO rvo = new ReplyVO();
		rvo.setBoardNum(bvo.getBoardNum());

		// 조회수 증가 로직
		System.out.println("updateViewCnt: " + request.getParameter("updateViewCnt"));
		if (request.getParameter("updateViewCnt") == null) { // updateViewCnt 가 비어있으면(조회수 증가)
			if(session.getAttribute("memberRole") != null) { // 로그인한 상태면
				if (!session.getAttribute("memberRole").equals("ADMIN")) { // 로그인한 사람의 역할이 관리자가 아니면
					bvo.setSearchCondition("viewCnt");
					boardService.update(bvo); // 조회수 증가
				}
			}
		}

		// 게시글 상세페이지에서 수정 버튼 활성화를 위한 memberId
		mvo.setUserId((String) session.getAttribute("memberId"));
		bvo.setUserId((String) session.getAttribute("memberId"));
		MemberVO loginMvo = memberService.selectOne(mvo);

		System.out.println("replyset 길이 :" + replyService.selectAll(rvo).size());
		// 게시글 상세 데이터
		model.addAttribute("replyset", replyService.selectAll(rvo));
		model.addAttribute("board", boardService.selectOne(bvo));
		model.addAttribute("member", loginMvo);

		return "board_detail.jsp";

	}

	// 고양이 자랑 게시판 검색 수행 및 검색결과 페이지 진입
	@RequestMapping(value = "/selectAllSearchBoard.do")
	public String selectAllSearchBoard(BoardVO bvo, Model model) {

		System.out.println("selectAllSearchBoard.do 진입");

		model.addAttribute("bList", boardService.selectAll(bvo));

		return "board_result.jsp";

	}

	// 고양이 자랑 게시판 새 게시글 작성하기 페이지 진입
	@RequestMapping(value = "/insertBoardView.do")
	public String insertBoardView(MemberVO mvo, HttpSession session, HttpServletResponse response) {
		// TODO
		// 세션 아이디 가져와서
		mvo.setUserId((String) session.getAttribute("memberId"));
		// 역할 가져와서
		MemberVO loginMvo = memberService.selectOne(mvo);

		// 차단된 회원은 보드홈으로 이동(얼럿 띄우기 : 글쓰기 기능이 차단된 회원입니다. 관리자에게 문의하세요.)
		if (loginMvo.getRole().equals("BLOCKED")) {
			try {
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('글쓰기 기능이 차단된 회원입니다. 관리자에게 문의하세요');</script>");
				out.flush();
				return "boardView.do";
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		} else {
			System.out.println("insertBoardView.do 진입");

			return "insert_board.jsp";
		}

	}

	// 고양이 자랑 게시판 새 게시글 작성하기 페이지에서
	// 게시글 작성(insert) 수행 및 해당 글 상세 보기(작성 결과 보기) 페이지로 이동
	@RequestMapping(value = "/insertBoard.do")
	public String insertBoard(BoardVO bvo, Model model) {
		System.out.println("insertBoard.do 진입");
		// 이미지 객체 생성
		ImageVO ivo = new ImageVO();
		System.out.println("bvo: " + bvo);
		// 게시글 추가
		boardService.insert(bvo);
		// 가장 최근 게시글 찾아내서 B_NO 가져오기 -> targetNum으로 저장
		bvo.setSearchCondition("newest");
		BoardVO preBvo = boardService.selectOne(bvo);
		System.out.println("preBvo: " + preBvo);
		int targetNum = preBvo.getBoardNum();
		// "img/" 문자열이 있는 동안 반복해서 ivo 저장하기
		String tag = bvo.getBoardContent();
		int typeNum = 201;
		while (true) {
			System.out.println("tag: " + tag);
			
			// "img/" 문자열이 있는 동안 반복해서 ivo 저장하기
			if (tag.indexOf("img/") >= 0) {
				// 이미지 번호 세팅
				ivo.setTargetNum(targetNum);
				// 이미지 구분 번호 세팅
				ivo.setTypeNum(typeNum);
				// 이미지 이름 세팅
				// 이미지 태그 값 잘라내기
				String imageUrl = (String) tag.subSequence(tag.indexOf("img/"), tag.indexOf("\" style="));
				System.out.println(imageUrl);
				ivo.setImageName(imageUrl);
				// 이미지 추가
				imageService.insert(ivo);
				// 찾은 부분까지 잘라내고 다시 찾기위해 저장
				tag = tag.substring(tag.indexOf("\" style=") + 9);
				// typeNum ++
				typeNum++;
				// "img/" 문자열이 없으면 종료
			} else { //
				break;
			}
		}
		System.out.println("targetNum: " + targetNum);
		model.addAttribute("boardNum", targetNum);
		
		return "result_insert_board.jsp";
	}
	
	@RequestMapping(value = "/insertBoardResult.do") // 게시글 입력, 수정 후 거치는 페이지(새로고침으로 중복 insert, update 방지)
	public String insertBoardResult(HttpServletRequest request) {
		System.out.println("insertBoardResult.do 진입");
		System.out.println("boardNum: " + request.getParameter("boardNum"));
		return "boardPostView.do?boardNum=" + request.getParameter("boardNum") + "&updateViewCnt=false";
	}

	// 고양이 자랑 게시판 게시글 수정하기 페이지 진입
	@RequestMapping(value = "/updateBoardView.do")
	public String updateBoardView(BoardVO bvo, Model model) {
		System.out.println("updateBoardView.do 진입");
		System.out.println("bvo: " + bvo);
		model.addAttribute("board", boardService.selectOne(bvo));
		
		// 몇번 글 수정인지 설정하여 보내기
		return "update_board.jsp";
	}

	// 고양이 자랑 게시판 게시글 수정하기 페이지에서
	// 게시글 수정(update) 및 해당 글 상세 보기(수정 결과 보기) 페이지로 이동
	@RequestMapping(value = "/updateBoard.do")
	public String updateBoard(BoardVO bvo, Model model) {
		System.out.println("updateBoard.do 진입");
		ImageVO ivo = new ImageVO();
		// 게시글 번호 설정
		int targetNum = bvo.getBoardNum();
		// 게시글 수정
		boardService.update(bvo);
		// IMAGE 테이블에서 기존 이미지 행 삭제
		ivo.setTargetNum(targetNum); // 게시글 번호
		ivo.setTypeNum(200); // 200: 게시글
		imageService.delete(ivo);
		// "img/" 문자열이 있는 동안 반복해서 ivo 저장하기
		String tag = bvo.getBoardContent();
		int typeNum = 201;
		
		while (true) {
			System.out.println("tag: " + tag);

			// "img/" 문자열이 있는 동안 반복해서 ivo 저장하기
			if (tag.indexOf("img/") >= 0) {
//				// 이미지 번호 세팅
//				ivo.setTargetNum(bvo.getBoardNum());
				// 이미지 구분 번호 세팅
				ivo.setTypeNum(typeNum);
				// 이미지 이름 세팅
				// 이미지 태그 값 잘라내기
				String imageUrl = (String) tag.subSequence(tag.indexOf("img/"), tag.indexOf("\" style="));
				System.out.println(imageUrl);
				ivo.setImageName(imageUrl);
				// 이미지 추가
				imageService.insert(ivo);
				// 찾은 부분까지 잘라내고 다시 찾기위해 저장
				tag = tag.substring(tag.indexOf("\" style=") + 9);
				// typeNum ++
				typeNum++;
				// "img/" 문자열이 없으면 종료
			} else { //
				break;
			}
		}
		System.out.println("targetNum: " + targetNum);
		model.addAttribute("boardNum", targetNum);
		
		return "result_insert_board.jsp";
	}

	// 고양이 자랑 게시판 게시글 삭제 수행 및 전체 목록으로 이동
	@RequestMapping(value = "/deleteBoard.do")
	public String deleteBoard(BoardVO bvo, Model model) {
		System.out.println("deleteBoard.do 진입");
//		// IMAGE 테이블에서 게시글 이미지 행 삭제(자료 보존을 위해 주석 처리)
//		ImageVO ivo = new ImageVO();
//		ivo.setTargetNum(bvo.getBoardNum()); // 게시글 번호
//		ivo.setTypeNum(200); // 200: 게시글
//		imageService.delete(ivo);
		boardService.delete(bvo); // 게시글 상태를 3: 삭제로 변경
		if(bvo.getSearchCondition() != null) {
			if (bvo.getSearchCondition().equals("admin")) { // 게시글 관리에서 삭제로 변경할 때
				return "boardManageView.do";
			}
			else { // 자기 게시글 삭제할 때
				return "boardView.do";
			}
		}
		return "boardView.do";
	}

	// 고양이 자랑 게시글 공유하기
	@RequestMapping(value = "/shareBoard.do")
	public String shareBoard(BoardVO bvo, Model model) {
		System.out.println("shareBoard.do 진입");
		
		return "board_detail.jsp";
	}

	// 고양이 자랑 게시글 좋아요/취소 수행
	@ResponseBody
	@RequestMapping(value = "/updateBlike.do", method = RequestMethod.POST)
	public void updateLike(BlikeVO blvo, BoardVO bvo, Model model, HttpSession session) {
		blvo.setUserId((String) session.getAttribute("memberId"));
		bvo.setUserId((String) session.getAttribute("memberId"));
		System.out.println("updateBlike.do 진입");
		System.out.println(blvo);

		if (blvo.getUpOrDown().equals("up")) {
			System.out.println("좋아요 업");
			blikeService.insert(blvo);
		} else {
			System.out.println("좋아요 다운");
			blikeService.delete(blvo);
		}
	}

	// 내가 좋아요 한 글 모아보기
	@RequestMapping(value = "/selectAllMyLike.do")
	public String selectAllMyLike(BoardVO bvo, Model model, HttpSession session) {
		System.out.println("selectAllMyLike.do 진입");
		System.out.println("bvo: " + bvo);
		bvo.setUserId((String) session.getAttribute("memberId"));
		bvo.setSearchCondition("myLike");
		model.addAttribute("board", boardService.selectAll(bvo));
		
		return "myfavboard.jsp";
	}

	// 내가 쓴 글 모아보기
	@RequestMapping(value = "/selectAllMyBoard.do")
	public String selectAllMyBoardLike(BoardVO bvo, Model model) {
		System.out.println("selectAllMyBoardLike 진입");
		System.out.println("bvo: " + bvo);
		bvo.setSearchCondition("myLike");
		model.addAttribute("board", boardService.selectAll(bvo));
		
		return "myfavboard.jsp";
	}

}
