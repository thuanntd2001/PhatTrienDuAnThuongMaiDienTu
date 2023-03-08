<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>


<div class="sidebar">
	<div class="logo_content">
		<div class="logo">
			<div class="logo_name">Danh Mục Loại Sản Phẩm</div>
		</div>

	</div>
	<ul class="nav_list">
		<c:forEach var="loai" items="${LoaiSPs}">

			<li><a href="khachhangsearch-loai.htm?id=${loai.id}"> <i class="fas fa-table"></i> <span
					class="links_name">${loai.tenLoai}</span>
			</a></li>
		</c:forEach>
	</ul>
</div>


