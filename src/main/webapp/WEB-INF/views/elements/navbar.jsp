<nav class="navbar navbar-light bg-light fs-3">
	<!-- flex-row-reverse -> đặt từ phải qua -->
	<div class="container-fluid flex-row-reverse mx-auto justify-content-start w-75">
		<div class="d-flex me-3"><a href="${pageContext.request.contextPath}/cart.htm"><i class="bi bi-cart"></i></a></div>
		<div class="d-flex me-3"><a href="#"><i class="bi bi-person"></i></a></div>
		<div class="d-flex me-3"><a href="#"><i class="bi bi-search"></i></a></div>
	</div>
</nav>
<nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top fs-3">
	<div class="container-fluid mx-auto w-75">
		<a class="navbar-brand" href="${pageContext.request.contextPath}/home.htm"> <img src="${pageContext.request.contextPath}/resources/imgs/ptitlogo.png" alt="Navbar Brand" srcset=""> </a>
		<button class="navbar-toggler" type="button" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0 fs-5">
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/shop.htm">SHOP</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/oldbook.htm">OLD BOOK</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/forum.htm">FORUM</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="">ABOUT</a>
				</li>
			</ul>
		</div>
	</div>
</nav>
