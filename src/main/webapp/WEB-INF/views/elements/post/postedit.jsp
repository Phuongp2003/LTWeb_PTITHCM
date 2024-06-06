<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="forum-post-create container-fluid w-75">
	<form:form method="POST" action="forum/post/${post.id}/edit-success.htm" modelAttribute="post">
		<div class="port-title">
			<form:label path="title">Title: </form:label>
			<form:input path="title" />
		</div>
		<div class="port-description">
			<form:label path="description">Description: </form:label>
			<form:input path="description" />
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
