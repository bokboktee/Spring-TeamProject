package com.wan.nss.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wan.nss.biz.board.BoardService;
import com.wan.nss.biz.board.BoardVO;
import com.wan.nss.biz.member.MemberService;
import com.wan.nss.biz.member.MemberVO;
import com.wan.nss.biz.reply.ReplyService;
import com.wan.nss.biz.reply.ReplyVO;
import com.wan.nss.biz.report.ReportService;
import com.wan.nss.biz.report.ReportVO;

@Controller
public class ReportController {

	@Autowired
	private ReportService reportService;
	@Autowired
	private BoardService boardService;
	@Autowired
	private ReplyService replyService;
	@Autowired
	private MemberService memberService;

	// 신고하기
	@RequestMapping(value = "/insertReport.do")
	public String insertReport(ReportVO rpvo) {
		System.out.println("insertReport.do 진입");
		// targetNum, reportStep, userID, reportContent
		// 폼 안에서 체크된(활성화 된) 값만 오므로 처리하면 됨

		// setting된 input 확인
		System.out.println("targetNum: " + rpvo.getTargetNum()); // 신고하는 글번호 또는 댓글번호
		System.out.println("reportStep: " + rpvo.getReportStep());
		System.out.println("userId: " + rpvo.getUserId());
		System.out.println("reporterId: " + rpvo.getReporterId());
		System.out.println("reportContent: " + rpvo.getReportContent());
		
		int boardNum = 0;
		if(rpvo.getReportStep() == 1) { // 신고 : 게시글일 경우
			// 게시글 상태 변경
			BoardVO bvo = new BoardVO();
			bvo.setBoardNum(rpvo.getTargetNum()); // 게시글 번호
			bvo.setSearchCondition("changeStatus"); // update 종류 : 상태변경
			bvo.setBoardStatus(2); // 2: 신고
			boardService.update(bvo); // 게시글 상태 변경
			boardNum = bvo.getBoardNum(); // 이동할 글 번호
		}
		else if(rpvo.getReportStep() == 2 || rpvo.getReportStep() == 3) { // 신고 : 댓글, 대댓글일 경우
			// 댓글 상태 변경
			ReplyVO rvo = new ReplyVO();
			rvo.setReplyNum(rpvo.getTargetNum()); // 댓글, 대댓글 번호
			rvo.setReplyStatus(2); // 2: 신고
			replyService.update(rvo); // 댓글 상태 변경
			
			// 댓글이 달린 게시글 번호 가져오기
			boardNum = replyService.selectOne(rvo).getBoardNum(); // 이동할 글 번호
		}
		reportService.insert(rpvo);

		return "redirect:boardPostView.do?boardNum=" + boardNum + "&updateViewCnt=false";
	}

	// (관리자) Report 게시글 신고 처리
	@RequestMapping(value = "/updateReport.do")
	public String updateReport(ReportVO rpvo, MemberVO mvo) {
		System.out.println("updateReport.do 진입");
		// 넘겨받는 것
		// : targetNum, reportNum, userId(vo), reporterId(vo), reportStep, proStatus
		// warnCnt+1
		
		BoardVO bvo=new BoardVO();
		ReplyVO rvo=new ReplyVO();
		
  //status
  if (rpvo.getProcStatus().equals("cancel")) {
  // 신고 취소, 신고한 사람에게 경고 +1, 신고 글상태로 변경	
	 }
  else if (rpvo.getProcStatus().equals("ok")) {
 // 신고 처리, 신고당한 사람에게 경고 +1
			
		}
		
		//step	
		if(rpvo.getReportStep()==1) { //글인 경우
				bvo.setBoardNum(rpvo.getTargetNum());
				bvo.setSearchCondition("changeStatus");
				boardService.update(bvo);
		}
		else if (rpvo.getReportStep() == 2 || rpvo.getReportStep() == 3) { // 댓글일 경우
				rvo.setReplyNum(rpvo.getTargetNum());
				replyService.update(rvo);
		}			

		// 신고 완료
		
		rpvo.setReportStat(2);
		reportService.update(rpvo);
		return "report_manage.jsp";
	}

}
