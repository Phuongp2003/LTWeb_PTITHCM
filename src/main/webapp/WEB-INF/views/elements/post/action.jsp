<%@ page pageEncoding="UTF-8"%>
<div class="forum-user container-fluid w-75 fs-4 d-flex">
	<div class="message  ${status == 200 ? 'success' : 'fail'}">
		${message}
	</div>
</div>
