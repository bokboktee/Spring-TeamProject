// 전역변수
let dataPerPage = 5; // 한 페이지에 나타낼 글 수
let pageCount = 5; // 페이징에 나타낼 페이지 수
let currentPage = 1; // 현재 표시중인 페이지
let first = 1; // 페이징 첫 페이지
let last; // 페이징 마지막 페이지
let totalData; // 총 데이터 수
let dataList; // 표시하려하는 데이터 리스트
let totalPage; //총 페이지 수 결정
let selectPage; // 보고싶은 페이지(실제로 사용자가 보고 싶은 페이지)
let part; // 목록 요청 매개변수(카테고리)

function list(selectPage) {

	// 페이징 시작번호와 끝번호 세팅하기
	last = first + pageCount - 1;
	if (selectPage < first) { // 보고싶은 페이지가 현재 페이징 첫 페이지보다 작을 때(즉, ◀ 버튼을 눌렀을 때)
		first -= pageCount; // 페이징 번호를 앞으로
		last -= pageCount;
	}
	else if (last < selectPage) {
		first += pageCount; // 페이징 번호를 뒤로
		last += pageCount;
	}

	part = "member";

	console.log("part: " + part);
	console.log("selectPage: " + selectPage);

	$.ajax({ // ajax로 데이터 가져오기
		type: 'POST',
		url: 'getAdminList.do',
		data: { part: part }, // category, sort 담아서 ListController Servlet에 걸리게!
		dataType: 'json',
		traditional: 'true',
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success: function(data) {
			console.log("회원 관리 데이터 수신 성공!")
			// 기본 세팅
			dataList = data;
			totalData = dataList.length;
			selectPage = selectPage; // 보고싶은 페이지(실제로 사용자가 보고 싶은 페이지) : 사실은 전역변수일 필요가 없으나 가독성 때문에...
			totalPage = Math.ceil(totalData / dataPerPage); //총 페이지 수 결정

			// 글 목록 표시 호출 (테이블 생성)
			console.log(dataList);
			displayData(selectPage); // 현재페이지인데 바뀌어서 나옴

			// 페이징 표시 호출
			paging(selectPage); // 그래서 저장해논 값을 넣어줌

		}
	});
};


// 데이터 출력 부분: 현재 페이지(currentPage)와 페이지당 글 개수(dataPerPage) 반영
function displayData(selectPage) {

	let chartHtml = "";

	// Number로 변환하지 않으면 아래에서 +를 할 경우 스트링 결합이 되어버림.. 
	//  currentPage = Number(currentPage);
	//  dataPerPage = Number(dataPerPage);

	console.log(dataList);
	if (totalData != 0) {
		for (var i = (selectPage - 1) * dataPerPage; i < (totalData < (selectPage * dataPerPage) ? totalData : (selectPage * dataPerPage)); i++) {

			chartHtml += "<tr><td><i class='fab fa-angular fa-lg text-danger me-3'></i> <strong>" + dataList[i].userId + "</strong></td>"
			+ "<td>" + dataList[i].userName + "</td>"
			+ "<td><ul class='list-unstyled users-list m-0 avatar-group d-flex align-items-center'>"
			+ "<li>" + dataList[i].phoneNum + "</li></ul></td>"
			+ "<td><span class='badge bg-label-primary me-1'>" + dataList[i].role + "</span></td>"
			+ "<td><p>" + dataList[i].warnCnt+ "</p></td>"
			+ "<td><div class='dropdown'><button type='button' class='btn p-0 dropdown-toggle hide-arrow' data-bs-toggle='dropdown'>"
			+ "<i class='bx bx-dots-vertical-rounded'></i></button>"
			+ "<div class='dropdown-menu'><a class='dropdown-item' href='javascript:member("+dataList[i].userNum+");'>"
			+ "<i class='bx bx-trash me-1'></i> 등급 관리</a></div></div></td></tr>";
		}
		$("#dataTableBody").html(chartHtml);
	}
}


// 페이지네이션 표시 함수
function paging(currentPage) {
	if (totalData != 0) { // dataList에 데이터(상품||리뷰)가 있을 때 페이징 띄우기

		console.log(totalPage);
		console.log(pageCount);
		// 지정한 페이징 숫자보다 실제 페이지가 적을 경우 
		if (totalPage < pageCount) {
			pageCount = totalPage; // 페이징 숫자를 줄여줌
		}

		console.log(totalPage);
		console.log(last);
		// (페이징의 끝에서) 남은 페이징 숫자가 전체페이지보다 크다 
		if (last > totalPage) {
			last = totalPage; // 페이징 끝을 줄여줌
		}

		//	  first = last - (pageCount - 1); //화면에 보여질 첫번째 페이지 번호


		let pageHtml = "";

		if (first > 1) {
			pageHtml += "<a href='javascript:list(" + (first - 1) + ")' id='prev'><li> ◀ </li></a>";
		}
		console.log(first);
		console.log(last);
		//페이징 번호 표시 
		for (var i = first; i <= last; i++) {
			if (currentPage == i) {
				pageHtml +=
					"<a href='javascript:list(" + i + ")' id='" + i + "'><li class='on'>" + i + "</li></a>";
			} else {
				pageHtml += "<a href='javascript:list(" + i + ")' id='" + i + "'><li>" + i + "</li></a>";
			}
		}

		if (last < totalPage) {
			pageHtml += "<a href='javascript:list(" + (last + 1) + ")' id='next'><li> ▶ </li></a>";
		}

		pageHtml += "<br><br>";

		$("#pagingul").html(pageHtml);

		/*	  let displayCount = "";
			  displayCount = "현재 1 - " + totalPage + " 페이지 / " + totalData + "건";
			  $("#displayCount").text(displayCount);*/

	}
	else { // 목록에 dataList(상품||리뷰)가 없을 때 이미지 띄우기
		let pageHtml = "<br><br>데이터가 없습니다.<br><br><br>";
		$("#pagingul").html(pageHtml);
	}
}


function member(data) {
	  var userNumInput = document.getElementById("userNum");
	  userNumInput.value = data;
	  console.log("userNum"+userNumInput.value);
	  
	  
	  const modal = document.querySelector(".report-modal");
	  const modalBox = modal.querySelector(".report-modalBox");
	  modalBox.classList.add("fadeIn"); // 모달창 열릴 때 애니메이션 추가
	  modal.classList.remove("report-modal-hidden");
	  
	  const closeBtn = modal.querySelector(".report-closeBtn");
	  closeBtn.addEventListener("click", function() {
	    modalBox.classList.remove("fadeIn"); // 열리는 애니메이션 클래스 제거
	    modalBox.classList.add("fadeOut"); // 닫히는 애니메이션 클래스 추가
	    setTimeout(function() {
	      modal.classList.add("report-modal-hidden");
	      modalBox.classList.remove("fadeOut"); // 닫히는 애니메이션 클래스 제거
	    }, 300); // 애니메이션 지속 시간과 같은 시간(0.3초) 이후에 클래스 제거
	  });
	};
