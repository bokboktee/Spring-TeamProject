/**
 * Dashboard Analytics
 */

'use strict';
console.log("진입"),
$.ajax({ // ajax로 데이터 가져오기
	type: 'POST',
	url: 'getChart.do',
	dataType: 'json',
	traditional: 'true',
	contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	success: function(data) {
		console.log("data ↓");
		console.log(data);
		
		var totalCnt = data.categoryCnt1 + data.categoryCnt2 + data.categoryCnt3;  // 총 주문수
		var foodCnt = data.categoryCnt1 / totalCnt * 100;  // 사료 주문 %
		var treatCnt = data.categoryCnt2 / totalCnt * 100; // 간식 주문 %
		var sandCnt = data.categoryCnt3 / totalCnt * 100;  // 모래 주문 %
		var foodSum = data.categorySum1;  // 사료 총 주문 금액
		var treatSum = data.categorySum2; // 간식 총 주문 금액
		var sandSum = data.categorySum3; // 모래 총 주문 금액
		var categorySum = foodSum + treatSum + sandSum;

		$('#foodSum').text(foodSum.toLocaleString('ko-KR') + '원');
		$('#treatSum').text(treatSum.toLocaleString('ko-KR') + '원');
		$('#sandSum').text(sandSum.toLocaleString('ko-KR') + '원');
		$('#categorySum').text('총 판매 : ' + categorySum.toLocaleString('ko-KR') + '원');
		$('#orderCnt').text(totalCnt + '건');

		console.log('사료:' + foodCnt);
		console.log('간식:' + treatCnt);
		console.log('모래:' + sandCnt);
		console.log('사료:' + foodSum);
		console.log('간식:' + treatSum);
		console.log('모래:' + sandSum);
		console.log("2023:"+data.thisYearSum);
		console.log("2022:"+data.lastYearSum);

		(function() {
			let cardColor, headingColor, axisColor, shadeColor, borderColor;

			cardColor = config.colors.white;
			headingColor = config.colors.headingColor;
			axisColor = config.colors.axisColor;
			borderColor = config.colors.borderColor;
			const AB1 = '#6667AB';
			const AB2 = '#aaa4a1';
			const AB3 = '#747082';


			// Total Revenue Report Chart - Bar Chart
			// --------------------------------------------------------------------
			const totalRevenueChartEl = document.querySelector('#totalRevenueChart'),
				totalRevenueChartOptions = {
					series: [
						{
							name: '2022',
							data: [18, 7, 15, 29, 18, 12, 9, 27, 20, 10, 7, 13]
						},
						{
							name: '2021',
							data: [-13, -18, -9, -14, -5, -17, -15, -11, -16, -19, -4, -10]
						}
					],
					chart: {
						height: 300,
						stacked: true,
						type: 'bar',
						toolbar: { show: false }
					},
					plotOptions: {
						bar: {
							horizontal: false,
							columnWidth: '33%',
							borderRadius: 12,
							startingShape: 'rounded',
							endingShape: 'rounded'
						}
					},
					colors: [config.colors.primary, config.colors.info],
					dataLabels: {
						enabled: false
					},
					stroke: {
						curve: 'smooth',
						width: 6,
						lineCap: 'round',
						colors: [cardColor]
					},
					legend: {
						show: true,
						horizontalAlign: 'left',
						position: 'top',
						markers: {
							height: 8,
							width: 8,
							radius: 12,
							offsetX: -3
						},
						labels: {
							colors: axisColor
						},
						itemMargin: {
							horizontal: 10
						}
					},
					grid: {
						borderColor: borderColor,
						padding: {
							top: 0,
							bottom: -8,
							left: 20,
							right: 20
						}
					},
					xaxis: {
						categories: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
						labels: {
							style: {
								fontSize: '13px',
								colors: axisColor
							}
						},
						axisTicks: {
							show: false
						},
						axisBorder: {
							show: false
						}
					},
					yaxis: {
						labels: {
							style: {
								fontSize: '13px',
								colors: axisColor
							}
						}
					},
					responsive: [
						{
							breakpoint: 1700,
							options: {
								plotOptions: {
									bar: {
										borderRadius: 10,
										columnWidth: '32%'
									}
								}
							}
						},
						{
							breakpoint: 1580,
							options: {
								plotOptions: {
									bar: {
										borderRadius: 10,
										columnWidth: '35%'
									}
								}
							}
						},
						{
							breakpoint: 1440,
							options: {
								plotOptions: {
									bar: {
										borderRadius: 10,
										columnWidth: '42%'
									}
								}
							}
						},
						{
							breakpoint: 1300,
							options: {
								plotOptions: {
									bar: {
										borderRadius: 10,
										columnWidth: '48%'
									}
								}
							}
						},
						{
							breakpoint: 1200,
							options: {
								plotOptions: {
									bar: {
										borderRadius: 10,
										columnWidth: '40%'
									}
								}
							}
						},
						{
							breakpoint: 1040,
							options: {
								plotOptions: {
									bar: {
										borderRadius: 11,
										columnWidth: '48%'
									}
								}
							}
						},
						{
							breakpoint: 991,
							options: {
								plotOptions: {
									bar: {
										borderRadius: 10,
										columnWidth: '30%'
									}
								}
							}
						},
						{
							breakpoint: 840,
							options: {
								plotOptions: {
									bar: {
										borderRadius: 10,
										columnWidth: '35%'
									}
								}
							}
						},
						{
							breakpoint: 768,
							options: {
								plotOptions: {
									bar: {
										borderRadius: 10,
										columnWidth: '28%'
									}
								}
							}
						},
						{
							breakpoint: 640,
							options: {
								plotOptions: {
									bar: {
										borderRadius: 10,
										columnWidth: '32%'
									}
								}
							}
						},
						{
							breakpoint: 576,
							options: {
								plotOptions: {
									bar: {
										borderRadius: 10,
										columnWidth: '37%'
									}
								}
							}
						},
						{
							breakpoint: 480,
							options: {
								plotOptions: {
									bar: {
										borderRadius: 10,
										columnWidth: '45%'
									}
								}
							}
						},
						{
							breakpoint: 420,
							options: {
								plotOptions: {
									bar: {
										borderRadius: 10,
										columnWidth: '52%'
									}
								}
							}
						},
						{
							breakpoint: 380,
							options: {
								plotOptions: {
									bar: {
										borderRadius: 10,
										columnWidth: '60%'
									}
								}
							}
						}
					],
					states: {
						hover: {
							filter: {
								type: 'none'
							}
						},
						active: {
							filter: {
								type: 'none'
							}
						}
					}
				};
			if (typeof totalRevenueChartEl !== undefined && totalRevenueChartEl !== null) {
				const totalRevenueChart = new ApexCharts(totalRevenueChartEl, totalRevenueChartOptions);
				totalRevenueChart.render();
			}


			// Growth Chart - Radial Bar Chart
			// --------------------------------------------------------------------
			const growthChartEl = document.querySelector('#growthChart');
			var revenueDatas = [];
				revenueDatas.push(data.lastYearSum); // 상수의 값을 연도별 수익 데이터가 담긴 인덱스로 변경해줘야함!
				revenueDatas.push(data.thisYearSum); // 상수의 값을 연도별 수익 데이터가 담긴 인덱스로 변경해줘야함!

			$('#revenueLastYear').text(data.lastYearSum.toLocaleString('ko-KR')+'원');
			$('#revenueThisYear').text(data.thisYearSum.toLocaleString('ko-KR')+'원');
			$('#growthRevenue').html((data.thisYearSum - data.lastYearSum).toLocaleString('ko-KR') + '원</b> 성장');
			if(data.lastYearSum != 0){
				$('#growthPercent').html(Math.round((data.thisYearSum - data.lastYearSum)/data.lastYearSum*100) + '%</b> 성장');
			}
			else{
				$('#growthPercent').html(Math.round(data.thisYearSum) + '%</b> 성장');
			}
			growthChartOptions = {
				series: revenueDatas,
				labels: ['성장'],
				chart: {
					height: 240,
					type: 'radialBar'
				},
				plotOptions: {
					radialBar: {
						size: 150,
						offsetY: 10,
						startAngle: -150,
						endAngle: 150,
						hollow: {
							size: '55%'
						},
						track: {
							background: cardColor,
							strokeWidth: '100%'
						},
						dataLabels: {
							name: {
								offsetY: 15,
								color: headingColor,
								fontSize: '15px',
								fontWeight: '600',
								fontFamily: 'Public Sans'
							},
							value: {
								offsetY: -25,
								color: headingColor,
								fontSize: '22px',
								fontWeight: '500',
								fontFamily: 'Public Sans'
							}
						}
					}
				},
				colors: [config.colors.primary],
				fill: {
					type: 'gradient',
					gradient: {
						shade: 'dark',
						shadeIntensity: 0.5,
						gradientToColors: [config.colors.primary],
						inverseColors: true,
						opacityFrom: 1,
						opacityTo: 0.6,
						stops: [30, 70, 100]
					}
				},
				stroke: {
					dashArray: 5
				},
				grid: {
					padding: {
						top: -35,
						bottom: -10
					}
				},
				states: {
					hover: {
						filter: {
							type: 'none'
						}
					},
					active: {
						filter: {
							type: 'none'
						}
					}
				}
			};
			if (typeof growthChartEl !== undefined && growthChartEl !== null) {
				const growthChart = new ApexCharts(growthChartEl, growthChartOptions);
				growthChart.render();
			}

			// Profit Report Line Chart
			// --------------------------------------------------------------------
			const profileReportChartEl = document.querySelector('#profileReportChart'),
				profileReportChartConfig = {
					chart: {
						height: 80,
						// width: 175,
						type: 'line',
						toolbar: {
							show: false
						},
						dropShadow: {
							enabled: true,
							top: 10,
							left: 5,
							blur: 3,
							color: config.colors.warning,
							opacity: 0.15
						},
						sparkline: {
							enabled: true
						}
					},
					grid: {
						show: false,
						padding: {
							right: 8
						}
					},
					colors: [config.colors.warning],
					dataLabels: {
						enabled: false
					},
					stroke: {
						width: 5,
						curve: 'smooth'
					},
					series: [
						{
							data: [110, 270, 145, 245, 205, 285]
						}
					],
					xaxis: {
						show: false,
						lines: {
							show: false
						},
						labels: {
							show: false
						},
						axisBorder: {
							show: false
						}
					},
					yaxis: {
						show: false
					}
				};
			if (typeof profileReportChartEl !== undefined && profileReportChartEl !== null) {
				const profileReportChart = new ApexCharts(profileReportChartEl, profileReportChartConfig);
				profileReportChart.render();
			}




			// Order Statistics Chart  주문통계 차트
			// --------------------------------------------------------------------
			const chartOrderStatistics = document.querySelector('#orderStatisticsChart'),
				orderChartConfig = {
					chart: {
						height: 165,
						width: 130,
						type: 'donut'
					},
					labels: ['사료', '모래', '간식'],  // 표시될 이름
					series: [foodCnt, sandCnt, treatCnt],
					colors: [AB2, AB3, AB1],
					stroke: {
						width: 5,
						colors: cardColor
					},
					dataLabels: {
						enabled: false,
						formatter: function(val, opt) {
							return parseInt(val) + '%';
						}
					},
					legend: {
						show: false
					},
					grid: {
						padding: {
							top: 0,
							bottom: 0,
							right: 15
						}
					},
					plotOptions: {
						pie: {
							donut: {
								size: '75%',
								labels: {
									show: true,
									value: {
										fontSize: '1.5rem',
										fontFamily: 'Public Sans',
										color: headingColor,
										offsetY: -15,
										formatter: function(val) {
											return parseInt(val) + '%';
										}
									},
									name: {
										offsetY: 20,
										fontFamily: 'Public Sans'
									},
									total: {
										show: true,
										fontSize: '0.8125rem',
										color: axisColor,
										label: '전체 판매량',
										formatter: function(w) {
											return '100%';
										}
									}
								}
							}
						}
					}
				};

			if (typeof chartOrderStatistics !== undefined && chartOrderStatistics !== null) {
				const statisticsChart = new ApexCharts(chartOrderStatistics, orderChartConfig);
				statisticsChart.render();
			}



			// Income Chart - Area chart
			// --------------------------------------------------------------------
			const incomeChartEl = document.querySelector('#incomeChart'),
				incomeChartConfig = {
					series: [
						{
							data: [24, 21, 30, 22, 42, 26, 35, 29]
						}
					],
					chart: {
						height: 215,
						parentHeightOffset: 0,
						parentWidthOffset: 0,
						toolbar: {
							show: false
						},
						type: 'area'
					},
					dataLabels: {
						enabled: false
					},
					stroke: {
						width: 2,
						curve: 'smooth'
					},
					legend: {
						show: false
					},
					markers: {
						size: 6,
						colors: 'transparent',
						strokeColors: 'transparent',
						strokeWidth: 4,
						discrete: [
							{
								fillColor: config.colors.white,
								seriesIndex: 0,
								dataPointIndex: 7,
								strokeColor: config.colors.primary,
								strokeWidth: 2,
								size: 6,
								radius: 8
							}
						],
						hover: {
							size: 7
						}
					},
					colors: [config.colors.primary],
					fill: {
						type: 'gradient',
						gradient: {
							shade: shadeColor,
							shadeIntensity: 0.6,
							opacityFrom: 0.5,
							opacityTo: 0.25,
							stops: [0, 95, 100]
						}
					},
					grid: {
						borderColor: borderColor,
						strokeDashArray: 3,
						padding: {
							top: -20,
							bottom: -8,
							left: -10,
							right: 8
						}
					},
					xaxis: {
						categories: ['', '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
						axisBorder: {
							show: false
						},
						axisTicks: {
							show: false
						},
						labels: {
							show: true,
							style: {
								fontSize: '13px',
								colors: axisColor
							}
						}
					},
					yaxis: {
						labels: {
							show: false
						},
						min: 10,
						max: 50,
						tickAmount: 4
					}
				};
			if (typeof incomeChartEl !== undefined && incomeChartEl !== null) {
				const incomeChart = new ApexCharts(incomeChartEl, incomeChartConfig);
				incomeChart.render();
			}

			// Expenses Mini Chart - Radial Chart
			// --------------------------------------------------------------------
			const weeklyExpensesEl = document.querySelector('#expensesOfWeek'),
				weeklyExpensesConfig = {
					series: [65],
					chart: {
						width: 60,
						height: 60,
						type: 'radialBar'
					},
					plotOptions: {
						radialBar: {
							startAngle: 0,
							endAngle: 360,
							strokeWidth: '8',
							hollow: {
								margin: 2,
								size: '45%'
							},
							track: {
								strokeWidth: '50%',
								background: borderColor
							},
							dataLabels: {
								show: true,
								name: {
									show: false
								},
								value: {
									formatter: function(val) {
										return '$' + parseInt(val);
									},
									offsetY: 5,
									color: '#697a8d',
									fontSize: '13px',
									show: true
								}
							}
						}
					},
					fill: {
						type: 'solid',
						colors: config.colors.primary
					},
					stroke: {
						lineCap: 'round'
					},
					grid: {
						padding: {
							top: -10,
							bottom: -15,
							left: -10,
							right: -10
						}
					},
					states: {
						hover: {
							filter: {
								type: 'none'
							}
						},
						active: {
							filter: {
								type: 'none'
							}
						}
					}
				};
			if (typeof weeklyExpensesEl !== undefined && weeklyExpensesEl !== null) {
				const weeklyExpenses = new ApexCharts(weeklyExpensesEl, weeklyExpensesConfig);
				weeklyExpenses.render();
			}

		})()
	}
});
