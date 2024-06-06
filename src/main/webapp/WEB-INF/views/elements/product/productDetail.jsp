<%@ page pageEncoding="UTF-8" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
	<style>
		.product-detail .wrapper {
			margin-bottom: 0.5rem;
		}

		.product-detail .group-input {
			display: flex;
		}

		.product-detail .input {
			height: 2.5rem;
			width: 4rem;
			color: black;
			background-color: white;
			border: 1px solid rgb(166, 166, 176);
			border-radius: 4px;
		}
		.feedback-card{
			margin-top: 1rem;
		}
	</style>

			<div class="product-detail container-fluid" style="width: 80%;">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="home.htm">Trang chủ</a></li>
						<li class="breadcrumb-item"><a
								href="shop/typebook/${book.typebook.MATL}.htm">${book.typebook.TENTL}</a>
						</li>
						<li class="breadcrumb-item active" aria-current="page">${book.TENSACH}</li>
					</ol>
				</nav>
				<div class="row">
					<div class="col-lg-6 col-md-6 col-sm-12 col-xs-6 pd5">
						<div class="card">
							<img src="https://salt.tikicdn.com/cache/750x750/ts/product/6f/c4/48/574854f032ae36fc0d0a57b61f588965.jpg.webp"
								class="card-img-top" alt="...">
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-12 col-xs-6 pd5">
						<div class="card">
							<div class="card-body">

								<h5 class="card-title">${book.TENSACH}</h5>
								<p class="card-text">Tác giả: ${book.author.HO} ${book.author.TEN}</p>
								<p class="card-text">
									<fmt:formatNumber value="${book.GIA}" type="currency" currencySymbol="đ"
										maxFractionDigits="0" />
								</p>

								<div class="wrapper">
									<label>Số lượng</label>
									<div class="group-input">
										<button class="btn btn-outline-secondary" type="button"
											onclick="adjustQuantity(false)"><i class="bi bi-dash"></i></button>


										<input type="text" value="1" class="input" id="quantity-input">
										<button class="btn btn-outline-secondary" type="button"
											onclick="adjustQuantity(true)"><i class="bi bi-plus"></i></button>
									</div>
								</div>

								<a href="#" class="btn btn-danger">Mua ngay</a>
								<div>
									<form:form action="cart/add-cart-detail.htm" modelAttribute="detail">
										<!-- <input type="hidden" name="IDGH" value="${book.MASACH}"> -->
										<input type="hidden" name="MASACH" value="${book.MASACH}">
										<input type="hidden" name="DONGIA" value="${book.GIA}">
										<input type="hidden" id="form-quantity" name="SOLUONG" value="1">
										<button type="submit" class="btn btn-primary">Thêm vào giỏ</button>
									</form:form>

								</div>


							</div>

		<div class="feedback-card card mb-3">
			<div class="row g-0">
				<div class="col-md-4">
					<h5 class="card-title">Khách Hàng Đánh Giá</h5>
					<p class="general-VOTE card-text">Tổng quan: 4.5 <i class="bi bi-star-fill" style = "color:#FFDB00;"></i></p>
				</div>
				<div class="col-md-8">
					<h5 class="card-title">Chi Tiết</h5>
					<c:forEach var="f" items="${feedback}">
						<div class="card-body">
							<h5 class="card-title">${f.customer.HO} ${f.customer.TEN}</h5>
							<p class="card-text"><small class="text-body-secondary">Đánh giá vào: ${f.THOIGIAN}</small></p>
							<div class="star-detail">
								<c:choose>
									<c:when test="${f.VOTE == 1}">
										<i class="bi bi-star-fill" style = "color:#FFDB00;"></i>
									</c:when>
									<c:when test="${f.VOTE == 2}">
										<i class="bi bi-star-fill" style = "color:#FFDB00;"></i><i class="bi bi-star-fill" style = "color:#FFDB00;"></i>
									</c:when>
									<c:when test="${f.VOTE == 3}">
										<i class="bi bi-star-fill" style = "color:#FFDB00;"></i><i class="bi bi-star-fill" style = "color:#FFDB00;"></i><i class="bi bi-star-fill" style = "color:#FFDB00;"></i>
									</c:when>
									<c:when test="${f.VOTE == 4}">
										<i class="bi bi-star-fill" style = "color:#FFDB00;"></i><i class="bi bi-star-fill" style = "color:#FFDB00;"></i><i class="bi bi-star-fill" style = "color:#FFDB00;"></i>
										<i class="bi bi-star-fill" style = "color:#FFDB00;"></i>
									</c:when>
									<c:when test="${f.VOTE == 5}">
										<i class="bi bi-star-fill" style = "color:#FFDB00;"></i><i class="bi bi-star-fill" style = "color:#FFDB00;"></i><i class="bi bi-star-fill" style = "color:#FFDB00;"></i>
										<i class="bi bi-star-fill" style = "color:#FFDB00;"></i><i class="bi bi-star-fill" style = "color:#FFDB00;"></i>
									</c:when>
								</c:choose>
							</div>
							<p class="card-text">${f.NOIDUNG}</p>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
              
<script>
				function adjustQuantity(increment) {
					var quantityInput = document.getElementById('quantity-input');
					var currentQuantity = parseInt(quantityInput.value);
					if (increment) {
						quantityInput.value = currentQuantity + 1;
					} else if (currentQuantity > 1) { // Prevents quantity from going below 1
						quantityInput.value = currentQuantity - 1;
					}
					updateCart();
				}
				function updateCart() {
					var quantityInput = document.getElementById('quantity-input');
					var formQuantityInput = document.getElementById('form-quantity'); // Lấy thẻ input form-quantity
					formQuantityInput.value = quantityInput.value; // Gán giá trị từ quantity-input cho form-quantity
				}

	</script>
