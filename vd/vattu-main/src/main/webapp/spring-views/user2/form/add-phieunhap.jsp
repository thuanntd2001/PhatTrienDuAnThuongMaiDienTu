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
<jsp:include page="/template/cn2/user/head.jsp" />

</head>
<body>

	<!-- ======= Header ======= -->
	<jsp:include page="/template/cn2/user/header.jsp" />

	<!-- End Header -->

	<!-- ======= Sidebar ======= -->
	<jsp:include page="/template/cn2/user/sidebar.jsp" />

	<!-- End Sidebar-->


	  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Nhân viên</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="Kho.html">Kho</a></li>
          <li class="breadcrumb-item"><a href="Donhang.html">Đơn hàng</a></li>
          <li class="breadcrumb-item active">Thêm đơn đặt hàng</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-sm">
          <div class="col-lg-15">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title">Thêm phiếu nhập</h5>



							<form:form action="quanlyphieunhap/cn2/user/add.htm"
							method="post" modelAttribute="px" class="row g-3">
					
							<div class="col-md-5">
								 <label for="inputEmail5" class="form-label">Mã số PN</label>
                        		 <form:input type="text" class="form-control" id="inputEmail5" path="maPN"/>
							</div>
							<div class="col-md-5">
								<label for="inputPassword5" class="form-label">Mã kho</label>
								<input type="text" class="form-control" id="inputPassword5" value="${idkho} " readonly >
							</div>
							<div class="col-md-5">
								<label for="inputPassword5" class="form-label">Mã DDH</label>
								<input type="text" class="form-control" id="inputPassword5" value="${idddh} " readonly />
							</div>




							

							<div class="text-center">
								<button type="submit" class="btn btn-primary">Tạo</button>
								<button type="reset" class="btn btn-secondary">Reset</button>
							</div>
						</form:form>




						</div>
                </div>
              </div>
            </div>


           
      </div>
    </section>

  </main><!-- End #main -->
	<!-- End #main -->
	<jsp:include page="/template/cn2/user/footer.jsp" />


</body>

</html>