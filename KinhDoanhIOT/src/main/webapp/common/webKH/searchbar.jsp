<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<!-- Hero Section Begin -->
<br>
<br>
<br>
<br>
<section class="hero hero-normal">
	<div class="container" style="display:flex;">
	
	
	<div class="col-lg-3">
				<div class="hero__categories">
					<div class="hero__categories__all">
						<i class="fa fa-bars"></i> <span>Tất cả danh mục</span>
					</div>
					<ul>
						<c:forEach var="loai" items="${LoaiSPs}">

							<li><a href="khachhangsearch-loai.htm?id=${loai.id}"> ${loai.tenLoai}
							</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
	
	
	
		<div class="col-lg-9">
			<div class="hero__search">
				<div class="hero__search__form">

					<form action="khachhangtimkiemtukhoa.htm" method = "get">

						<input type="text" placeholder="Nhập từ khóa cần tìm" name="searchtukhoa">
						<button type="submit" class="site-btn">TÌM KIẾM</button>
					</form>
				</div>

			</div>
		</div>
		

		</div>
</section>