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
									<div class="product__details__price">${td.gia} Đ</div>
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
												<h6>Products Infomation</h6>
												<p>Vestibulum ac diam sit amet quam vehicula elementum
													sed sit amet dui. Pellentesque in ipsum id orci porta
													dapibus. Proin eget tortor risus. Vivamus suscipit tortor
													eget felis porttitor volutpat. Vestibulum ac diam sit amet
													quam vehicula elementum sed sit amet dui. Donec rutrum
													congue leo eget malesuada. Vivamus suscipit tortor eget
													felis porttitor volutpat. Curabitur arcu erat, accumsan id
													imperdiet et, porttitor at sem. Praesent sapien massa,
													convallis a pellentesque nec, egestas non nisi. Vestibulum
													ac diam sit amet quam vehicula elementum sed sit amet dui.
													Vestibulum ante ipsum primis in faucibus orci luctus et
													ultrices posuere cubilia Curae; Donec velit neque, auctor
													sit amet aliquam vel, ullamcorper sit amet ligula. Proin
													eget tortor risus.</p>
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