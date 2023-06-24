<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<jsp:include page="/common/admin/head.jsp" />
</head>
<body>

	<jsp:include page="/common/admin/header.jsp" />
	<jsp:include page="/common/admin/menubar.jsp" />

	<!-- CONTEND -->
	<div class="row main">

		<div class="container">
			<div class="header-content d-flex justify-content-center">QUẢN
				LÝ SẢN PHẨM</div>
			<h4>${message}</h4>
			<div>
				<a href="/dichvu/admin-home/formSanPham.htm"> <!-- 	<button type="button" class="btn btn-warning">Thêm</button> -->
					<button style="width: 184px; height: 33px; margin-bottom: 5px;"
						type="button" class="btn btn-primary">Thêm Sản Phẩm</button>
				</a> <a href="/dichvu/admin-home/admin-qlnhansanpham.htm"> <!-- 	<button type="button" class="btn btn-warning">Thêm</button> -->
					<button style="width: 184px; height: 33px; margin-bottom: 5px;"
						type="button" class="btn btn-primary">Xem liên kết Nhãn-SP</button>
				</a> <a href="/dichvu/admin-home/admin-qltukhoanhan.htm"> <!-- 	<button type="button" class="btn btn-warning">Thêm</button> -->
					<button style="width: 184px; height: 33px; margin-bottom: 5px;"
						type="button" class="btn btn-primary">Xem liên kết Từ khóa-Nhãn</button>
				</a>


			</div>
			<%-- <jsp:useBean id="pagedListHolder" scope="request"
				type="org.springframework.beans.support.PagedListHolder" /> --%>
			<c:url value="admin-qlthucdon.htm" var="pagedLink">
				<c:param name="p" value="~" />
			</c:url>
			<!-- <form class="input-group" style="margin: 20px 0" method="post">
				<div>
					<input id="search-input" type="search" name="searchInput"
						class="form-control" placeholder="Tìm kiếm" />
				</div>
				<button id="search-button" type="submit" class="btn btn-primary"
					name="btnsearch">
					<i class="fas fa-search"></i>
				</button>
			</form> -->
			<table class="table table-striped shadow-box bg-white">
				<thead>
					<tr>
						<th scope="row">ID</th>
						<th scope="row">Loại</th>
						<th scope="row">Tên</th>
						<th scope="row">Giá</th>
						<th scope="row">SL tồn</th>
						<th scope="row">Hình ảnh</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="th" items="${list}">

						<tr>
							<th scope="row">${th.ID}</th>
							<td>${th.loai}</td>
							<td>${th.ten}</td>
							<td id="tongtien">${th.gia}</td>
							<td>${th.slTon}</td>
							<td><div class="product__item__pic set-bg">
									<img alt=""
										src="<c:url value='/common/images/products/${th.icon}'/>">
								</div></td>


							<td><a
								href="/dichvu/admin-home/formSanPham.htm?linkEdit&id=${th.ID}">
									<button type="button" class="btn btn-primary"
										data-toggle="modal" data-whatever="@mdo">SỬA</button>
							</a></td>
							<%-- <td><a
								href="/dichvu/admin-home/admin-qlsanpham.htm?linkDelete&id=${th.ID}">
									<button type="button" class="btn btn-primary"
										data-toggle="modal" data-whatever="@mdo">Ngừng KD</button>
							</a></td> --%>
							<td>
								<!-- del -->


								<div class="row">
									<button name="btnxoa" type="button" class="btn btn-warning"
										data-toggle="modal" data-target="#n-${th.ID}">Ngừng
									Bán</button>

								</div> <!-- Modal -->
								<div class="modal fade" id="n-${th.ID}" tabindex="-1"
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
											<div class="modal-body">Bạn có chắc muốn tiếp tục</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">Thoát</button>
												<!-- nut xoa -->
												<a
													href="/dichvu/admin-home/admin-qlsanpham.htm?linkDelete&id=${th.ID}">
													<button name="btnXOA" id="#exampleModal2" type="button"
														class="btn btn-warning">Đồng ý</button>
												</a>
											</div>
										</div>
									</div>
								</div> <!-- end del  -->

							</td>
							<td></td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
			<tg:paging pagedLink="${pagedLink}"
				pagedListHolder="${pagedListHolder}"></tg:paging>
		</div>
	</div>
	<jsp:include page="/common/admin/footer.jsp" />



</body>
<script>
const tongTiens = document.querySelectorAll("#tongtien");
tongTiens.forEach(tongTien => {
  const formattedTongTien = Number(tongTien.textContent.replace(/\D/g, '')).toLocaleString('vi-VN', {style: 'currency', currency: 'VND'});
  tongTien.textContent = formattedTongTien;
});
</script>
</html>