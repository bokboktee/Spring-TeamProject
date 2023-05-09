package com.wan.nss.biz.common;

import java.io.File;
import java.io.InputStream;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wan.nss.biz.image.ImageDAO;
import com.wan.nss.biz.image.ImageVO;
import com.wan.nss.biz.product.ProductDAO;
import com.wan.nss.biz.product.ProductVO;

@Component
public class Crawling {

	@Autowired
	private ProductDAO productDAO = new ProductDAO();
	@Autowired
	private ImageDAO imageDAO = new ImageDAO();

	final int MAX = 16; // ※※※※※※※※※ 카테고리별 크롤링할 상품 개수 (기본값 : 16)
	List<ProductVO> datas = new ArrayList<ProductVO>(); // 크롤링 데이터 저장 배열리스트

	public void downloadFile(URL url, String fileName) throws Exception {
		try (InputStream in = url.openStream()) {
			Files.copy(in, Paths.get(fileName));
		}
	}

	public void sample(HttpServletRequest request) {

		System.out.println("로그: Crawling.sample 시작");
		System.out.println();

		final String WEB_DRIVER_ID = "webdriver.chrome.driver"; // 드라이버 ID

		String projectPath = request.getSession().getServletContext().getRealPath("/"); // 파일 경로 ".../webapp/" 까지
		projectPath = projectPath.substring(0, projectPath.indexOf(".metadata"));
		System.out.println("projectPath: " + projectPath);
		System.out.println();
		final String WEB_DRIVER_PATH = projectPath + "NYANGSINSA2/src/main/webapp/Source/chromedriver"; // 드라이버

		List<ProductVO> datas = sampleStep01(request); // 반환받은 url 배열리스트

		// sampleStep02 시작
		System.out.println("로그: sampleStep02 시작");
		System.out.println();

		try {
			System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 크롬 설정을 담은 객체 생성
		ChromeOptions options = new ChromeOptions();

		options.addArguments("--disable-popup-blocking"); // 팝업 안 띄움
		options.addArguments("headless"); // 브라우저 안 띄움
		options.addArguments("--disable-gpu"); // gpu 비활성화
		options.addArguments("--blink-settings=imagesEnabled=false"); // 이미지 다운 안 받음

		// WebDriver객체가 곧 하나의 브라우저 창이라 생각한다.
		WebDriver driver = new ChromeDriver(options);

		// 폴더가 있으면 삭제하고 생성하기
		File dir = new File(projectPath + "NYANGSINSA2/src/main/webapp/img/101");
		if (dir.exists()) {
			File[] files = dir.listFiles();

			for (int i = 0; i < files.length; i++) {
				if (files[i].delete()) {
					System.out.println("101/" + files[i].getName() + " 파일 삭제");
				} else {
					System.out.println("※※※ 101/" + files[i].getName() + " 파일 삭제 실패");
				}
			}
			if (dir.delete()) {
				System.out.println("101 폴더 삭제");
				System.out.println();
			} else {
				System.out.println("101 폴더 삭제 실패");
				System.out.println();
			}
		}

		dir.mkdir();
		System.out.println("101 폴더 생성");
		System.out.println();

		File dir2 = new File(projectPath + "NYANGSINSA2/src/main/webapp/img/102");
		if (dir2.exists()) {
			File[] files = dir2.listFiles();

			for (int i = 0; i < files.length; i++) {
				if (files[i].delete()) {
					System.out.println("102/" + files[i].getName() + " 파일 삭제");
				} else {
					System.out.println("※※※ 102/" + files[i].getName() + " 파일 삭제 실패");
				}
			}
			if (dir2.delete()) {
				System.out.println("102 폴더 삭제");
				System.out.println();
			} else {
				System.out.println("※※※ 102 폴더 삭제 실패");
				System.out.println();
			}
		}
		dir2.mkdir();
		System.out.println("102 폴더 생성");
		System.out.println();

		// 폴더 생성 시간 확보하기
		try {
			Thread.sleep(1000);
			System.out.println("...");
			System.out.println();
		} catch (InterruptedException e) {
		}

		for (int i = 0; i < datas.size(); i++) { // url 배열 크기만큼 반복

			System.out.println("▶ " + (i + 100) + "번 sampleStep02 시작!");

			driver.get(datas.get(i).getSort()); // 크롤링할 상세 페이지 링크 연결;

			// 카테고리 구분
			String category = "";
			if (i >= 0 && i < MAX) {
				category = "food";
			} else if (i >= MAX && i < MAX * 2) {
				category = "treat";
			} else if (i >= MAX * 2 && i < MAX * 3) {
				category = "sand";
			}
			datas.get(i).setCategory(category);

			// 이미지 크롤링
			// 이미지 주소는 파일 다운로드를 위해 URL 객체로 만들기
			// 1. 대표이미지는 sampleStep01에서 이미 저장된 것을 사용
			URL imgUrl = null;
			try {
				imgUrl = new URL(datas.get(i).getImageName());
			} catch (Exception e) {
				System.out.println("※※※ sampleStep02 " + (i + 100) + "번 url로 URL 객체화 실패!");
			}
			// 2. 상세 설명 이미지는 sampleStep01에서 가져온 상세 정보 페이지의 상세 설명 이미지를 크롤링함
			URL imgUrl2 = null;
			try {
				imgUrl2 = new URL(
						driver.findElement(By.xpath("/html/body/div/div/div/div/div/div/div/div/div/div/picture/img"))
								.getAttribute("src"));
			} catch (Exception e) {
				System.out.println("※※※ sampleStep02 " + (i + 100) + "번 url2 크롤링 실패!");
			}

			// 상품 간단 설명 크롤링 + data 에 세팅하기
			String info;
			try {
				info = driver.findElement(By.xpath("/html/body/div/div/div/div/div/div/div/div/div/div/button/div/div"))
						.getText();
				datas.get(i).setpDetail(info);
			} catch (Exception e) {
				System.out.println("※※※ sampleStep02 " + (i + 100) + "번 상세정보 크롤링 실패!");
				datas.get(i).setpDetail("얼마나 같은 이상의 인생의 가치를 있는 무한한 아니다. 이상 꽃이 낙원을 날카로우나 그러므로 것은 황금시대다. 없으면, 앞이 착목한는 힘있다. 무한한 들어 구하지 이것이다. 꽃이 이상 구하지 보라. 일월과 현저하게 피고, 피에 피다. 그들은 있으며, 장식하는 그림자는 두기 아니다. 끝까지 인생에 능히 하여도 힘차게 품고 착목한는 아니다. 기쁘며, 방황하였으며, 타오르고 예수는 구할 용감하고 능히 청춘의 속잎나고, 보라. 풀밭에 간에 피부가 속잎나고, 반짝이는 이것이다.");
			}

			// 크롤링 데이터 확인 부분
			System.out.println("상품번호: " + (i + 100));
			System.out.println("상품카테고리: " + datas.get(i).getCategory());
			try {
				System.out.println("상품설명: " + datas.get(i).getpDetail().substring(0, 50) + " ...");
			} catch (Exception e) {
				System.out.println("상품설명: " + datas.get(i).getpDetail());
			}
			// 이미지1(대표 이미지) 시작
			// img 멤버변수 세팅
			ImageVO ivo = new ImageVO();

			// targetNum = pNum = i+1
			ivo.setTargetNum(i + 100);

			// typeNum = 101
			ivo.setTypeNum(101);

			// 이미지 파일 저장하기
			try {
				downloadFile(imgUrl, projectPath + "NYANGSINSA2/src/main/webapp/img/101/" + (i + 100) + ".jpg"); // 파일
				ivo.setImageName("img/101/" + (i + 100) + ".jpg");
				System.out.println("상품대표이미지주소: " + ivo.getImageName());
			} catch (Exception e) {
				// 다운로드 에러 발생시 default이미지로 지정
				System.out.println("※※※ sampleStep02 " + (i + 100) + "번 imgURL 다운로드 실패!");
				System.out.println("※※※ sampleStep02 " + (i + 100) + "번 imageName을 'img/default/101.jpg'로 설정!");
				ivo.setImageName("img/default/101.jpg");

			}


			// ivo insert into IMAGE
			imageDAO.insert(ivo);

			// 이미지1(대표 이미지) 끝

			// 이미지2(상세 설명 이미지) 시작
			// img2 멤버변수 세팅
			// targetNum = pNum = i+1
			ivo.setTargetNum(i + 100);

			// typeNum = 102
			ivo.setTypeNum(102);

			// 이미지 파일 저장하기
			// imgUrl이 null이 아닐 때
			try {
				downloadFile(imgUrl2, projectPath + "NYANGSINSA2/src/main/webapp/img/102/" + (i + 100) + ".jpg"); // 파일
				ivo.setImageName("img/102/" + (i + 100) + ".jpg");
				System.out.println("상품설명이미지주소: " + ivo.getImageName());
			} catch (Exception e) {
				// 다운로드 에러 발생시 default이미지로 지정
				System.out.println("※※※ sampleStep02 " + (i + 100) + "번 imgURL2 다운로드 실패!");
				System.out.println("※※※ sampleStep02 " + (i + 100) + "번 imageName을 'img/default/102.jpg'로 설정!");
				ivo.setImageName("img/default/102.jpg");
			}

			// ivo insert into IMAGE
			imageDAO.insert(ivo);

			// 이미지2(대표 이미지) 끝

			// PRODUCT 테이블에 추가

			// 임시 저장 데이터 비워주기
			datas.get(i).setSort(null);

			productDAO.insert(datas.get(i));

			System.out.println("■ " + (i + 100) + "번 sampleStep02 완료!");
			System.out.println();
			System.out.println();

		}
		try {
			if (driver != null) {
				// 드라이버 연결 종료
				driver.close(); // 드라이버 연결 해제
				// 프로세스 종료
				driver.quit();
			}
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}

		// sampleStep02 끝
		System.out.println("sampleStep02 끝");
		System.out.println();
		System.out.println("Crawling.sample 끝");
		System.out.println();
	}

// ---------------------------------------------------------------------------------------

	public List<ProductVO> sampleStep01(HttpServletRequest request) { // 카테고리별 url 가져오기

		// sampleStep01 시작
		System.out.println("sampleStep01 시작");
		System.out.println();

		final String WEB_DRIVER_ID = "webdriver.chrome.driver"; // 드라이버 ID
		String projectPath = request.getSession().getServletContext().getRealPath("/");
		projectPath = projectPath.substring(0, projectPath.indexOf(".metadata"));
		System.out.println("projectPath: " + projectPath);
		System.out.println();
		final String WEB_DRIVER_PATH = projectPath + "NYANGSINSA2/src/main/webapp/Source/chromedriver"; // 드라이버

		try {
			System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 크롬 설정을 담은 객체 생성
		ChromeOptions options = new ChromeOptions();

		options.addArguments("headless"); // 브라우저 안 띄움

		// WebDriver객체가 곧 하나의 브라우저 창이라 생각한다.
		WebDriver driver = new ChromeDriver(options);

		List<String> categoryDatas = new ArrayList<String>(); // 카테고리 배열리스트

		categoryDatas.add("https://catpre.com/category/053"); // 사료
		categoryDatas.add("https://catpre.com/category/054"); // 간식
		categoryDatas.add("https://catpre.com/category/056"); // 모래

		int imgNum = 265;
		for (int a = 0; a < categoryDatas.size(); a++) { // 카테고리 수만큼 반복
			imgNum += a * 2;
			driver.get(categoryDatas.get(a)); // 순차적으로 url 크롤링

			// 카테고리별 MAX만큼 상세 페이지 URL 크롤링
			List<WebElement> el1 = driver.findElements(By.className("MuiCardActionArea-root"));

			// 카테고리별 MAX만큼 상품이름 크롤링
			List<WebElement> el2 = driver.findElements(
					By.xpath("html/body/div/div/div/div/div/div/div/main/div/div/div/div/div/div/div/div/a/div/h3"));

			// 카테고리별 MAX만큼 상품 정가격 크롤링
			List<WebElement> el3 = driver.findElements(By.xpath(
					"html/body/div/div/div/div/div/div/div/main/div/div/div/div/div/div/div/div/a/div/div/div/span/s"));

			// 카테고리별 MAX만큼 상품 할인율 크롤링
			List<WebElement> el4 = driver
					.findElements(By.cssSelector("div.MuiCardContent-root.jss275 > div.jss311.jss257 > span"));

			// 카테고리별 MAX만큼 상품 대표이미지 크롤링
			List<WebElement> el5 = driver
					.findElements(By.xpath("html/body/div/div/div/div/div/div/div/main/div/div/div/div/div/div/div/div/a/div/div/picture/img"));

			// 카테고리별 MAX만큼 datas에 추가
			for (int i = 0; i < MAX; i++) {

				System.out.println("▶ " + (MAX * a + i + 100) + "번 sampleStep01 시작!");

				ProductVO data = new ProductVO();

				try {
					data.setSort(el1.get(i).getAttribute("href")); // 상세 페이지 주소를 sort에 임시 저장
				} catch (Exception e) {
					System.out.println("※※※ sampleStep01 " + (MAX * a + i + 100) + "번 상세주소 크롤링 실패!");
					data.setSort("No Detail URL");
				}
				try {
					data.setpName(el2.get(i).getText());
				} catch (Exception e) {
					System.out.println("※※※ sampleStep01 " + (MAX * a + i + 100) + "번 pName 크롤링 실패!");
					data.setpName("No Name");
				}
				try {
					// 상품 정가격 가져오기
					String price = el3.get(i).getText();
					// 가격데이터에서 화표 자리수 기호 제거
					String priceNumOnly = price.replaceAll(",", "");
					priceNumOnly = priceNumOnly.replaceAll("원", "");
					data.setPrice(Integer.parseInt(priceNumOnly));
				} catch (Exception e) {
					System.out.println("※※※ sampleStep01 " + (MAX * a + i + 100) + "번 price 크롤링 실패!");
					data.setPrice(0);
				}
				try {
					data.setImageName(el5.get(i).getAttribute("src"));
				} catch (Exception e) {
					System.out.println("※※※ sampleStep01 " + (MAX * a + i + 100) + "번 imageName(상품 대표 이미지 주소) 크롤링 실패!");
				}
				// 할인율 랜덤 지정
				data.setpDcPercent((new Random().nextInt(6)) * 5);

				// 수량은 기본 10으로 고정
				data.setpAmt(10);

				// 크롤링 데이터 확인 부분
				System.out.println("상품번호: " + (MAX * a + i + 100));
				System.out.println("상품상세페이지주소: " + data.getSort());
				System.out.println("상품이름: " + data.getpName());
				System.out.println("상품가격: " + data.getPrice());
				System.out.println("상품할인율: " + data.getpDcPercent());
				System.out.println("상품대표이미지주소: " + data.getImageName());

				datas.add(data);

				System.out.println("■ " + (MAX * a + i + 100) + "번 sampleStep01 완료!");
				System.out.println();
				System.out.println();

			}

		}
		try {
			if (driver != null) {
				// 드라이버 연결 종료
				driver.close(); // 드라이버 연결 해제
				// 프로세스 종료
				driver.quit();
			}
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}

		// sampleStep01 끝
		System.out.println("sampleStep01 끝");
		System.out.println();

		return datas; // sampleStep01 결과 담은 배열리스트 반환
	}
}
