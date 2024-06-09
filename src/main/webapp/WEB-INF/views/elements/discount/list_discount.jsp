<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page pageEncoding="UTF-8"%>
<style>
	a {
		text-decoration: none;
	}
	
	.discount-list {
		padding-top: 20px;
	}
	
	.discount-list .discount-list {
		border: black;
		border-style: solid;
		border-width: .5px;
		border-radius: 5px;
		border-top-left-radius: 0;
		padding: 20px 10px;
	}
	
	.discount-list .discount {
		width: 48.95%;
		min-width: 220px;
		margin: 3px calc(20px / 3);
		border: black;
		border-radius: 5px;
		border-style: solid;
		border-width: .5px;
		padding-top: 10px;
		position: relative;
	}
	
	.discount-list .admin-action {
		position: absolute;
		top: 10px;
		right: 10px;
	}
	
	.discount-list .admin-action>* {
		margin: 0 3px;
	}
	
	.discount-list .discount .discount-head {
		margin-bottom: 10px;
	}
	
	@media (max-width: 400px) {
		.discount-list .discount-list {
			padding: 0;
		}
		
		.discount-list .discount {
			margin: 0 0;
			margin-bottom: 10px;
			border: none;
			border-top: solid .5px brown;
			
		}
		
		.discount-list .discount:last-child {
			margin-bottom: 0;
		}
		
	}
</style>

<div class="discount-list container-fluid w-75">
	<a href="manage/discount/add.htm" class="add-discount"><i class="bi bi-plus-square"></i> Thêm khuyến mãi</a>
	<div class="discount-group">
		<div class="discount-list row">
			<c:forEach var="discount" items="${discounts}">
				<div class="discount col-6">
					<div class="admin-action d-flex">
						<a href="manage/discount/${discount.MAKM}/remove.htm" class="delete-discount" title="Xóa khuyến mãi"><i class="bi bi-trash3"></i></a>
						| <a href="manage/discount/${discount.MAKM}/edit.htm" class="edit-discount" title="Sửa đổi khuyến mãi"><i class="bi bi-pen"></i></a>
						| <a href="manage/discount/${discount.MAKM}/apply.htm" class="edit-discount" title="Áp dụng khuyến mãi"><i class="bi bi-check2-all"></i></a>
					</div>
					<div class="discount-head">
						<div class="discount-title fs-4">
							<a href="manage/discount/${discount.MAKM}.htm">
								${discount.TENKM}
							</a>
						</div>
						<p>
							Từ <span class="discount-start fs-6">${discount.NGAYBD}</span>
							đến
							<span class="discount-end fs-6">${discount.NGAYKT}</span>
						</p>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
