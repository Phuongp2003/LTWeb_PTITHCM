<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<div class="container-fluid" style="width: 80%;">
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
			<li class="breadcrumb-item active" aria-current="page">Danh Sách Thể Loại Sách</li>
		</ol>
	</nav>
	<table class="category-list table">
		<div class="filter-wrapper row">
			<div class="col-md-10 col-sm-12 col-lg-10">
				<form role="search">
					<input class="form-control" type="search" placeholder="Tìm thể loại" aria-label="Search" style="width: 50%;">
				</form>
			</div>
			<div class="col-md-2 col-sm-6 col-lg-2">
				<button type="button" class="btn btn-outline-primary">Thêm thể loại</button>
			</div>
		</div>
		<thead>
			<tr>
				<th scope="col">Thể loại</th>
				<th scope="col">Tổng số sách</th>
				<th scope="col">Tổng doanh thu</th>
				<th scope="col">Điều chỉnh</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="category" items="${categories}">
				<tr>
					<td>${category.TENTL}</td>
					<td>3</td>
					<td>100.000</td>
					<td>
						<button class="btn btn-outline-primary"><i class="bi bi-trash3-fill"></i></button>
						<button class="btn btn-outline-primary"><i class="bi bi-pencil-square"></i></button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
