<%@ page pageEncoding="UTF-8"%>
<nav class="admin-nav navbar bg-body-tertiary">
	<div class="container-fluid" style="width:80%">
		<a class="navbar-brand" href="admin/dashboard.htm">Admin Dashboard</a>
		<div class="flex-row-reverse ms-auto justify-content-start">
			<div class="d-flex me-3"><a href="#"><i class="bi bi-person-circle h2"></i></a></div>
		</div>
		<button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
			<div class="offcanvas-header">
				<h5 class="offcanvas-title" id="offcanvasNavbarLabel">Admin</h5>
				<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
			</div>
			<div class="offcanvas-body">
				<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
					<li class="nav-item">
						<a class="nav-link active" aria-current="page" href="admin/dashboard.htm">Dashboard</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="manage/category.htm">Thể loại sách</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="manage/product.htm">Sách</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</nav>
