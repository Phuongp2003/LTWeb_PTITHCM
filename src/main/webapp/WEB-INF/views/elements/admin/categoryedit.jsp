<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="category-add container-fluid" style="width: 80%;">
    <form:form method="POST" action="admin/category/${category.MATL}/update/edit-category.htm" modelAttribute="category">
        <div class="category-name">
			<form:label path="TENTL">Tên: </form:label>
			<form:input path="TENTL" required="required"/>
		</div>
        <button type="submit">Save</button>
    </form:form>
</div>