// 전역변수
let pNum;
let action;

function cList(pNumIn, actionIn) {
	pNum = pNumIn;
	action = actionIn;

	console.log("pNum: " + pNum);
	console.log("action: " + action);

	$.ajax({ // ajax로 데이터 가져오기
		type: 'POST',
		url: 'updateCart.do',
		data: { pNum: pNum, action: action }, // category, sort 담아서 ListController Servlet에 걸리게!
		dataType: 'json',
		traditional: 'true',
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success: function(data) {
			setCartCnt();
			let dataList = data;
			let chartHtml = "";
			let totalHtml = 0;

			console.log("dataList: " + dataList);
			console.log("dataList.length: " + dataList.length);

			if (dataList.length != 0) {
				console.log("cList 데이터 있음");
				console.log(dataList);

				chartHtml += "<table><thead><tr><th class='shoping__product'>상품목록</th><th>가격</th><th>수량</th><th>총 가격</th></tr></thead>"
					+ "<tbody>";

				for (var i = 0; i < dataList.length; i++) {
					chartHtml += "<tr><td class='shoping__cart__item'><a href='shopDetails.do?pNum=" + dataList[i].pNum + "'><img src='" + dataList[i].imageName + "' height='100px' alt='상품이미지' /></a>"
						+ "<a href='shopDetails.do?pNum=" + dataList[i].pNum + "'><h5>" + dataList[i].pName + "</h5></a></td><td class='shoping__cart__price'>" + dataList[i].dc_price.toLocaleString('ko-KR') + "원</td><td class='shoping__cart__quantity'>"
						+ "<div class='quantity'>"
						+ "<input type='button' value='-'onclick='cList(" + dataList[i].pNum + ",`-`)'>"
						+ "<input type='text' value='" + dataList[i].pCnt + "' style='width:50px; text-align:center;' readonly />"
						+ "<input type='button' value='+'onclick='cList(" + dataList[i].pNum + ",`+`)'></button></div></td>"
						+ "<td class='shoping__cart__total'>" + (dataList[i].dc_price * dataList[i].pCnt).toLocaleString('ko-KR') + "원</td>"
						+ "<td class='shoping__cart__item__close'><a href='javascript:void(0);' onclick='cList(" + dataList[i].pNum + ",`delete`);'><span class='icon_close'></span></a></td>"
						+ "</tr>";
					totalHtml += dataList[i].dc_price * dataList[i].pCnt;
				}
				chartHtml += "</tbody></table>";

				$("#dataTableBody").html(chartHtml);

			}
			else {
				chartHtml = "<img src='img/noCartNotice.png' style='width:300px;' alt='장바구니가 비었습니다.'>";
				$("#dataTableBody").html(chartHtml);

			}
			console.log("totalHtml: " + totalHtml);
			$("#totalData").html("<strong>결제금액<span>&nbsp;&nbsp;<div >" + totalHtml.toLocaleString('ko-KR') + "원</div></span></strong>");

		}
	});
}
function setCartCnt() {
	$.ajax({ // ajax로 데이터 가져오기
		type: 'POST',
		url: 'getCartCnt.do',
		success: function(data) {
			console.log("여기들어와data" + data);
			let cartCnt = data; // 장바구니 상품 개수
			$("#cartCnt").html(cartCnt);
		},
		error: function() {
			alert('error');
		}
	})
}