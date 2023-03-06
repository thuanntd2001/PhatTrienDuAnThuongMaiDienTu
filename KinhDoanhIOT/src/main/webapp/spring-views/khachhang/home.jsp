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
				<!-- Product Section Begin -->
				<section class="product spad">

					<div class="col-lg-9 col-md-7">


						<div class="filter__item">
							<div class="row">
								<div class="col-lg-4 col-md-5">
									<div class="filter__sort">
										<span>Sắp xếp</span> <select>
											<option value="0">Mặc định</option>
											<option value="0">Mặc định</option>
										</select>
									</div>
								</div>
								<div class="col-lg-4 col-md-4">
									<div class="filter__found">
										<h6>
											<span>6</span> Sản phẩm
										</h6>
									</div>
								</div>
								<div class="col-lg-4 col-md-3">
									<div class="filter__option">
										<span class="icon_grid-2x2"></span> <span class="icon_ul"></span>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
						
						
						
						
							<div class="col-lg-4 col-md-6 col-sm-6">
								<div class="product__item">
									<div class="product__item__pic set-bg"
										data-setbg="img/product/product-1.jpg">
										<ul class="product__item__pic__hover">
											<li><a href="#"><i class="fa fa-heart"></i></a></li>
											<li><a href="#"><i class="fa fa-retweet"></i></a></li>
											<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
										</ul>
									</div>
									<div class="product__item__text">
										<h6>
											<a href="#">Cuc thit</a>
										</h6>
										<h5>100000d</h5>
									</div>
								</div>
							</div>
							
							
							
							
							
						
						
					
					
				
							<div class="product__pagination">
								<a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a
									href="#"><i class="fa fa-long-arrow-right"></i></a>
							</div>

						</div>
					</div>
				</section>
				<!-- Product Section End -->

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