<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ page pageEncoding="UTF-8"%>

<div class="post-action container-fluid w-75 d-flex">
	<a href="manage/posts/${post.id}/approve.htm" class="post-approve fs-5" style="margin-right:5px; width: 111px;
"><i class="bi bi-check2-square"></i> Duyệt</a> |
	<a href="#" id="reject-link" class="post-reject fs-5" style="margin-left:5px;"><i class="bi bi-x-square"></i> Từ chối</a>
	<form:form method="POST" action="manage/posts/${post.id}/reject.htm" modelAttribute="post" id="reject-form" style="display: none; margin-left:5px; width: 100%;">
		<button type="submit" class="post-reject fs-5" style="background: none; border: none; padding: 0; color: #007bff; text-decoration: none; cursor: pointer; width: 100px;"><i class="bi bi-x-square"></i> Từ chối</button>
		<div class="reason w-100" style="margin-left:5px;">
			<form:input class="reason-context w-100" path="rejectReason" type="text" placeholder="Lý do từ chối" />
		</div>
	</form:form>
</div>

<script>
	document.getElementById('reject-link').addEventListener('click', function(event) {
		event.preventDefault();
		this.style.display = 'none';
		document.getElementById('reject-form').style.display = 'flex';
	});
</script>
