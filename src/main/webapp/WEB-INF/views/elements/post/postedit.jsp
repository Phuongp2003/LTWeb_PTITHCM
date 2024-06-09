<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<style>
	.forum-post-create {
		border: solid 1px black;
		border-radius: 5px;
		margin-top: 20px;
		padding: 10px 5px;
	}
	
	.forum-post-create .post-input {
		width: 100%;
		display: flex;
		margin-bottom: 5px;
	}
	
	.forum-post-create .form-title-1 {
		width: 20%
	}
	
	.forum-post-create .form-input-1 {
		width: 80%;
	}
</style>

<div class="forum-post-create container-fluid w-75">
	<form:form method="POST" action="forum/post/${post.id}/edit-success.htm" modelAttribute="post">
		<div class="post-title post-input">
			<form:label class="form-title-1" path="title">Title: </form:label>
			<form:input class="form-input-1" path="title" />
		</div>
		<div class="post-description post-input">
			<form:label class="form-title-1" path="description">Description: </form:label>
			<form:input class="form-input-1" path="description" />
		</div>
		<div class="post-controller">
			<button type="button" name="add-element-row" title="Add text-block"><i class="bi bi-plus-square"></i></button>
		</div>
		<form:label path="content">Content: </form:label>
		<div class="post-contents">
			${post.content}</div>
		<div class="mt-2 message-place"> </div>
		<button type="submit">Save</button>
	</form:form>
	<input type="file" id="imageInput" style="display: none;" accept="image/*">
</div>

<jsp:include page="script_post_edit.jsp" />
