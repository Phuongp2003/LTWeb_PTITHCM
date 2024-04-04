<%@ page pageEncoding="UTF-8"%>
<style>
	ul {
		list-style: none;
	}
	
	a {
		text-decoration: none;
		color: white;
	}
	
	.footer {
		margin-top: 5rem;
		position: relative;
	}
	
	.footer-bg {
		background-color: #09182e;
		z-index: 1;
		position: absolute;
		height: 100%;
	}
	
	.footer .navbar-nav {
		z-index: 2;
	}
	
	.footer .nav-link {
		color: white;
	}
	
	.footer-copyright {
		padding-top: 1rem;
		z-index: 2;
		position: absolute;
		width: 100%;
		text-align: center;
		color: white;
		background-color: gray;
	}
</style>

<div class="footer">
	<div class="footer-bg w-100"></div>
	<nav class="navbar navbar-expand-lg footer-redictlink">
		<div class="container-fluid" style="width: 65%">
			<div class="navbar-nav">
				<ul>
					<li>
						<div class="nav-link fw-bold fs-4">Thông Tin Liên Hệ</div>
					</li>
					<li>
						<div class="nav-link">Phone: 0123 456 789</div>
					</li>
					<li>
						<div class="nav-link">Email: vergency.contact@gmail.com</div>
					</li>
				</ul>
				<ul>
					<li>
						<div class="nav-link fw-bold fs-4">Chính Sách Hỗ Trợ</div>
					</li>
					<li>
						<div class="nav-link"><a href="#">Tìm kiếm</a></div>
					</li>
					<li>
						<div class="nav-link"><a href="#">Giới thiệu</a></div>
					</li>
					<li>
						<div class="nav-link"><a href="#">Chính sách</a></div>
					</li>
					<li>
						<div class="nav-link"><a href="#">Điều khoản dịch vụ</a></div>
					</li>
				</ul>
				<ul>
					<li>
						<div class="nav-link fw-bold fs-4">Thông Tin Liên Kết</div>
					</li>
					<li>
						<div class="nav-link">Hãy kết nối với chúng tôi</div>
					</li>
					<li>
						<div class="nav-link"><a href="#"><i class="bi bi-facebook"></i></a></div>
						<div class="nav-link"><a href="#"><i class="bi bi-instagram"></i></a></div>
					</li>
					<!-- <li><div class="nav-link"></div></li> -->
				</ul>
			</div>
		</div>
	</nav>
	<div class="footer-copyright">
		<p>©Bản quyền thuộc về VERGENCY.</p>
	</div>
</div>
