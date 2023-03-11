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
				<!-- Product Details Section Begin -->
				<section class="product-details spad">
					<div class="container">
						<div class="row">
							<div class="col-lg-6 col-md-6">
								<div class="product__details__pic">
									<div class="product__details__pic__item">
										<img class="product__details__pic__item--large"
											src="<c:url value='/common/images/products/${td.icon}'/>"
											alt="">
									</div>

								</div>
							</div>
							<div class="col-lg-6 col-md-6">
								<div class="product__details__text">
									<h3>${td.ten}</h3>
									<div class="product__details__rating">
										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star-half-o"></i>
										<!--  <span>(18 đánh giá)</span> -->
									</div>
									<div class="product__details__price">${td.gia}Đ</div>
									<form action="KH-giohangthem.htm" method="get">

										<input type="hidden" name="id" value="${td.ID }">

										<div class="product__details__quantity">
											<div class="quantity">
												<div class="pro-qty">
													<input type="number" name="sl" value="1">
												</div>

											</div>
										</div>
										<button type="submit" class="primary-btn">Thêm vào
											giỏ hàng</button>
									</form>
									<ul>
										<c:if test="${td.slTon > 0 }">
											<li><b>Trạng thái</b> <span>Còn hàng</span></li>
										</c:if>
										<c:if test="${td.slTon <= 0 }">
											<li><b>Trạng thái</b> <span>HẾT HÀNG </span></li>
										</c:if>

										<li><b>Loại sản phẩm</b> <span> ${loai.tenLoai} </span></li>

									</ul>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="product__details__tab">
									<ul class="nav nav-tabs" role="tablist">
										<li class="nav-item"><a class="nav-link active"
											data-toggle="tab" href="#tabs-1" role="tab"
											aria-selected="true">Mô tả sản phẩm</a></li>
										<li class="nav-item"><a class="nav-link"
											data-toggle="tab" href="#tabs-2" role="tab"
											aria-selected="false">Đánh giá sản phẩm</a></li>

									</ul>
									<div class="tab-content">
										<div class="tab-pane active" id="tabs-1" role="tabpanel">
											<div class="product__details__tab__desc">
												<h6>Mô tả sản phẩm</h6>
												<p>${td.moTa}</p>
											</div>
										</div>

										<div class="tab-pane" id="tabs-2" role="tabpanel">
											<div class="product__details__tab__desc">

												<div class="review-section">
													<h2>Đánh giá của khách hàng</h2>
													<c:forEach var="dg" items="${danhGias}">
														<div class="review">
															<div class="review-rating">
																<c:forEach begin="1" end="5" var="i">
																	<c:if test="${i <= dg.diem}"><span class="star">&#9733;</span></c:if>
																	<c:if test="${i > dg.diem}"><span class="star">&#9734;</span></c:if>
																</c:forEach>

																
															</div>
															<div class="review-content">
																<p class="review-author">${dg.userName}</p>
																<p class="review-text">${dg.danhGia}</p>
															</div>
														</div>
													</c:forEach>
												</div>

											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
				<!-- Product Details Section End -->



			</div>

		</div>
	</div>







	<jsp:include page="/common/webKH/footer.jsp" />
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>



</body>

</html>