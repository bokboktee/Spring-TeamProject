// 전역변수
let dataPerPage=9; //한 페이지에 나타낼 글 수
let pageCount=5; //페이징에 나타낼 페이지 수
let currentPage=1; // 현재 표시중인 페이지
let first=1; // 페이징 첫 페이지
let last; // 페이징 마지막 페이지
let totalData; //총 데이터 수
let category; // 목록 요청 매개변수(카테고리)
let sort; // 목록 요청 매개변수(정렬방법)
let dataList; //표시하려하는 데이터 리스트
let selectPage; // 보고싶은 페이지(실제로 사용자가 보고 싶은 페이지)
let totalPage; //총 페이지 수 결정

function list(categoryIn, sortIn, selectPage) {
	
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
	
 	console.log("selectPage: "+selectPage);
	category=categoryIn;
	sort=sortIn;
	
 	console.log("category: "+category);
 	console.log("sort: "+sort);
 	
	$.ajax({ // ajax로 데이터 가져오기
		type: 'POST',
		url: 'getList',
		data: {category:category, sort:sort}, // category, sort 담아서 ListController Servlet에 걸리게!
		dataType: 'json',
		traditional: 'true',
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success: function(data) {
			
			// 기본 세팅
			totalData = data.length;
			selectPage=selectPage; // 보고싶은 페이지(실제로 사용자가 보고 싶은 페이지) : 사실은 전역변수일 필요가 없으나 가독성 때문에...
			totalPage = Math.ceil(totalData / dataPerPage); //총 페이지 수 결정
			dataList=data;
			
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

  console.log("currentPage: "+currentPage);
  console.log("selectPage: "+selectPage);
  console.log("totalPage: "+totalPage);
  
  console.log("first: "+first);
  console.log("last: "+last);
  console.log("start: "+((first - 1) * dataPerPage));
  console.log("end: "+(totalData < (first * dataPerPage) ? totalData : (first * dataPerPage)));
  console.log("dataList[0].pNum: "+dataList[0].pNum);
  
  let chartHtml = "";

//Number로 변환하지 않으면 아래에서 +를 할 경우 스트링 결합이 되어버림.. 
//  currentPage = Number(currentPage);
//  dataPerPage = Number(dataPerPage);
  
  console.log(dataList);
  	if(totalData!=0){
		  	for (var i = (selectPage - 1) * dataPerPage ; i < (totalData < (selectPage * dataPerPage) ? totalData : (selectPage * dataPerPage)) ; i++) {
				    chartHtml+="<div class='col-lg-4 col-md-6 col-sm-6'><div class='product__item'><div class='product__item__pic set-bg'>"
		            +"<ul class='product__item__pic__hover'>"
		            +"<li><a href='insertCart.do?pNum="+dataList[i].pNum+"'><i class='fa fa-shopping-cart'></i></a></li></ul></div>"
		            +"<div class='product__item__text'><h6><a href='shopDetails.do?pNum="+dataList[i].pNum+"'>"+dataList[i].pName+"</a></h6>"
		            +"<h5>"+dataList[i].dc_price+"원</h5></div></div></div>";
			}
			$("#dataTableBody").html(chartHtml);
		
			// 목록 출력 뒤 css 적용해주는 부분
			let eles = document.getElementsByClassName("product__item__pic set-bg");
			
			for (var i = 0; i < eles.length ; i++) {
				    let url=dataList[i+(selectPage - 1) * dataPerPage].imageName;
				eles.item(i).style.backgroundImage="url('"+url+"')";
			}
  }
}


// 페이지네이션 표시 함수
function paging(currentPage) {
  if(totalData!=0){ // dataList에 데이터(상품||리뷰)가 있을 때 페이징 띄우기
	  
	  // 지정한 페이징 숫자보다 실제 페이지가 적을 경우 
	  if(totalPage<pageCount){
	    pageCount=totalPage; // 페이징 숫자를 줄여줌
	  }
  	  
  	  // (페이징의 끝에서) 남은 페이징 숫자가 전체페이지보다 크다 
	  if (last > totalPage) {
	    last = totalPage; // 페이징 끝을 줄여줌
	  }
	
//	  first = last - (pageCount - 1); //화면에 보여질 첫번째 페이지 번호
	  
	  console.log("first: "+first);
	  console.log("last: "+last);
	  console.log("currentPage: "+currentPage);
	  console.log("totalPage: "+totalPage);
	  console.log("pageCount: "+pageCount);
	  
	  let pageHtml = "";
	
	  if (first > 1) {
	    pageHtml += "<a href='javascript:list(`"+category+"`,`"+sort+"`,"+(first-1)+")' id='prev'><li> ◀ </li></a>";
	  }
	
	 //페이징 번호 표시 
	  for (var i = first; i <= last; i++) {
	    if (currentPage == i) {
	      pageHtml +=
	        "<a href='javascript:list(`"+category+"`,`"+sort+"`,"+i+")' id='" + i + "'><li class='on'>" + i + "</li></a>";
	    } else {
	      pageHtml += "<a href='javascript:list(`"+category+"`,`"+sort+"`,"+i+")' id='" + i + "'><li>" + i + "</li></a>";
	    }
	  }
	
	  if (last < totalPage) {
	    pageHtml += "<a href='javascript:list(`"+category+"`,`"+sort+"`,"+(last+1)+")' id='next'><li> ▶ </li></a>";
	  }
	  
	  console.log(category);
	  console.log(sort);
	  console.log(dataList);
	  
	  $("#pagingul").html(pageHtml);
	  
/*	  let displayCount = "";
	  displayCount = "현재 1 - " + totalPage + " 페이지 / " + totalData + "건";
	  $("#displayCount").text(displayCount);*/

	}
	else{ // 목록에 dataList(상품||리뷰)가 없을 때 이미지 띄우기
		let pageHtml = "<img src='img/noProductNotice.png' width='300px' alt='목록이 비었습니다.'/>";
		$("#pagingul").html(pageHtml);
	}
}

// 정렬방법 선택 부분
function sortSelect(category){
	var sortSelect=document.getElementById("sort");
	var category=category;
	var sort=sortSelect.options[document.getElementById("sort").selectedIndex].value;
	console.log(category);
	console.log(sort);
	
	list(category,sort,1);
}

// 글 표시개수 변경 이벤트
/*
$("#dataPerPage").change(function () {
    dataPerPage = $("#dataPerPage").val();
    //전역 변수에 담긴 globalCurrent 값을 이용하여 페이지 이동없이 글 표시개수 변경 
    paging(totalData, dataPerPage, pageCount, globalCurrentPage);
    displayData(globalCurrentPage, dataPerPage);
});
*/

