<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<head>

<jsp:include page="/common/webKH/head.jsp" />

</head>

<body>
	<jsp:include page="/common/webKH/header.jsp" />
	<jsp:include page="/common/webKH/menubar.jsp" />

	<!-- CONTENT -->
	<div class="container-fluid main">
		<div class="container">
			<div class="content">
				<jsp:include page="/common/webKH/searchbar.jsp" />
				<!-- Shoping Cart Section Begin -->
				<section class="shoping-cart spad">
					<div class="container">
						<div class="row">
							<div class="col-lg-12">
								<div class="shoping__cart__table">
									<table>
										<thead>
											<tr>
												<th class="shoping__product">Sản phẩm</th>
												<th>Giá tiền</th>
												<th>Số lượng</th>
												<th>Tổng cộng</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<form:form method="post" action="KH-giohang.htm"
												modelAttribute="gioHangs">
												<c:forEach var="gh" items="${gioHangs}" varStatus="status">




												<%-- 	<tr>
														<td class="shoping__cart__item"><img
															src="img/cart/cart-1.jpg" alt="">
															<h5>mon thu 1</h5></td>
														<td class="shoping__cart__price">$55.00</td>
														<td class="shoping__cart__quantity">
															<div class="quantity">
																<div class="pro-qty">
																	<form:input path="gh[${status.index}].soLuong"
																		name="soLuong" id="soLuong" type="number" />
																</div>
															</div>
														</td>
														<td class="shoping__cart__total">$110.00</td>
														<td class="shoping__cart__item__close"><span
															class="icon_close"></span></td>
													</tr> --%>




												</c:forEach>
											</form:form>
											<c:forEach var="th" items="${spGioHang}">

											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<div class="shoping__cart__btns">
									<a href="./shop-grid.html" class="primary-btn cart-btn">MUA
										TIẾP</a> <a href="#" class="primary-btn cart-btn cart-btn-right"><span
										class="icon_loading"></span> CẬP NHẬT GIỎ HÀNG</a>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="shoping__continue">
									<div class="shoping__discount">
										<h5>Mã giảm giá</h5>
										<form action="#">
											<input type="text" placeholder="Nhập mã giảm giá">
											<button type="submit" class="site-btn">XÁC NHẬN</button>
										</form>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="shoping__checkout">
									<h5>Tổng tiền</h5>
									<ul>
										<li>Tạm tính <span>50000</span></li>
										<li>Tổng<span>20000000</span></li>
									</ul>
									<a href="#" class="primary-btn">XÁC NHẬN MUA HÀNG</a>
								</div>
							</div>
						</div>
					</div>
				</section>
				<!-- Shoping Cart Section End -->

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

</body>

</html>