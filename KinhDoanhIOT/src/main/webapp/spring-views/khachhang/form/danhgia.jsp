<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<jsp:include page="/common/webKH/head.jsp" />
</head>

<body>

	<div style="margin-top: 2%; border-style: groove;"
		class="container card">
		<div class="card-header">
		</div>
		<form class="review-form">
			<h2>Đánh giá sản phẩm</h2>
			<div class="form-group">
				<label for="name">Họ tên:</label> <input type="text" id="name"
					name="name" required>
			</div>
			<div class="form-group">
				<label for="email">Email:</label> <input type="email" id="email"
					name="email" required>
			</div>
			<div class="form-group">
				<label for="rating">Đánh giá:</label> <select id="rating"
					name="rating" required>
					<option value="" disabled selected>Chọn đánh giá</option>
					<option value="5">Tuyệt vời</option>
					<option value="4">Rất tốt</option>
					<option value="3">Bình thường</option>
					<option value="2">Không tốt</option>
					<option value="1">Tệ</option>
				</select>
			</div>
			<div class="form-group">
				<label for="comment">Nhận xét:</label>
				<textarea id="comment" name="comment" rows="5" required></textarea>
			</div>
			<button type="submit">Gửi đánh giá</button>
		</form>


	</div>

	<script src="<c:url value='/template/admin/validation.js'/>"></script>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			// Mong muốn của chúng ta
			Validator({
				form : '#form-1',
				formGroupSelector : '.form-group',
				errorSelector : '.form-message',
				rules : [
						Validator.isRequired('#fullname',
								'Vui lòng nhập tên đầy đủ của bạn'),
						Validator.isRequired('#diachi',
								'Vui lòng địa chỉ của bạn'),
						Validator.minLength('#cmnd', 9),
						Validator.minLength('#sdt', 10),
						Validator.isDate('#ngaysinh'),

				],
			/*   onSubmit: function (data) {
			      // Call API
			      console.log(data);
			    }  */

			});

		});
	</script>


</body>
</html>