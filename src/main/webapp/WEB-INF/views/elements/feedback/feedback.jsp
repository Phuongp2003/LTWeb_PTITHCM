<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="review-product container-fluid" style="width: 80%;">
    <form:form method="POST" action="feedback/${MASACH}/add-feedback.htm" modelAttribute="feedback">
        <div class="feedback-vote d-flex gap-3 mt-2">
			<form:label path="VOTE">Vote: </form:label>
            <form:select path="VOTE" required="required" class="form-select mb-2" style="width: 10%;">
                <form:option value="1">1 <i class="bi bi-star-fill" style = "color:#FFDB00;"></i></form:option>
                <form:option value="2">2 <i class="bi bi-star-fill" style = "color:#FFDB00;"></i></form:option>
                <form:option value="3">3 <i class="bi bi-star-fill" style = "color:#FFDB00;"></i></form:option>
                <form:option value="4">4 <i class="bi bi-star-fill" style = "color:#FFDB00;"></i></form:option>
                <form:option value="5">5 <i class="bi bi-star-fill" style = "color:#FFDB00;"></i></form:option>
            </form:select>
		</div>
        <div class="feedback-description d-flex gap-3">
			<form:label path="NOIDUNG">Mô tả: </form:label>
			<form:textarea path="NOIDUNG" rows="5" cols="80"/>
		</div>
        <div class="d-flex gap-3 mt-2">
            <button class="btn btn-primary" type="submit">Save</button>
            <a href="book/${MASACH}.htm"><button class="btn btn-secondary">Quay lại sản phẩm</button></a>
        </div>
    </form:form>
</div>