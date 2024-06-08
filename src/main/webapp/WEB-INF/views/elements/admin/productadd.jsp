<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<style>
	.product-add .form-select, .product-add .form-control{
		width: 60%;
	}
</style>

<div class="product-add d-flex gap-3 container-fluid mt-2" style="width: 60%;">
	<div>
		<form:form method="POST" action="admin/product/add-product.htm" modelAttribute="product" enctype="multipart/form-data">
			<div class="product-name d-flex gap-5 mb-2">
				<form:label path="TENSACH">Tên: </form:label>
				<form:input path="TENSACH" class="form-control" required="required"/>
			</div>
			<div class="product-republish d-flex gap-5 mb-2">
				<form:label path="LANTAIBAN">Lần tái bản: </form:label>
				<form:input path="LANTAIBAN" type="number" min="1" class="form-control" required="required"/>
			</div>
			<div class="product-price d-flex gap-5 mb-2">
				<form:label path="GIA">Giá: </form:label>
				<form:input path="GIA" type="number" step="0.1" min="0" class="form-control" required="required"/>
			</div>
			<div class="product-type d-flex gap-5 mb-2">
				<label>Thể loại: </label>
				<form:select path="typebook.MATL" class="form-select">
					<c:forEach var="type" items="${categoryPick}">
						<form:option value="${type.MATL}"><c:out value="${type.TENTL}"/></form:option>
					</c:forEach>
				</form:select>
				
			</div>
			<div class="product-author d-flex gap-5 mb-2">
				<label>Tác giả: </label>
				<form:select path="author.MATG" class="form-select">
					<c:forEach var="author" items="${authorPick}">
						<form:option value="${author.MATG}"><c:out value="${author.HO} ${author.TEN}"/></form:option>
					</c:forEach>
				</form:select>
			</div>
			<div class="product-supplier d-flex gap-5 mb-2">
				<label>Nhà cung cấp: </label>
				<form:select path="supplier.MANCC" class="form-select">
					<c:forEach var="supplier" items="${supplierPick}">
						<form:option value="${supplier.MANCC}"><c:out value="${supplier.TENNCC}"/></form:option>
					</c:forEach>
				</form:select>
			</div>
			<div class="product-nxb d-flex gap-5 mb-2">
				<label>Nhà xuất bản: </label>
				<form:select path="producer.MANXB" class="form-select">
					<c:forEach var="p" items="${producerPick}">
						<form:option value="${p.MANXB}"><c:out value="${p.TENNXB}"/></form:option>
					</c:forEach>
				</form:select>
			</div>
			<div class="product-img d-flex gap-5 mb-2">
				<form:label path="ANH">Ảnh: </form:label>
				<input type="file" name="file" placeholder="Upload image" class="form-control" accept=".jpg,.gif,.png,.pdf">
				<!-- <img id="img" class="rounded" src="resources/imgs/ptitlogo.png" > -->
			</div>
			<button class="btn btn-primary" type="submit">Save</button>
		</form:form>
	</div>
	<div class="d-grid align-content-center gap-3 mt-5">
		<button class="btn btn-secondary" data-toggle="modal" data-target="#addCategoryModal">Thêm thể loại mới</button>
		<button class="btn btn-secondary" data-toggle="modal" data-target="#addAuthorModal">Thêm tác giả mới</button>
		<button class="btn btn-secondary" data-toggle="modal" data-target="#addSupplierModal">Thêm nhà cung cấp mới</button>
		<button class="btn btn-secondary" data-toggle="modal" data-target="#addProducerModal">Thêm nhà xuất bản mới</button>
	</div>
</div>

<div class="modal fade" id="addCategoryModal" tabindex="-1" role="dialog" aria-labelledby="addCategoryModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addCategoryModalLabel">Thêm thể loại mới</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="POST" action="admin/product/add-category.htm">
                    <div class="form-group">
                        <label for="categoryName">Tên thể loại</label>
                        <input type="text" class="form-control" id="categoryName" name="TENTL" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Save</button>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addAuthorModal" tabindex="-1" role="dialog" aria-labelledby="addAuthorModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addAuthorModalLabel">Thêm tác giả mới</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="POST" action="admin/product/add-author.htm">
                    <div class="form-group">
                        <label for="authorLastName">Họ</label>
                        <input type="text" class="form-control" id="authorLastName" name="HO" required>
                    </div>
                    <div class="form-group">
                        <label for="authorFirstName">Tên</label>
                        <input type="text" class="form-control" id="authorFirstName" name="TEN" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Save</button>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addSupplierModal" tabindex="-1" role="dialog" aria-labelledby="addSupplierModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addSupplierModalLabel">Thêm nhà cung cấp mới</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="POST" action="admin/product/add-supplier.htm">
                    <div class="form-group">
                        <label for="supplierName">Tên nhà cung cấp</label>
                        <input type="text" class="form-control" id="categoryName" name="TENNCC" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Save</button>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addProducerModal" tabindex="-1" role="dialog" aria-labelledby="addProducerModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addProducerModalLabel">Thêm nhà xuất bản mới</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="POST" action="admin/category/add-category.htm">
                    <div class="form-group">
                        <label for="producerName">Tên nhà xuất bản</label>
                        <input type="text" class="form-control" id="producerName" name="producerName" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Save</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>