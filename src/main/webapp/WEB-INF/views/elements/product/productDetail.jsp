<%@ page pageEncoding="UTF-8" %>
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
</style>
<div class="product-detail container-fluid" style="width: 80%;">
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="home.htm">Trang chủ</a></li>
			<li class="breadcrumb-item"><a href="shop/typebook/${book.typebook.MATL}.htm">${book.typebook.TENTL}</a></li>
			<li class="breadcrumb-item active" aria-current="page">${book.TENSACH}</li>
		</ol>
	</nav>
	<div class="row">
		<div class="col-lg-6 col-md-6 col-sm-12 col-xs-6 pd5">
			<div class="card">
				<img src="https://salt.tikicdn.com/cache/750x750/ts/product/6f/c4/48/574854f032ae36fc0d0a57b61f588965.jpg.webp" class="card-img-top" alt="...">
			</div>
		</div>
		<div class="col-lg-6 col-md-6 col-sm-12 col-xs-6 pd5">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">${book.TENSACH}</h5>
					<p class="card-text">Tác giả: ${book.author.HO} ${book.author.TEN}</p>
					<p class="card-text">
						<fmt:formatNumber value="${book.GIA}" type="currency" currencySymbol="đ" maxFractionDigits="0" />
					</p>
					<div class="wrapper">
						<label>Số lượng</label>
						<div class="group-input">
							<button class="btn btn-outline-secondary"><i class="bi bi-dash"></i></button>
							<input type="text" value="1" class="input">
							<button class="btn btn-outline-secondary"><i class="bi bi-plus"></i></button>
						</div>
					</div>
					<a href="#" class="btn btn-danger">Mua ngay</a>
					<a href="cart.htm" class="btn btn-primary">Thêm vào giỏ</a>
				</div>
			</div>
		</div>
	</div>
</div>
