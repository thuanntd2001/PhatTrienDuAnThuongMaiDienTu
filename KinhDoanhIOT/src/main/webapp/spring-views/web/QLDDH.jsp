<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>IOT Shop</title>
<base href="${pageContext.servletContext.contextPath}/">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<link href="<c:url value='/template/web/styles.css'/>" rel="stylesheet"
	type="text/css">

</head>

<body>
	<jsp:include page="/common/web/header.jsp" />
	<jsp:include page="/common/web/menubar.jsp" />
	<!-- CONTENT -->
	<div class="container-fluid main">
		<div class="container">
			<div class="content">
				<div class="header-content d-flex justify-content-center">DANH
					SÁCH ĐƠN ĐẶT HÀNG CỦA NHÂN VIÊN</div>
				<div class="original-info d-flex justify-content-center">

					<div class=" mg-0-40">
						Ngày: <span id="date-now"></span>
					</div>
					<div class=" mg-0-40">
						Thời gian: <span id="current-time"></span>

					</div>
				</div>


				<table class="table table-striped datatable shadow-box bg-white">
					<thead>
						<tr>
							<th scope="row">ID</th>
							<th scope="row">Mã khách hàng</th>
							<th scope="row">Ngày xác nhận</th>
							<th scope="row">Nhân viên xác nhận</th>
							<th scope="row">Trạng thái đơn hàng</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="ddh" items="${list}">
							<tr>
								<th scope="row">${ddh.id }</th>
								<td>${ddh.khThucHien}</td>
								<td>${ddh.ngayThucHien}</td>
								<td>${ddh.nvThucHien}</td>
								<td>Trạng thái ${ddh.tinhTrang}: <c:choose>
										<c:when test="${ddh.tinhTrang == 1}">
												Đã xác nhận đơn hàng
												</c:when>
										<c:when test="${ddh.tinhTrang == 2}">
												Đang chuẩn bi hàng
												</c:when>
										<c:when test="${ddh.tinhTrang == 3}">
												Đang giao hàng
												</c:when>

										<c:when test="${ddh.tinhTrang >= 4}">
												Giao hàng thành công
												</c:when>

										<c:when test="${ddh.tinhTrang == -1}">
												Đã hủy
												</c:when>
										<c:otherwise>
												Đổi trả
												</c:otherwise>
									</c:choose></td>


								<td>


									<div class="">
										<a style="font-size: 10px;" class="btn btn-primary"
											href="ddh.htm?linkView&id=${ddh.id}"> XEM </a>
									</div>
								</td>
								<c:if test="${ddh.tinhTrang !=-1 && ddh.tinhTrang <4}">
									<td>
										<div class="">


											<!-- del -->


											<div class="row">
												<button name="btnxoa" type="button" class="btn btn-primary"
													data-toggle="modal" data-target="#n-${ddh.id}">
													<c:choose>

														<c:when test="${ddh.tinhTrang == 1}">
												 Chuyển sang
													 chuẩn bị hàng</a>
														</c:when>
														<c:when test="${ddh.tinhTrang == 2}">
												Chuyển sang
													 giao hàng</a>
														</c:when>

														<c:when test="${ddh.tinhTrang == 3}">
												 Chuyển sang
													Giao hàng thành công</a>
														</c:when>

													</c:choose>



												</button>

											</div>
											<!-- Modal -->
											<div class="modal fade" id="n-${ddh.id}" tabindex="-1"
												role="dialog" aria-labelledby="exampleModalLabel"
												aria-hidden="true">
												<div class="modal-dialog" role="document">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="exampleModalLabel">!!!</h5>
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">Bạn có chắc muốn tiếp tục
															đổi trạng thái</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-secondary"
																data-dismiss="modal">Thoát</button>
															<!-- nut xoa -->
															<a href="ddh.htm?linkXacNhan&id=${ddh.id}">
																<button name="btnXOA" id="#exampleModal2" type="button"
																	class="btn btn-warning">Đồng ý</button>
															</a>
														</div>
													</div>
												</div>
											</div>

											<!-- end del  -->
										</div>
									</td>
								</c:if>
								<td></td>
								<td><c:if test="${ddh.tinhTrang <4 && ddh.tinhTrang >0}">
										<%-- <a style="font-size: 10px;" class="btn btn-primary"
											href="ddh.htm?linkHuy&id=${ddh.id}"> Hủy ĐH</a> --%>



										<!-- del -->


										<div class="row">
											<button name="btnxoa" type="button" class="btn btn-warning"
												data-toggle="modal" data-target="#n-${ddh.id}">Hủy
												Đơn</button>

										</div>
										<!-- Modal -->
										<div class="modal fade" id="n-${ddh.id}" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel"
											aria-hidden="true">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLabel">!!!</h5>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">Bạn có chắc muốn tiếp tục hủy
														đơn</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-dismiss="modal">Thoát</button>
														<!-- nut xoa -->
														<a href="ddh.htm?linkHuy&id=${ddh.id}">
															<button name="btnXOA" id="#exampleModal2" type="button"
																class="btn btn-warning">Đồng ý</button>
														</a>
													</div>
												</div>
											</div>
										</div>

										<!-- end del  -->
									</c:if></td>
								<td></td>

							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>

		</div>
	</div>

	<jsp:include page="/common/web/footer.jsp" />
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="<c:url value='/template/web/scipts.js'/>"></script>


</body>
</html>