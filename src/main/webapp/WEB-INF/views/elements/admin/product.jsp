<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<div class="container-fluid" style="width: 80%;">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
            <li class="breadcrumb-item active" aria-current="page">Danh Mục Sách</li>
        </ol>
    </nav>
    <table class="category-list table">
        <div class="filter-wrapper row">
            <div class="col-md-10 col-sm-12 col-lg-10">
                <form role="search">
                    <input class="form-control" type="search" placeholder="Tìm sách" aria-label="Search" style="width: 50%;">
                </form>
            </div>
            <div class="col-md-2 col-sm-6 col-lg-2">
                <a href="admin/product/add-product.htm"><button type="button" class="btn btn-outline-primary">Thêm sách</button></a>
            </div>
        </div>
        <thead>
            <tr>
                <th scope="col">Sách</th>
                <th scope="col">Lần tái bản</th>
                <th scope="col">Giá</th>
                <th scope="col">Ảnh</th>
                <th scope="col">Thể loại</th>
                <th scope="col">Tác giả</th>
                <th scope="col">Nhà xuất bản</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="book" items="${books}">
                <tr>
                    <td>${book.TENSACH}</td>
                    <td>${book.LANTAIBAN}</td>
                    <td><fmt:formatNumber value="${book.GIA}" type="currency" currencySymbol="đ" maxFractionDigits="0"/></td>
                    <td><img src="files/${book.ANH}" style="width: 200px; height: 230px;"></td>
                    <td>${book.typebook.TENTL}</td>
                    <td>${book.author.HO} ${book.author.TEN}</td>
                    <td>${book.producer.TENNXB}</td>
                    <td>
                        <a href="admin/product/${book.MASACH}/delete.htm" onclick="return confirm('Bạn có chắc muốn xóa sách ${book.TENSACH}?')"><button class="btn btn-outline-primary"><i class="bi bi-trash3-fill"></i></button></a>
						<a href="admin/product/${book.MASACH}/update.htm"><button class="btn btn-outline-primary"><i class="bi bi-pencil-square"></i></button></a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
