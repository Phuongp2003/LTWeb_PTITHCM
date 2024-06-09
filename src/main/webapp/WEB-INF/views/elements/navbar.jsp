<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
	<style>
		.cart-icon {
			position: relative;
			display: inline-block;
		}

		.cart-count {
			position: absolute;
			top: -8px;
			right: -8px;
			background-color: red;
			color: white;
			border-radius: 50%;
			padding: 2px 6px;
			font-size: 12px;
			font-weight: bold;
		}
	</style>
	<nav class="navbar navbar-light bg-light fs-3">
		<!-- flex-row-reverse -> đặt từ phải qua -->
		<div class="container-fluid flex-row-reverse mx-auto justify-content-start w-75">

			<!-- <div class="d-flex me-3"><a href="cart/1.htm"><i class="bi bi-cart cart-icon"></i><span
						class="cart-count">1</span></a></div> -->
			<div class="d-flex me-3">
				<a href="cart.htm" class="cart-icon">
					<i class="bi bi-cart"></i>
					<c:if test="${not empty cookie.uid && not empty totalitem}">
						<span class="cart-count">${totalitem}</span>
					</c:if>	
				</a>
			</div>
			<c:if test="${not empty cookie.uid}">
				<div class="d-flex me-3"><a href="user/${cookie.uid.value}.htm"><i class="bi bi-person"></i></a></div>
			</c:if>
			<c:if test="${empty cookie.uid}">
				<div class="d-flex me-3"><a href="user/login.htm"><i class="bi bi-person"></i></a></div>
			</c:if>
			<div class="d-flex me-3"><a href="#"><i class="bi bi-search"></i></a></div>
		</div>
	</nav>
	<nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top fs-3">
		<div class="container-fluid mx-auto w-75">
			<a class="navbar-brand" href="home.htm"> <img src="resources/imgs/ptitlogo.png" alt="Navbar Brand"
					srcset=""> </a>
			<button class="navbar-toggler" type="button" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0 fs-5">
					<li class="nav-item">
						<a class="nav-link" href="shop.htm">SHOP</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="forum.htm">FORUM</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="">ABOUT</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>