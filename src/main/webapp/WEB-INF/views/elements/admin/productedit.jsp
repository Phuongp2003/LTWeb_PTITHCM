<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<style>
  .product-add .form-select,
  .product-add .form-control {
    width: 50%;
  }
</style>

<div class="product-add container-fluid mt-2" style="width: 50%;">
  <form:form method="POST" action="manage/product/${MASACH}/update.htm" modelAttribute="product" enctype="multipart/form-data">
    <div class="product-name d-flex gap-5 mb-2">
      <form:label path="TENSACH">Tên: </form:label>
      <form:input path="TENSACH" class="form-control" />
      <form:errors path="TENSACH" class="fst-italic text-danger" />
    </div>
    <div class="product-republish d-flex gap-5 mb-2">
      <form:label path="LANTAIBAN">Lần tái bản: </form:label>
      <form:input path="LANTAIBAN" type="number" min="1" class="form-control" />
      <form:errors path="LANTAIBAN" class="fst-italic text-danger" />
    </div>
    <div class="product-price d-flex gap-5 mb-2">
      <form:label path="GIA">Giá: </form:label>
      <form:input path="GIA" type="number" step="1" min="0" class="form-control" />
      <form:errors path="GIA" class="fst-italic text-danger" />
    </div>
    <div class="product-type d-flex gap-5 mb-2">
      <label>Thể loại: </label>
      <form:select path="typebook.MATL" class="form-select">
        <c:forEach var="type" items="${categoryPick}">
          <form:option value="${type.MATL}">
            <c:out value="${type.TENTL}" />
          </form:option>
        </c:forEach>
      </form:select>

    </div>
    <div class="product-author d-flex gap-5 mb-2">
      <label>Tác giả: </label>
      <form:select path="author.MATG" class="form-select">
        <c:forEach var="author" items="${authorPick}">
          <form:option value="${author.MATG}">
            <c:out value="${author.HO} ${author.TEN}" />
          </form:option>
        </c:forEach>
      </form:select>
    </div>
    <div class="product-supplier d-flex gap-5 mb-2">
      <label>Nhà cung cấp: </label>
      <form:select path="supplier.MANCC" class="form-select">
        <c:forEach var="supplier" items="${supplierPick}">
          <form:option value="${supplier.MANCC}">
            <c:out value="${supplier.TENNCC}" />
          </form:option>
        </c:forEach>
      </form:select>
    </div>
    <div class="product-republish d-flex gap-5 mb-2">
      <form:label path="SOLUONGTON">Số lượng tồn: </form:label>
      <form:input path="SOLUONGTON" type="number" min="1" class="form-control" />
      <form:errors path="SOLUONGTON" class="fst-italic text-danger" />
    </div>
    <div class="product-nxb d-flex gap-5 mb-2">
      <label>Nhà xuất bản: </label>
      <form:select path="producer.MANXB" class="form-select">
        <c:forEach var="p" items="${producerPick}">
          <form:option value="${p.MANXB}">
            <c:out value="${p.TENNXB}" />
          </form:option>
        </c:forEach>
      </form:select>
    </div>
    <div class="product-img d-flex gap-5 mb-2">
      <form:label path="ANH">Ảnh: </form:label>
      <input type="file" name="file" placeholder="Upload image" class="form-control" accept=".jpg,.gif,.png,.pdf" style="max-height: 2.5rem;" />
      <form:input path="ANH" type="hidden" class="form-control" />
      <img id="img" class="rounded" src="resources/imgs/products/${product.ANH}" style="width: 150px; height: 160px;">
    </div>
    <button class="btn btn-primary" type="submit">Save</button>
  </form:form>
  <a href="manage/product.htm"><button class="btn btn-secondary mt-2">Quay trở về</button></a>
  <div class="mt-2">
    <c:if test="${message == -1}">
      <div class="col-sm-8 alert alert-danger" role="alert">
        Cập nhật thất bại!
        <button type="button" class="rem" data-dismiss="alert" aria-label="Close">&times;</button>
      </div>
    </c:if>
  </div>
</div>