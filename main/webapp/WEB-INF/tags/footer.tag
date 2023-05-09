<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!-- Footer Section Begin -->
	<footer class="footer spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-6">
					<div class="footer__about">
						<div class="footer__about__logo">
							<a href="main.do">
								<img src="img/logo.png" alt="로고">
							</a>
						</div>

					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-6">
					<div class="footer__widget">
						<ul>
							<li><spring:message code="message.footer.address"/></li>
							<li><spring:message code="message.footer.phone"/> : +82 02-0202-0202</li>
							<li><spring:message code="message.footer.email"/> : nyangsinsa@gmail.com</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-6">
					<div class="footer__widget">
						<div class="footer__widget__social">
							<a href="https://www.facebook.com/profile.php?id=100089405234926">
								<i class="fa fa-facebook"></i>
							</a>
							<a href="https://www.instagram.com/nyangsinsa5/">
								<i class="fa fa-instagram"></i>
							</a>
							<a href="https://twitter.com/nyangsinsa">
								<i class="fa fa-twitter"></i>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="footer__copyright">
						<div class="footer__copyright__text">
							<p>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright 냥신사&copy;
								<script>
									document.write(new Date().getFullYear());
								</script>
								All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by
								<a href="https://colorlib.com" target="_blank">Colorlib</a>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</p>
						</div>
						<div class="footer__copyright__payment">
							<img src="img/payment-item.png" alt="결제수단">
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer Section End -->
	
