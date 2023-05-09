
/*
 * Board : 고양이 자랑 게시판
 */

-- C : Board 게시글 작성
INSERT INTO BOARD (M_NO, B_TITLE, B_CONTENT)
VALUES((SELECT M_NO FROM MEMBER WHERE M_ID ='hong'), 'this is title', 'this is content');

SELECT M_NO FROM MEMBER WHERE M_ID ='hong';

-- R : 고양이 게시판 - 전체 게시글 가져오기 
SELECT * FROM BOARD ORDER BY B_DATE DESC;

-- R : 아이디 'kang'이 좋아요 누른 게시글 및 전체 게시글 가져오기
-- SELECT * FROM BOARD b LEFT JOIN BLIKE bl ON b.B_NO = bl.B_NO WHERE M_NO = ? ORDER BY b.B_NO DESC;
SELECT * FROM BLIKE bl WHERE B_NO = 5 AND M_NO = (SELECT M_NO FROM MEMBER WHERE M_ID = 'kang');

SELECT M_NO FROM MEMBER WHERE M_ID = 'kang';

-- R : Board 글 상세보기
SELECT * FROM BOARD WHERE B_NO = ?;

-- R : Board 검색
SELECT * FROM BOARD WHERE B_TITLE LIKE CONCAT('%', ? ,'%') ORDER BY B_NO DESC;
SELECT * FROM BOARD WHERE B_CONTENT LIKE CONCAT('%', ? ,'%') ORDER BY B_NO DESC;

-- R :     !!!!!! 회원 아이디로 글 검색
SELECT * FROM BOARD b, (
	SELECT M_NO FROM MEMBER WHERE M_ID LIKE CONCAT('%', ?, '%')
) t WHERE b.M_NO = t.M_NO
ORDER BY B_NO DESC;

-- U : Board 게시글 수정 (회원)
UPDATE BOARD SET B_TITLE = ?, B_CONTENT = ?, B_DATE = CURTIME() WHERE B_NO = ?;

-- U : Board 게시글 상태 변경 (관리자)
UPDATE BOARD SET STATUS = ? WHERE B_NO = ?;


-- D : Board 게시글 삭제 처리
UPDATE BOARD SET STATUS = 2 WHERE B_NO = ?;


/*
 *  BLIKE (좋아요)
 */
-- C : Board 게시글 좋아요
INSERT INTO BLIKE (B_NO, M_NO) VALUES (?, ?);

-- D : 


/*
 *  REPLY (댓글/대댓글)
 */

-- C : 댓글, 대댓글 작성
-- 댓글의 경우 PARENT_NO = null, RE_STEP = 1
-- 대댓의 경우 RE_STEP = 2
INSERT INTO REPLY (B_NO, M_NO, PARENT_ NO, RE_CONTENT, RE_STEP)
VALUES (?, ?, ?, ?, ?);

-- R : 해당 글의 댓글들 가져오기
-- 삭제된 댓글의 경우 *** 해당 댓글은 삭제된 댓글입니다. ***
SELECT 
	RE_NO, B_NO, M_NO, PARENT_NO, RE_DATE, 
	CASE
		WHEN STATUS = 1
		THEN '*** 관리자가 검토중인 댓글입니다. ***'
		WHEN STATUS = 2
		THEN '*** 해당 댓글은 삭제된 댓글입니다. ***'
		ELSE RE_CONTENT
	END AS RE_CONTENT
	, RE_STEP
FROM REPLY WHERE B_NO = ?; 

-- U : 댓글/대댓글 상태 수정 (관리자)
UPDATE REPLY SET STATUS = 0 WHERE RE_NO = ?;

-- D : 댓글, 대댓글 삭제
UPDATE REPLY SET STATUS = 2 WHERE RE_NO = ?;

/*
 *  REPORT(신고)
 */

-- C : 게시글, 댓글/대댓글 신고
-- TARGET_NO 에는 게시글 PK 혹은 댓글 PK가 들어가야 함
-- RP_STEP = 0(글), 1(댓글), 2(대댓글)
INSERT INTO REPORT (TARGET_NO, RP_STEP, M_NO, RP_CONTENT)
VALUES (?, ?, ?, ?);

-- R : Report 게시글 전체 보기 (삭제된 신고글 제외)
SELECT * FROM REPORT WHERE STATUS != 2 ORDER BY RP_NO DESC;

-- R : Report 게시글 상세보기
SELECT * FROM REPORT WHERE RP_NO = ?;

-- U : Report 게시글 신고 취소(정상) 
UPDATE REPORT SET STATUS = 0 WHERE RP_NO = ?;

-- D : Report 게시글 삭제 처리
UPDATE REPORT SET STATUS = 2 WHERE RP_NO = ?;

