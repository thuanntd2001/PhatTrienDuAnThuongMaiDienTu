<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<footer class="bg-light text-center text-lg-start">
	<!-- Copyright -->
	<div class="text-center p-3"
		style="background-color: rgba(0, 0, 0, 0.2);">
		© 2023 Copyright: <a class="text-dark" href="#+">linhkieniot.com</a>
	</div>
	<!-- Copyright -->
</footer>
<script>
function confirmAction() {
  // Tạo một form xác nhận
  var form = document.createElement("form");
  form.id = "confirm-form";
  form.method = "post";
  form.action = "submit-form.php";

  // Thêm các input vào form xác nhận
  var nameInput = document.createElement("input");
  nameInput.type = "hidden";
  nameInput.name = "name";
  nameInput.value = document.getElementById("name").value;
  form.appendChild(nameInput);

  var emailInput = document.createElement("input");
  emailInput.type = "hidden";
  emailInput.name = "email";
  emailInput.value = document.getElementById("email").value;
  form.appendChild(emailInput);

  form.innerHTML += `
    <p>Bạn có chắc muốn submit form này?</p>
    <button type="submit">Có</button>
    <button type="button" onclick="hideForm()">Không</button>
  `;

  // Thêm form vào trang web
  document.body.appendChild(form);

  // Ngăn chặn submit form mặc định
  return false;
}

function hideForm() {
  // Ẩn form xác nhận
  var form = document.getElementById("confirm-form");
  if (form) {
    form.style.display = "none";
  }
}
</script>