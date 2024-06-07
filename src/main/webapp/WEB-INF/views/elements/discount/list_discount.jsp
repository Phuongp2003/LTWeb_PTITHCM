<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page pageEncoding="UTF-8"%>
<style>
	.discount-list {
		border-top: brown;
		border-top-style: solid;
		border-top-width: 2px;
		padding-top: 20px;
	}
	
	.discount-list .discount-list {
		border: brown;
		border-style: solid;
		border-width: .5px;
		padding: 20px 10px;
	}
	
	.discount-list .discount {
		width: 220px;
		min-width: 220px;
		margin: 3px calc(20px / 3);
		border: brown;
		border-style: solid;
		border-width: .5px;
		padding-top: 20px;
	}
	
	.discount-list .discount .discount-head {
		margin-bottom: 10px;
		border-bottom: .3px brown solid;
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
	<a href="discount/add.htm" class="add-discount">Add</a>
	<div class="discount-group">
		<div class="discount-list row">
			<c:forEach var="discount" items="${discounts}">
				<div class="admin-action d-flex">
					<a href="discount/${discount.MAKM}/remove.htm" class="delete-discount">Delete</a>
					<a href="discount/${discount.MAKM}/edit.htm" class="edit-discount">Edit
					</a>
				</div>
				<div class="discount col">
					<div class="discount-head">
						<div class="discount-title fs-4">
							<a href="discount/${discount.MAKM}.htm">
								${discount.TENKM}
							</a>
						</div>
						<p>
							Từ <span class="discount-start fs-6">${discount.NGAYBD}</span>
							đến
							<span class="discount-end fs-6">${discount.NGAYKT}</span>
						</p>
					</div>
					<div class="discount-book"></div>
					<div class="discount-action">
						<a href="/">Use</a>
						<a href="/">Check</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
