<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<style>
	.forum-post {
		border-top: brown;
		border-top-style: solid;
		border-top-width: 2px;
		padding-top: 20px;
	}
	
	.forum-post .post-list {
		border: brown;
		border-style: solid;
		border-width: .5px;
		padding: 20px 10px;
	}
	
	.forum-post .post {
		width: 220px;
		min-width: 220px;
		margin: 3px calc(20px / 3);
		border: brown;
		border-style: solid;
		border-width: .5px;
		padding-top: 20px;
	}
	
	.post-content {
		padding-bottom: 50px;
	}
	
	.forum-post .post .post-head {
		margin-bottom: 10px;
		border-bottom: .3px brown solid;
	}
	
	@media (max-width: 400px) {
		.forum-post .post-list {
			padding: 0;
		}
		
		.forum-post .post {
			margin: 0 0;
			margin-bottom: 10px;
			border: none;
			border-top: solid .5px brown;
			
		}
		
		.forum-post .post:last-child {
			margin-bottom: 0;
		}
		
	}
</style>

<div class="forum-post container-fluid w-75">
	<div class="post-group">
		<div class="post-group-name fs-2">
			<div class="post-group-name-text">
				<p>Group 1</p>
			</div>
		</div>
		<div class="post-list row">
			<c:forEach var="post" items="${posts}">
				<div class="post col position-relative">
					<div class="post-head">
						<div class="post-title fs-4">
							<a href="forum/post/${post.id}.htm">
								${post.title}
							</a>
						</div>
						<div class="post-author fs-6">${post.author.getFullname()}</div>
					</div>
					<div class="post-content fs-5">${post.description}</div>
					<div class="post-action position-absolute bottom-0 left-0">
						<div class="post-status fs-5 d-inline">
							<c:choose>
								<c:when test="${not empty post.post_employee}">
									<img src="<c:url value='resources/imgs/status-ok.svg'/>" width="16" height="16" alt="Status OK">
								</c:when>
								<c:otherwise>
									<img src="<c:url value='resources/imgs/status-warn.svg'/>" width="16" height="16" alt="Status OK">
								</c:otherwise>
							</c:choose>
						</div> |
						<a href="forum/post/${post.id}/edit.htm" class="post-edit fs-5"><i class="bi bi-pen"></i></a> |
						<a href="forum/post/${post.id}/remove.htm" class="post-delete fs-5"><i class="bi bi-trash3"></i></a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
