<%@ page pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
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
	
	.product-img .card {
		width: 25.2rem;
	}
	
	.feedback-card {
		margin-top: 1rem;
	}
</style>

<div class="product-detail container-fluid" style="width: 85%;">
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="home.htm">Trang chủ</a></li>
			<li class="breadcrumb-item"><a href="shop/typebook/${book.typebook.MATL}.htm">${book.typebook.TENTL}</a>
			</li>
			<li class="breadcrumb-item active" aria-current="page">${book.TENSACH}</li>
		</ol>
	</nav>
	<div class="row">
		<div class="product-img col-lg-4 col-md-4 col-sm-12 col-xs-4 pd5">
			<div class="card">
				<img src="resources/imgs/products/${book.ANH}" class="card-img-top" alt="..." height="400">
			</div>
		</div>
		<div class="grid col-lg-4 col-md-4 col-sm-12 col-xs-4 pd5">
			<div class="">
				<div class="card">
					<div class="card-body">
						<h6 class="card-text text-capitalize fs-5">${book.TENSACH}</h6>
						<p class="card-text text-capitalize fs-6">Tác giả: ${book.author.HO} ${book.author.TEN}</p>
						<div class="d-flex gap-1">
							<div><i class="bi bi-star-fill" style="color:#FFDB00;  "></i><i class="bi bi-star-fill" style="color:#FFDB00;  "></i><i class="bi bi-star-fill" style="color:#FFDB00;  "></i><i class="bi bi-star-fill" style="color:#FFDB00;  "></i></div>
							<div class="star-detail">
								<c:choose>
									<c:when test="${f.VOTE == 1}">
										<i class="bi bi-star-fill" style="color:#FFDB00;  "></i>
									</c:when>
									<c:when test="${f.VOTE == 2}">
										<i class="bi bi-star-fill" style="color:#FFDB00;  "></i><i class="bi bi-star-fill" style="color:#FFDB00;"></i>
									</c:when>
									<c:when test="${f.VOTE == 3}">
										<i class="bi bi-star-fill" style="color:#FFDB00;  "></i><i class="bi bi-star-fill" style="color:#FFDB00;"></i><i class="bi bi-star-fill" style="color:#FFDB00;"></i>
									</c:when>
									<c:when test="${f.VOTE == 4}">
										<i class="bi bi-star-fill" style="color:#FFDB00;  "></i><i class="bi bi-star-fill" style="color:#FFDB00;  "></i><i class="bi bi-star-fill" style="color:#FFDB00;  "></i><i class="bi bi-star-fill" style="color:#FFDB00;  "></i>
									</c:when>
									<c:when test="${f.VOTE == 5}">
										<i class="bi bi-star-fill" style="color:#FFDB00;  "></i><i class="bi bi-star-fill" style="color:#FFDB00;  "></i><i class="bi bi-star-fill" style="color:#FFDB00;  "></i><i class="bi bi-star-fill" style="color:#FFDB00;  "></i><i class="bi bi-star-fill" style="color:#FFDB00;  "></i>
									</c:when>
								</c:choose>
							</div>
							<div class="d-flex gap-3">
								<div class="sold">| Đã bán 10</div>
							</div>
						</div>
						<h4 class="card-text">
							<fmt:formatNumber value="${book.GIA}" type="currency" currencySymbol="đ" maxFractionDigits="0" />
						</h4>
						
						<div class="wrapper">
							<label>Số lượng</label>
							<div class="group-input">
								<button class="btn btn-outline-secondary" type="button" onclick="adjustQuantity(false)"><i class="bi bi-dash"></i></button>
								
								
								<input type="text" value="1" class="input" id="quantity-input">
								<button class="btn btn-outline-secondary" type="button" onclick="adjustQuantity(true)"><i class="bi bi-plus"></i></button>
							</div>
						</div>
						<div class="d-flex gap-3">
							<a href="#" class="btn btn-danger"></a>
							<form:form action="cart/add-cart-detail.htm" modelAttribute="detail">
								<input type="hidden" name="MASACH" value="${book.MASACH}">
								<input type="hidden" name="DONGIA" value="${book.GIA}">
								<input type="hidden" id="form-quantity" name="SOLUONG" value="1">
								<button type="submit" class="btn btn-primary">Thêm vào giỏ</button>
							</form:form>
						</div>
					</div>
					
					<div class="d-flex gap-3">
						<a href="cart.htm" class="btn btn-danger">Mua ngay</a>
						<form:form action="cart/${cmd}-cart-detail.htm" modelAttribute="detail">
							<input type="hidden" name="MASACH" value="${book.MASACH}">
							<input type="hidden" name="DONGIA" value="${book.GIA}">
							<input type="hidden" id="form-quantity" name="SOLUONG" value="1">
							<input type="hidden" name="CHON" value="0">
							<button type="submit" class="btn btn-primary">Thêm vào giỏ</button>
						</form:form>
					</div>
					<p class="card-text">${f.NOIDUNG}</p>
					
				</div>
			</div>
			<div class="mt-4">
				<div class="card">
					<h5 class="card-title text-center p-2">Thông tin chi tiết</h5>
					<ul class="list-group list-group-flush">
						<li class="list-group-item">Nhà cung cấp: <span class=" fw-semibold">${book.supplier.TENNCC}</span></li>
						<li class="list-group-item">Lần tái bản: <span class=" fw-semibold">${book.LANTAIBAN}</span></li>
						<li class="list-group-item">Nhà xuất bản: <span class=" fw-semibold">${book.producer.TENNXB}</span></li>
						<li class="list-group-item">Số lượng tồn: <span class=" fw-semibold">10</span></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-lg-4 col-md-4 col-sm-12 col-xs-4 pd5">
			<div class="card">
				<div class="card-header">
					<h5 class="card-title text-center">Sản phẩm tương tự</h5>
				</div>
				
				<div class="row gap-0">
					<c:forEach var="book" items="${books}">
						<div class="col-md-4 col-sm-12 col-lg-4">
							<a href="book/${book.MASACH}.htm">
								<div class="card mb-2" style="width: 7.7rem;">
									<img src="https://salt.tikicdn.com/cache/750x750/ts/product/6f/c4/48/574854f032ae36fc0d0a57b61f588965.jpg.webp" class="card-img-top" alt="..." style="width:7.5rem;">
									<div class="card-body" style="padding:0px 10px;">
										<h5 class="card-text">
											<fmt:formatNumber value="${book.GIA}" type="currency" currencySymbol="đ" maxFractionDigits="0" />
										</h5>
										<p class="card-text text-capitalize fs-6" style="height: 2.2rem;">${book.TENSACH}</p>
										
										<div class="d-flex justify-content-between">
											<div><i class="bi bi-star-fill" style="color:#FFDB00; font-size: 0.8rem;"></i><i class="bi bi-star-fill" style="color:#FFDB00; font-size: 0.8rem;"></i><i class="bi bi-star-fill" style="color:#FFDB00; font-size: 0.8rem;"></i><i class="bi bi-star-fill" style="color:#FFDB00; font-size: 0.8rem;"></i></div>
											<div class="star-detail">
												<c:choose>
													<c:when test="${f.VOTE == 1}">
														<i class="bi bi-star-fill" style="color:#FFDB00; font-size: 0.8rem;"></i>
													</c:when>
													<c:when test="${f.VOTE == 2}">
														<i class="bi bi-star-fill" style="color:#FFDB00; font-size: 0.8rem;"></i><i class="bi bi-star-fill" style="color:#FFDB00;"></i>
													</c:when>
													<c:when test="${f.VOTE == 3}">
														<i class="bi bi-star-fill" style="color:#FFDB00; font-size: 0.8rem;"></i><i class="bi bi-star-fill" style="color:#FFDB00;"></i><i class="bi bi-star-fill" style="color:#FFDB00;"></i>
													</c:when>
													<c:when test="${f.VOTE == 4}">
														<i class="bi bi-star-fill" style="color:#FFDB00; font-size: 0.8rem;"></i><i class="bi bi-star-fill" style="color:#FFDB00; font-size: 0.8rem;"></i><i class="bi bi-star-fill" style="color:#FFDB00; font-size: 0.8rem;"></i><i class="bi bi-star-fill" style="color:#FFDB00; font-size: 0.8rem;"></i>
													</c:when>
													<c:when test="${f.VOTE == 5}">
														<i class="bi bi-star-fill" style="color:#FFDB00; font-size: 0.8rem;"></i><i class="bi bi-star-fill" style="color:#FFDB00; font-size: 0.8rem;"></i><i class="bi bi-star-fill" style="color:#FFDB00; font-size: 0.8rem;"></i><i class="bi bi-star-fill" style="color:#FFDB00; font-size: 0.8rem;"></i><i class="bi bi-star-fill" style="color:#FFDB00; font-size: 0.8rem;"></i>
													</c:when>
												</c:choose>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>
					</c:forEach>
					
				</div>
			</div>
		</div>
	</div>
	<div class="feedback-card card mb-3">
		<div class="row g-0">
			<div class="col-md-4 border-end border-secondary-subtle">
				<div class="card-header">
					<h5 class="card-title text-center mt-2">Khách hàng đánh giá</h5>
				</div>
				<p class="sum-vote card-text text-center">Tổng quan: ${avgVote} <i class="bi bi-star-fill" style="color:#FFDB00;"></i></p>
				<p class="card-text text-center">(${feedback.size()} đánh giá)</p>
				<div class="review border-top border-secondary-subtle text-center mt-2">
					<h5 class="card-title mt-2">Đánh giá sản phẩm này</h5>
					<p>Chia sẻ cảm nghĩ của bạn với mọi người</p>
					<c:choose>
						<c:when test="${message == 1}">
							<a href="feedback/${MASACH}/edit-feedback.htm"><button class="btn btn-secondary">Chỉnh sửa đánh giá</button></a>
							<a href="feedback/${MASACH}/delete-feedback.htm" onclick="return confirm('Bạn có chắc muốn xóa đánh giá ?')">
								<button class="btn btn-danger">Xóa đánh giá</button></a>
						</c:when>
						<c:when test="${message == 2}">
							<a href="feedback/${MASACH}/add-feedback.htm"><button class="btn btn-secondary">Đánh giá ngay</button></a>
						</c:when>
						<c:otherwise>
							<a href="feedback/${MASACH}/add-feedback.htm"><button class="btn btn-secondary">Đánh giá ngay</button></a>
						</c:otherwise>
					</c:choose>
					
				</div>
			</div>
			<div class="col-md-8">
				<div class="card-header">
					<h5 class="card-title text-center mt-2">Chi tiết</h5>
				</div>
				<c:choose>
					<c:when test="${feedback.size() != 0}">
						<c:forEach var="f" items="${feedback}">
							<div class="card-body border-bottom border-secondary-subtle">
								<h5 class="card-title">${f.customer.HO} ${f.customer.TEN}</h5>
								<p class="card-text"><small class="text-body-secondary">Đánh giá vào:
										${f.THOIGIAN}</small></p>
								<div class="star-detail">
									<c:choose>
										<c:when test="${f.VOTE == 1}">
											<i class="bi bi-star-fill" style="color:#FFDB00;"></i>
										</c:when>
										<c:when test="${f.VOTE == 2}">
											<i class="bi bi-star-fill" style="color:#FFDB00;"></i><i class="bi bi-star-fill" style="color:#FFDB00;"></i>
										</c:when>
										<c:when test="${f.VOTE == 3}">
											<i class="bi bi-star-fill" style="color:#FFDB00;"></i><i class="bi bi-star-fill" style="color:#FFDB00;"></i><i class="bi bi-star-fill" style="color:#FFDB00;"></i>
										</c:when>
										<c:when test="${f.VOTE == 4}">
											<i class="bi bi-star-fill" style="color:#FFDB00;"></i><i class="bi bi-star-fill" style="color:#FFDB00;"></i><i class="bi bi-star-fill" style="color:#FFDB00;"></i><i class="bi bi-star-fill" style="color:#FFDB00;"></i>
										</c:when>
										<c:when test="${f.VOTE == 5}">
											<i class="bi bi-star-fill" style="color:#FFDB00;"></i><i class="bi bi-star-fill" style="color:#FFDB00;"></i><i class="bi bi-star-fill" style="color:#FFDB00;"></i><i class="bi bi-star-fill" style="color:#FFDB00;"></i><i class="bi bi-star-fill" style="color:#FFDB00;"></i>
										</c:when>
									</c:choose>
								</div>
								<p class="card-text">${f.NOIDUNG}</p>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<p>Chưa có đánh giá nào!</p>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<div class="modal fade" id="addToCartModal" tabindex="-1" role="dialog" aria-labelledby="addToCartModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="addToCartModalLabel">Thông báo</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					Sản phẩm đã được thêm vào giỏ hàng thành công!
				</div>
				<div class="modal-footer">
					<a href="cart.htm" class="btn btn-primary">Đi tới giỏ hàng</a>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Thoát</button>
				</div>
			</div>
		</div>
	</div>
	
</div>
<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
<script>
	function showAddToCartPopup(event) {
		event.preventDefault();
		$.ajax({
			type: $(event.target).attr('method'),
			url: $(event.target).attr('action'),
			data: $(event.target).serialize(),
			success: function(response) {
				$('#addToCartModal').modal('show');
			},
			error: function(response) {
				alert('Có lỗi xảy ra. Vui lòng thử lại.');
			}
		});
	}
	
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
