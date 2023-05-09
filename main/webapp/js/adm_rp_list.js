//전역변수
let dataPerPage=5; // 한 페이지에 나타낼 글 수
let pageCount=5; // 페이징에 나타낼 페이지 수
let currentPage=1; // 현재 표시중인 페이지
let first=1; // 페이징 첫 페이지
let last; // 페이징 마지막 페이지
let totalData; // 총 데이터 수
let dataList; // 표시하려하는 데이터 리스트
let totalPage; //총 페이지 수 결정
let selectPage; // 보고싶은 페이지(실제로 사용자가 보고 싶은 페이지)
let part; // 목록 요청 매개변수(카테고리)
let values; // 매개변수로 사용할 임시 객체 
let encodedValues; // values를 json 타입으로 인코딩
let url;
let step;

function list(selectPage,step) { // step : 글인지 댓글인지 대댓글인지 비교함
	pageCount=5;
	console.log(totalPage);
	// 페이징 시작번호와 끝번호 세팅하기
	last=first+pageCount-1;
	if(selectPage < first) { // 보고싶은 페이지가 현재 페이징 첫 페이지보다 작을 때(즉, ◀ 버튼을 눌렀을 때)
		first-=pageCount; // 페이징 번호를 앞으로
		last-=pageCount;
	}
	else if(last < selectPage){
		first+=pageCount; // 페이징 번호를 뒤로
		last+=pageCount;
	}


	console.log("dmddmd")
	console.log("selectPage: "+selectPage);
	console.log("step "+step)


	$.ajax({ // ajax로 데이터 가져오기
		type: 'POST',
		url: 'getAdminList.do',
		data: {part:step
			   
		}, // category, sort 담아서 ListController Servlet에 걸리게!
		
		dataType: 'json',
		traditional: 'true',
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success: function(data) {

			// 기본 세팅
			dataList=data;
			totalData = dataList.length;
			selectPage=selectPage; // 보고싶은 페이지(실제로 사용자가 보고 싶은 페이지) : 사실은 전역변수일 필요가 없으나 가독성 때문에...
			totalPage = Math.ceil(totalData / dataPerPage); //총 페이지 수 결정

			// 글 목록 표시 호출 (테이블 생성)
			console.log(dataList,step);
			displayData(selectPage,step); // 현재페이지인데 바뀌어서 나옴
			console.log('성공?');
			// 페이징 표시 호출
			paging(selectPage,step); // 그래서 저장해논 값을 넣어줌

		}
	});
};


//데이터 출력 부분: 현재 페이지(currentPage)와 페이지당 글 개수(dataPerPage) 반영
function displayData(selectPage,step) {
	console.log('스텝   '+step);
	let listhtml = "";
	let chartHtml = "";
	let proc = "";
//	Number로 변환하지 않으면 아래에서 +를 할 경우 스트링 결합이 되어버림.. 
//	currentPage = Number(currentPage);
//	dataPerPage = Number(dataPerPage);

	console.log(dataList);
	console.log('하이');
	if(totalData!=0){
		for (var i = (selectPage - 1) * dataPerPage ; i < (totalData < (selectPage * dataPerPage) ? totalData : (selectPage * dataPerPage)) ; i++) {
			
			
	values = { targetNum: dataList[i].targetNum ,
		reportNum: dataList[i].reportNum ,
		userId : dataList[i].userId ,
		reporterId: dataList[i].reporterId ,
		reportStep: dataList[i].reportStep };
	encodedValues = encodeURIComponent(JSON.stringify(values));



			console.log(dataList[i]);
			
			if(dataList[i].reportStat==1){
				chartHtml+=
					"<tr><td><i class='fab fa-angular fa-lg text-danger me-3'></i> <strong>처리 전</strong></td>";
				proc = "<a class='dropdown-item ' href='javascript:proc("+encodedValues+");'  ><i class='bx bx-edit-alt me-1'></i>신고 처리</a>";
			}else if(dataList[i].reportStat==2){
				chartHtml+=
					"<tr ><td><i class='fab fa-angular fa-lg text-danger me-3'></i> <strong style='color: #F82C2C;'>처리 완료</strong></td>";
				proc = "<a class='dropdown-item '  >완료된 처리입니다.</a>";
			}
			
			if(step==1){
				//
				// 신고된 글 

				
				
				chartHtml+=
				
				"<td>"+dataList[i].userId+"</td>"
				+"<td><a class='detail-view' href='javascript:newOpen("+encodedValues+");'>글 상세보기</a></td>"
				+"<td>"+dataList[i].reporterId+"</td>"
				+"<td>"+dataList[i].reportContent+"</td>"

				+"<td>"
				+"<div class='dropdown'>"
				+"<button type='button' class='btn p-0 dropdown-toggle hide-arrow' data-bs-toggle='dropdown'>"
				+"<i class='bx bx-dots-vertical-rounded'></i>"
				+"</button>"
				+"<div class='dropdown-menu'>"
				+proc
				+"</div>"
				+"</div>"
				+"</td>"
				+"</tr>";

				listhtml="	<tr> 	<th>처리 상태</th> 	<th>글 작성자</th> 	<th>게시글 내용</th> 	<th>신고자</th> 	<th>신고 내용</th> </tr>";
			}
			if(step==2 && (dataList[i].reportStep== 2 || 3) ){
				

				// 신고된 댓글 
				chartHtml+=
				 "<td>"+dataList[i].userId+"</td>"
				+"<td><a class='detail-view' href='javascript:replycontent("+encodedValues+");'>내용 보기 </a></td>"
				+"<td>"+dataList[i].reporterId+"</td>"
				+"<td>"+dataList[i].reportContent+"</td>"

				+"<td>"
				+"<div class='dropdown'>"
				+"<button type='button' class='btn p-0 dropdown-toggle hide-arrow' data-bs-toggle='dropdown'>"
				+"<i class='bx bx-dots-vertical-rounded'></i>"
				+"</button>"
				+"<div class='dropdown-menu'>"
				+proc
				+"</div>"
				+"</div>"
				+"</td>"
				+"</tr>";



				listhtml="	<tr> 	<th>처리 상태</th> 	<th>댓글 작성자</th> 	<th>댓글 내용</th> 	<th>신고자</th> 	<th>신고 내용</th> </tr>";

			}


		}
	}
	$("#dataTableBody").html(chartHtml);
	$("#dataTableList").html(listhtml);
}




