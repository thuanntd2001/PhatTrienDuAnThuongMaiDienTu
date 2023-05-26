
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="spring.controller.khachhang.CurrencyFormatter"%>
<%@include file="/common/taglib.jsp"%>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<jsp:include page="/common/webKH/head.jsp" />
</head>

<body>
	<jsp:include page="/common/webKH/header.jsp" />

	<!-- CONTENT -->
	<div class="container-fluid main">
		<div class="container">
			<div class="content">


				<!-- Checkout Section Begin -->
				<section class="checkout spad">
					<div class="row">
						<div class="col-lg-9">
							<div class="checkout__form">
								<h4>THÔNG TIN THANH TOÁN</h4>

								<div class="row">
									<div class="col-lg-8 col-md-6">
										<div class="row">
											<div class="col-lg-6">
												<div class="checkout__input">
													<p>
														Fist Name<span>*</span>
													</p>
													<input readonly type="text">
												</div>
											</div>

										</div>

										<div class="checkout__input">
											<p>
												Address<span>*</span>
											</p>
											<input readonly type="text" placeholder="Street Address"
												class="checkout__input" readonly>
										</div>



										<div class="row">
											<div class="col-lg-6">
												<div class="checkout__input">
													<p>
														Phone<span>*</span>
													</p>
													<input readonly type="text">
												</div>
											</div>
											<div class="col-lg-6">
												<div class="checkout__input">
													<p>
														Email<span>*</span>
													</p>
													<input readonly type="text">
												</div>
											</div>
										</div>





									</div>

								</div>
							</div>
						</div>



						<!-- 						Form xac nhan-->
						<div class="col-lg-3">
							<form:form id="formsubmit" method="post" action="KH-giohang.htm"
								modelAttribute="ghform">

								<div class="checkout__order">
									<h4>Your Order</h4>


									<div class="checkout__order__products">
										Products <span>Total</span>
									</div>
									<ul>
										<c:forEach var="gh" items="${gioHangForm.gioHangs}"
											varStatus="status">
											<li>${spGioHang[status.index].ten}<span>${spGioHang[status.index].gia * gh.soLuong}</span></li>





											<form:input path="gioHangs[${status.index}].soLuong"
												class="quality-input" name="soLuong" id="soLuong"
												onchange="tinhTongTien" min="1"
												max="${spGioHang[status.index].slTon}" type="hidden" />



											<form:input path="gioHangs[${status.index}].maSP" name="maSP"
												id="maSP" type="hidden" />
											<form:input path="gioHangs[${status.index}].ID" name="id"
												id="id" type="hidden" />


										</c:forEach>
									</ul>

									<div class="checkout__order__total">
										Total <span> ${tongtien}</span>
									</div>




									<button id="btnthanhtoan" type="submit" class="site-btn">THANH
										TOÁN</button>


								</div>
							</form:form>

							<!-- 						Form xac nhan-->

						</div>













					</div>

				</section>
				<!-- Checkout Section End -->

			</div>

		</div>
	</div>







	<jsp:include page="/common/webKH/footer.jsp" />
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<script type="text/javascript">
		$('.set-bg').each(function() {
			var bg = $(this).data('setbg');
			$(this).css('background-image', 'url(' + bg + ')');
		});
	</script>


	<script>
		$(document).ready(

		function() {
			var tongTienPhaiTra = 0;
			$('.totaltemp').each(function() {
				document.getElementById()

				tongTienPhaiTra += giaTienMoi;
			});
			// Cập nhật tổng tiền phải trả
			let formattedPrice = new Intl.NumberFormat('vi-VN', {
				style : 'currency',
				currency : 'VND'
			}).format(tongTienPhaiTra)
			document.getElementById("total").innerHTML = formattedPrice;

			// Lắng nghe sự kiện thay đổi số lượng sản phẩm

		});
	</script>

</body>

</html>







