<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="forum-post-create container-fluid w-75">
	<!-- <div class="mt-2">
        <c:if test="${message == -1}">
            <div class="col-sm-8 alert alert-danger" role="alert">
                Cập nhật thất bại!
                <button type="button" class="rem" data-dismiss="alert"
                    aria-label="Close">&times;</button>
            </div>
        </c:if>
    </div> -->
	<form:form method="POST" action="forum/post/${post.id}/edit-success.htm" modelAttribute="post">
		<div class="port-title">
			<form:label path="title">Title: </form:label>
			<form:input path="title"/>
			<!-- <form:error path="title" class="fst-italic text-danger"/> -->
		</div>
		<div class="port-description">
			<form:label path="description">Description: </form:label>
			<form:input path="description"/>
			<!-- <form:error path="description" class="fst-italic text-danger"/> -->
		</div>
		<div class="post-controller">
			<button type="button" name="add-element-row" title="Add text-block"><i class="bi bi-plus-square"></i></button>
		</div>
		<form:label path="content">Content: </form:label>
		<div class="post-contents">
			${post.content}</div>
		<button type="submit">Save</button>
	</form:form>
	<input type="file" id="imageInput" style="display: none;" accept="image/*">
</div>

<jsp:include page="script_post_edit.jsp" />
