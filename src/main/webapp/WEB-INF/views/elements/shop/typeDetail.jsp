<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<div class="container-fluid shop" style="width: 80%;">
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pd5">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home.htm">Trang chủ</a></li>
					<li class="breadcrumb-item"><a href="shop.htm">Danh mục</a></li>
					<li class="breadcrumb-item active" aria-current="page">${category.TENTL}</li>
				</ol>
			</nav>
		</div>
	</div>
	<div class="collection">
		<div class="row">
			<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
				<div class="card">
					<div class="card-header">
						<h5 class="card-title">Khám phá theo danh mục</h5>
					</div>
					<ul class="list-group list-group-flush">
						<c:forEach var="category" items="${categories}">
							<li class="list-group-item"><a href="shop/typebook/${category.MATL}.htm">${category.TENTL}</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="col-lg-9 col-md-9 col-sm-8 col-xs-12">
				<div class="row">
					<nav class="navbar bg-body-tertiary">
						<div class="container-fluid">
							<h5 class="card-title">${category.TENTL}</h5>
							<form id="ratingForm" class="form-check" action="shop/rating.htm">
								<input name="rating" class="form-check-input" type="checkbox" value="4" id="flexCheckDefault">
								<label class="form-check-label" for="rating4">
									<i class="bi bi-star-fill" style="color:#FFDB00;"></i>
									<i class="bi bi-star-fill" style="color:#FFDB00;"></i>
									<i class="bi bi-star-fill" style="color:#FFDB00;"></i>
									<i class="bi bi-star-fill" style="color:#FFDB00;"></i>
									<i class="bi bi-star" style="color:gainsboro;"></i>
									<span>từ 4 sao</span>
								</label>
							</form>
							<form class="d-flex" role="search" action="shop/search.htm">
								<input name="searchInput" class="form-control me-2" type="search" placeholder="Tìm kiếm sách" aria-label="Search">
								<button name="btn-seach" class="btn btn-outline-success" type="submit"><i class="bi bi-search"></i></button>
							</form>
							<div class="dropdown d-flex">
								<button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
									Sắp xếp theo
								</button>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item active" href="#">Sản phẩm nổi bật</a></li>
									<li><a class="dropdown-item" href="shop/typebook/${category.MATL}/sort-asc.htm">Giá: tăng dần</a></li>
									<li><a class="dropdown-item" href="shop/typebook/${category.MATL}/sort-desc.htm">Giá: giảm dần</a></li>
									<li><a class="dropdown-item" href="#">Bán chạy nhất</a></li>
								</ul>
							</div>
						</div>
					</nav>
				</div>
				<div class="collection-product mt-2">
					<div class="row rounded-2">
						<c:forEach var="book" items="${books}">
							<div class="col-md-4 col-sm-12 col-lg-4">
								<a href="book/${book.MASACH}.htm">
									<div class="card mb-4">
										<img src="resources/imgs/products/${book.ANH}" class="card-img-top" alt="..." height="400">
										<div class="card-body">
											<h5 class="card-text">
												<fmt:formatNumber value="${book.GIA}" type="currency" currencySymbol="đ" maxFractionDigits="0" />
											</h5>
											<p class="card-text text-capitalize fs-6">${book.author.HO} ${book.author.TEN}</p>
											<p class="card-text text-capitalize fs-5" style="height: 3.7rem;">${book.TENSACH}</p>
											
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
												<div class="d-flex gap-3">
													<div class="sold">Đã bán ${book.SOLUONGBAN}/${book.SOLUONGTON}</div>
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
	</div>
</div>
<script>
	document.getElementById('flexCheckDefault').addEventListener('change', function() {
		if (this.checked) {
			document.getElementById('ratingForm').submit();
		}
	});
</script>