//페이지네이션 표시 함수
function paging(currentPage,step) { 
	console.log('페이징 함수 실행5');
	if(totalData!=0){ // dataList에 데이터(상품||리뷰)가 있을 때 페이징 띄우기
		console.log('paging 함수 '+part);
		// 지정한 페이징 숫자보다 실제 페이지가 적을 경우 
		if(totalPage<pageCount){
			pageCount=totalPage; // 페이징 숫자를 줄여줌
		}

		// (페이징의 끝에서) 남은 페이징 숫자가 전체페이지보다 크다 
		if (last > totalPage) {
			last = totalPage; // 페이징 끝을 줄여줌
		}

//		first = last - (pageCount - 1); //화면에 보여질 첫번째 페이지 번호

		let pageHtml = "";

		if (first > 1) {
			pageHtml += "<a href='javascript:list("+(first-1)+","+step+")' id='prev'><li> ◀ </li></a>";
		}

		//페이징 번호 표시 
		for (var i = first; i <= last; i++) {
			if (currentPage == i) {
				pageHtml +=
					"<a href='javascript:list("+i+","+step+")' id='" + i + "'><li class='on'>" + i + "</li></a>";
			} else {
				pageHtml += "<a href='javascript:list("+i+","+step+")' id='" + i + "'><li>" + i + "</li></a>";
			}
		}

		if (last < totalPage) {
			pageHtml += "<a href='javascript:list("+(last+1)+","+step+")' id='next'><li> ▶ </li></a>";
		}

		pageHtml+="<br><br>";
		console.log('총 페이징 수'+pageCount);
		$("#pagingul").html(pageHtml);

		/*	  let displayCount = "";
	  displayCount = "현재 1 - " + totalPage + " 페이지 / " + totalData + "건";
	  $("#displayCount").text(displayCount);*/

	}
	else{ // 목록에 dataList(상품||리뷰)가 없을 때 이미지 띄우기
		let pageHtml = "<br><br>데이터가 없습니다.<br><br><br>";
		$("#pagingul").html(pageHtml);
	}
}

function proc(data) {
	console.log(typeof data.reportNum);
	console.log('target Num '+ data.targetNum);
	console.log('userId '+ data.userId);
	console.log( 'reportNum '+ data.reportNum);
	console.log('reporterId '+ data.reporterId);
	console.log('reportStep'+ data.reportStep);
	console.log('dsdsds');


	var targetNumInput = document.getElementById("targetNum"); // id가 boardNum 인 태그 가져와서 매개변수로 받은 boardNum 대입
	targetNumInput.value =parseInt(data.targetNum);

	var reportInput = document.getElementById("reportNum");  // id가 reportNum 인 태그 가져와서 매개변수로 받은 reportNum 대입
	reportInput.value =parseInt(data.reportNum);

	var userIdInput = document.getElementById("userId");  // id가 userNum 인 태그 가져와서 매개변수로 받은 userNum 대입
	userIdInput.value =data.userId;

	var reporterInput = document.getElementById("reporterId");  // id가 reporterNum 인 태그 가져와서 매개변수로 받은 reporterNum 대입
	reporterInput.value =data.reporterId;

	var reportStepInput=document.getElementById("reportStep");
	reportStepInput.value=parseInt(data.reportStep);


	console.log('target Num '+ targetNumInput.value);
	console.log('userId '+userIdInput.value);
	console.log( 'reportNum '+ reportInput.value);
	console.log('reporterId '+ reporterInput.value );
	console.log('reportStep '+ reportStepInput.value);

//	var reportForm = document.getElementById("reportForm");
//	reportForm.action = "updateReport.do";

	document.querySelector(".report-modal").classList.remove("report-modal-hidden");

};
function newOpen(data){
	console.log(data.targetNum);
	window.open("boardPostView.do?boardNum="+data.targetNum);


}

function replycontent(data) {
	console.log(data.targetNum);
	window.open("selectOneReply.do?replyNum="+data.targetNum , "replycontent", "width=500,height=500, left=400, top = 200");
}
