<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<jsp:include page="/common/webKH/searchbar.jsp" />
				<!-- Shoping Cart Section Begin -->
				<section class="shoping-cart spad">
					<form:form method="post" action="KH-giohang.htm"
						modelAttribute="gioHangForm">
						<div class="container">
							<div class="row">
								<div class="col-lg-12">
									<div class="shoping__cart__table">

										<table>
											<thead>
												<tr>
													<th>No.</th>
													<th class="shoping__product">Sản phẩm</th>
													<th>Giá tiền</th>
													<th>Số lượng</th>
													<th>Tổng cộng</th>
													<th></th>
												</tr>
											</thead>
											<tbody>

												<c:forEach var="gh" items="${gioHangForm.gioHangs}"
													varStatus="status">




													<tr>
														<td align="center">${status.count}</td>
														<td class="shoping__cart__item"><img
															src="img/cart/cart-1.jpg" alt="">
															<h5>${spGioHang[status.index].ten}</h5></td>
														<td class="shoping__cart__price">
															${spGioHang[status.index].gia} Đồng</td>
														<td class="shoping__cart__quantity">
															<div class="quantity">
																<div class="pro-qty">
																	<form:input path="gioHangs[${status.index}].soLuong"
																		class="quality-input" name="soLuong" id="soLuong"
																		onchange='checkSoLuong' min="1" type="number" />
																</div>
																<form:input path="gioHangs[${status.index}].maSP"
																	name="maSP" id="maSP" type="hidden" />
																<form:input path="gioHangs[${status.index}].ID"
																	name="id" id="id" type="hidden" />
															</div>


														</td>
														<td class="shoping__cart__total"><span
															id="totalPrice-${status.index}">${spGioHang[status.index].gia * gh.soLuong}</span>
															Đồng</td>
														<td class="shoping__cart__item__close"><span
															class="icon_close"></span></td>
													</tr>




												</c:forEach>


											</tbody>
										</table>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-12">
									<div class="shoping__cart__btns">
										<a href="khachhanghome.htm" class="primary-btn cart-btn">MUA
											TIẾP</a>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="shoping__continue"></div>
								</div>
								<div class="col-lg-6">
									<div class="shoping__checkout">
										<h5>Tổng tiền</h5>
										<ul>
											<li>Tổng<span id='total'>0</span>Đồng</li>
										</ul>
										<button type="submit" class="site-btn">XÁC NHẬN MUA
											HÀNG</button>
									</div>
								</div>
							</div>
						</div>
					</form:form>

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


<script>
	$(document).ready(
			function() {
				// Lắng nghe sự kiện thay đổi số lượng sản phẩm
				$('input.quality-input').on(
						'change',
						function() {
							// Lấy giá trị số lượng sản phẩm mới
							var soLuong = parseInt($(this).val());
							// Lấy giá trị giá tiền của sản phẩm hiện tại
							var giaTien = parseInt($(this).closest('tr').find(
									'.shoping__cart__price').text().replace(
									/\D/g, ''));
							// Tính toán giá tiền mới
							var giaTienMoi = soLuong * giaTien;
							// Cập nhật giá tiền mới vào cột "Tổng cộng"
							$(this).closest('tr').find('.shoping__cart__total')
									.text(giaTienMoi + " Đồng");
					
						});
			});
			
	
	
	
</script>
