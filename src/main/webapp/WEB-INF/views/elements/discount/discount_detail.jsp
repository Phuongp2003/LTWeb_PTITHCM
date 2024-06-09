<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page pageEncoding="UTF-8"%>
<style>
	.discount-list {
		border-top: brown;
		border-top-style: solid;
		border-top-width: 2px;
		padding-top: 20px;
	}
	
	.discount-list .discount-list {
		border: brown;
		border-style: solid;
		border-width: .5px;
		padding: 20px 10px;
	}
	
	.discount-list .discount {
		width: 220px;
		min-width: 220px;
		margin: 3px calc(20px / 3);
		border: brown;
		border-style: solid;
		border-width: .5px;
		padding-top: 20px;
	}
	
	.discount-list .discount .discount-head {
		margin-bottom: 10px;
		border-bottom: .3px brown solid;
	}
	
	.discount-list .card-body {
		width: 100%;
	}
	
	@media (max-width: 400px) {
		.discount-list .discount-list {
			padding: 0;
		}
		
		.discount-list .discount {
			margin: 0 0;
			margin-bottom: 10px;
			border: none;
			border-top: solid .5px brown;
			
		}
		
		.discount-list .discount:last-child {
			margin-bottom: 0;
		}
		
	}
</style>

<div class="discount-list container-fluid w-75">
	<div class="discount-group">
		<div class="discount-list row">
			<div class="discount col">
				<div class="discount-head">
					<div class="discount-title fs-4">
						<a href="discount/${discount.MAKM}.htm">
							${discount.TENKM}
						</a>
					</div>
					<p>
						Giảm giá áp dụng cho các sản phẩm dưới đây từ <span class="discount-start fs-6">${discount.NGAYBD}</span>
						đến
						<span class="discount-end fs-6">${discount.NGAYKT}</span>
					</p>
				</div>
				<div class="discount-book row">
					<c:forEach var="dd" items="${discountd}">
						<div class="card col-4">
							<div class="card-body">
								<h5 class="card-title">${dd.discountdetail_book.TENSACH} (giảm giá ${dd.TYLE}%)</h5>
								<p class="card-text">Tác giả: ${dd.discountdetail_book.author.HO} ${dd.discountdetail_book.author.TEN}</p>
								<img src="https://salt.tikicdn.com/cache/750x750/ts/product/6f/c4/48/574854f032ae36fc0d0a57b61f588965.jpg.webp" class="card-img-top" alt="...">
								<p class="card-text">
									<fmt:formatNumber value="${book.GIA}" type="currency" currencySymbol="đ" maxFractionDigits="0" />
								</p>
								
								<div class="wrapper">
									<label>Số lượng</label>
									<div class="group-input">
										<button class="btn btn-outline-secondary" type="button" onclick="adjustQuantity(false)"><i class="bi bi-dash"></i></button>
										
										
										<input type="text" value="1" class="input" id="quantity-input">
										<button class="btn btn-outline-secondary" type="button" onclick="adjustQuantity(true)"><i class="bi bi-plus"></i></button>
									</div>
								</div>
								<a href="#" class="btn btn-danger">Mua ngay</a>
								<div>
									<form:form action="cart/add-cart-detail.htm" modelAttribute="detail">
										<!-- <input type="hidden" name="IDGH" value="${book.MASACH}"> -->
										<input type="hidden" name="MASACH" value="${dd.discountdetail_book.MASACH}">
										<input type="hidden" name="DONGIA" value="${dd.discountdetail_book.GIA}">
										<input type="hidden" id="form-quantity" name="SOLUONG" value="1">
										<button type="submit" class="btn btn-primary">Thêm vào giỏ</button>
									</form:form>
									
								</div>
								
								
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>
