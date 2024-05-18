<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<style>
	.cart-detail .wrapper {
		margin-bottom: 0.5rem;
	}
	
	.cart-detail .group-input {
		display: flex;
	}
	
	.cart-detail .input {
		height: 2.5rem;
		width: 4rem;
		color: black;
		background-color: white;
		border: 1px solid rgb(166, 166, 176);
		border-radius: 4px;
	}
	
	.cart-detail .partcenter {
		display: flex;
		justify-content: space-between;
		
	}
	
	.cart-detail .btn-delete {
		height: 2.5rem;
		width: 4rem;
	}
</style>
<div class="cart-detail container-fluid" style="width: 80%">
	
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item">
				<a href="home.htm">Trang chủ</a>
			</li>
			<li class="breadcrumb-item active" aria-current="page">Giỏ hàng</li>
		</ol>
	</nav>
	<div class="product">
		<div class="row">
			<form:form method="post" action="/bill" modelAttribute="billForm">
				<div class="col-lg-8 col-md-8 col-sm-12">
					<c:forEach var="detail" items="${cartdetail}" varStatus="status">
						<div class="row">
							<div class="col-lg-8 col-md-8 col-sm-12 col-xs-8 pd5">
								<div class="card mb-3">
									<div class="row g-0">
										<div class="col-md-2">
											<img src="https://salt.tikicdn.com/cache/750x750/ts/product/6f/c4/48/574854f032ae36fc0d0a57b61f588965.jpg.webp" class="img-fluid" alt="..." />
										</div>
										<div class="col-md-10">
											<div class="partcenter card-body">
												<div class="content">
													
													<h5 class="card-title">${booksfromcart[status.index].TENSACH}
													</h5>
													<p class="card-text">${detail.DONGIA}</p>
													<div class="wrapper">
														<label>Số lượng</label>
														<div class="group-input">
															<button class="btn btn-outline-secondary">
																<i class="bi bi-dash"></i>
															</button>
															<input type="text" value="${detail.SOLUONG}" class="input" />
															<button class="btn btn-outline-secondary">
																<i class="bi bi-plus"></i>
															</button>
														</div>
													</div>
												</div>
												<a href="#" class="btn-delete btn btn-danger">Xóa sản phẩm</a>
												<div class="form-check">
													<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
													<label class="form-check-label" for="flexCheckDefault">
														Chọn sản phẩm
													</label>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-4 pd5">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">Đơn hàng</h5>
							<p class="card-text">Tổng tiền</p>
							<p class="card-text">300000</p>
							
							<input type="submit" value="Thanh toán" class="btn btn-primary" />
						</div>
					</div>
				</div>
			</form:form>
		</div>
		
		
	</div>
</div>
