<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<base href="${pageContext.servletContext.contextPath}/">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<style>
label {
	font-weight: bold;
}

body {
	background-color: #d7d7d7;
}

.form-message {
	color: red;
}
</style>
<body>
	<div style="margin-top: 10%; width: 500px; hight: 1000px"
		class="container card">
		<div class="card-header">
			<h4>Nhập Thông Tin Loại SP</h4>
		</div>
		<form:form id="form-1" class="card-body"
			action="admin-home/formLoaiSP.htm" modelAttribute="loaisp" method="post">
			<div class="form-group">
				<label>ID Loại SP</label>
				<form:input readonly="true" path="id" />
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label>Tên loại SP</label> <br>
					<form:input maxlength="20" minlength="3" 
						pattern="^[a-zA-Z0-9].{3,40}$" required="true" id="tenLoai"
						path="tenLoai" type="text" />
					<span class="form-message"></span>
				</div>
			</div>





			<div class="card-footer">
				<button class="btn btn-primary" type="submit"
					name="${btnupdate ? 'btnupdate' : 'Insert'}">${btnupdate ? 'Update' : 'Insert'}</button>
				<a style="font-size: 16px; padding: 10px;" class="btn btn-secondary"
					href="admin-home/admin-qlloaisp.htm"> QUAY LẠI </a>

			</div>
		</form:form>
	</div>
	<script src="<c:url value='/template/web/scipts.js'/>"></script>
	<script src="<c:url value='/template/admin/validation.js'/>"></script>

</body>
</html>