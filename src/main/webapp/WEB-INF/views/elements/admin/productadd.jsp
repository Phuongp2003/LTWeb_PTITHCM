<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="product-add container-fluid" style="width: 80%;">
    <form:form method="POST" action="admin/product/add-product.htm" modelAttribute="product" enctype="multipart/form-data">
        <div class="product-name">
			<form:label path="TENSACH">Tên: </form:label>
			<form:input path="TENSACH" required="required"/>
		</div>
        <div class="product-republish">
			<form:label path="LANTAIBAN">Lần tái bản: </form:label>
			<form:input path="LANTAIBAN" type="number" min="1" required="required"/>
		</div>
        <div class="product-price">
			<form:label path="GIA">Giá: </form:label>
			<form:input path="GIA" type="number" step="0.1" min="0" required="required"/>
		</div>
        <div class="product-img">
			<form:label path="ANH">Ảnh: </form:label>
			<input type="file" name="file" placeholder="Upload image" class="form-control" accept=".jpg,.gif,.png,.pdf">
			<!-- <img id="img" class="rounded" src="resources/imgs/ptitlogo.png" > -->
			
		</div>
        <div class="product-type">
			<form:select path="typebook.MATL" class="form-select mb-6">
				<form:option value="Chọn thể loại"></form:option>
                <c:forEach var="type" items="${categoryPick}">
                    <form:option value="${type.MATL}"><c:out value="${type.TENTL}"/></form:option>
                </c:forEach>
            </form:select>
		</div>
        <div class="product-author">
			<form:select path="author.MATG" class="form-select mb-6">
				<form:option value="Chọn tác giả"></form:option>
                <c:forEach var="author" items="${authorPick}">
                    <form:option value="${author.MATG}"><c:out value="${author.HO} ${author.TEN}"/></form:option>
                </c:forEach>
            </form:select>
		</div>
        <div class="product-nxb">
			<form:select path="producer.MANXB" class="form-select mb-6">
				<form:option value="Chọn nhà xuất bản"></form:option>
				<c:forEach var="p" items="${producerPick}">
					<form:option value="${p.MANXB}"><c:out value="${p.TENNXB}"/></form:option>
				</c:forEach>
			</form:select>
		</div>
        <button type="submit">Save</button>
    </form:form>
</div>