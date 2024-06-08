<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<style>
    .category-add .form-control{
        width:30%;
    }
</style>
<div class="category-add container-fluid mt-2" style="width: 80%;">
    <form:form method="POST" action="admin/category/add-category.htm" modelAttribute="category">
        <div class="category-name d-flex gap-5">
			<form:label path="TENTL">Tên: </form:label>
			<form:input path="TENTL" class="form-control" required="required"/>
            <form:errors path="TENTL"/>
            ${message}
		</div>
        <button class="btn btn-primary" type="submit">Save</button>
    </form:form>
</div>