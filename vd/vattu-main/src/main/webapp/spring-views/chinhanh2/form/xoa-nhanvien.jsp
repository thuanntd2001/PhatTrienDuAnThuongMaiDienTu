<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>


<head>

<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>QLVT</title>
<!-- ======= Head ======= -->
<jsp:include page="/template/cn2/chinhanh/head.jsp" />

</head>
<body>

	<!-- ======= Header ======= -->
	<jsp:include page="/template/cn2/chinhanh/header.jsp" />

	<!-- End Header -->

	<!-- ======= Sidebar ======= -->
	<jsp:include page="/template/cn2/chinhanh/sidebar.jsp" />

	<!-- End Sidebar-->


	<main id="main" class="main">

	<div class="pagetitle">
		<h1>Nhân viên</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a
					href="quanlynhanvien/cn2/chinhanh.htm">Nhân Viên</a></li>
				<li class="breadcrumb-item active">Xoá Nhân viên</li>
			</ol>
		</nav>
	</div>
	<section class="section">
		<div class="row">
			<div class="col-lg-5" >

				<div class="card">
					<div class="card-body" style="align-content: center;">
						<h5 class="card-title">Xoá nhân viên</h5>
						${message}
						
						
						<!-- Multi Columns Form -->
						<form action="quanlynhanvien/cn2/chinhanh/xoa.htm?id=${id }" method="post"
							class="row g-3">
							<div  class="col-md-12" style="align-items=center;">
								<label for="inputEmail5" class="form-label">Bạn có đồng ý xoá NV ${id }</label>
							</div>
							
							<div class="col-md-12">
								<label for="inputEmail5" class="form-label">Xác Nhận( Nhập "YES" vào khung này)</label>
								<input type="text" class="form-control" name="xacNhan" />
							</div>
							
							<div class="text-center" style="margin-top:15px; margin-left:170px">
								<button type="submit" class="btn btn-primary">Xoá</button>
								
							</div>
						</form>
						<!-- End Multi Columns Form -->

					</div>
				</div>

			</div>
		</div>
	</section>

	</main>
	<!-- End #main -->
	<jsp:include page="/template/cn2/chinhanh/footer.jsp" />


</body>

</html>