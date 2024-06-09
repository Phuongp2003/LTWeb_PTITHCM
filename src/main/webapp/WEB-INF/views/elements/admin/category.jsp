<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<div class="container-fluid" style="width: 80%;border: Black solid 1px; border-radius: 5px;">
	<table class="category-list table">
		<div class="filter-wrapper row">
			<div class="col-md-10 col-sm-12 col-lg-10">
				<form role="search" action="manage/category/search.htm">
					<input name="searchInput" class="form-control" type="search" placeholder="Tìm thể loại" aria-label="Search" style="width: 50%;">
				</form>
			</div>
			<div class="col-md-2 col-sm-6 col-lg-2">
				<a href="manage/category/add-category.htm"><button type="button" class="btn btn-outline-primary">Thêm thể loại</button></a>
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
					<td>${category.getBooks().size()}</td>
					<td>100.000</td>
					<td>
						<a href="manage/category/${category.MATL}/delete.htm" onclick="return confirm('Bạn có chắc muốn xóa thể loại ${category.TENTL}?')"><button class="btn btn-outline-primary"><i class="bi bi-trash3-fill"></i></button></a>
						<a href="manage/category/${category.MATL}/update.htm"><button class="btn btn-outline-primary"><i class="bi bi-pencil-square"></i></button></a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
