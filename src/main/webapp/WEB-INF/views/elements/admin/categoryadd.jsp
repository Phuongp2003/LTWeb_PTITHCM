<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
    .category-add .form-control {
        width: 30%;
    }
</style>
<div class="category-add container-fluid mt-2" style="width: 80%;">
    <form:form method="POST" action="admin/category/add-category.htm" modelAttribute="category">
        <div class="category-name d-flex gap-5">
            <form:label path="TENTL">Tên: </form:label>
            <form:input path="TENTL" class="form-control"/>
            <form:errors path="TENTL" class="fst-italic text-danger" />
        </div>
        <button class="btn btn-primary mt-2" type="submit">Save</button>
    </form:form>
    <a href="admin/category.htm"><button class="btn btn-secondary mt-2">Quay trở về</button></a>
    <div class="mt-2">
        <c:if test="${message == -1}">
            <div class="col-sm-8 alert alert-danger" role="alert">
                Thêm thất bại!
                <button type="button" class="rem" data-dismiss="alert"
                    aria-label="Close">&times;</button>
            </div>
        </c:if>
    </div>
</div>