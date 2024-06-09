<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<style>
    .category-edit .form-control {
        width: 30%;
    }
</style>
<div class="category-edit container-fluid" style="width: 80%;">
    <form:form method="POST" action="manage/category/${category.MATL}/update.htm" modelAttribute="category">
        <div class="category-name">
			<form:label path="TENTL">Tên: </form:label>
			<form:input path="TENTL" class="form-control"/>
            <form:errors path="TENTL" class="fst-italic text-danger"/>
		</div>
        <button class="btn btn-primary mt-2" type="submit">Save</button>
    </form:form>
    <a href="manage/category.htm"><button class="btn btn-secondary mt-2">Quay trở về</button></a>
    <div class="mt-2">
        <c:if test="${message == -1}">
            <div class="col-sm-8 alert alert-danger" role="alert">
                Cập nhật thất bại!
                <button type="button" class="rem" data-dismiss="alert"
                    aria-label="Close">&times;</button>
            </div>
        </c:if>
    </div>
</div>
