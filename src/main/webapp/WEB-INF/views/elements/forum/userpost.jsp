<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page pageEncoding="UTF-8"%>
<style>
	.post-group {
		padding-top: 20px;
	}
	
	.post {
		border: black solid 1px;
		padding: 10px 15px;
		border-radius: 5px;
	}
	
	.forum-post .post-link {
		color: black;
		font-weight: 500;
	}
	
	.forum-post .post-place {
		padding: 10px 5px;
	}
	
	.post-content {
		padding-bottom: 40px;
	}
	
	.post-action {
		bottom: 5px;
	}
	
	@media (max-width: 1255px) {
		.post-place {
			width: 100%;
		}
	}
	
	@media (max-width: 400px) {
		.forum-post .post-list {
			padding: 0;
		}
		
		.forum-post .post {
			margin: 0 0;
			margin-bottom: 10px;
			
		}
		
		.forum-post .post:last-child {
			margin-bottom: 0;
		}
		
	}
</style>

<div class="forum-post container-fluid w-75">
	<div class="post-group">
		<c:if test="${not empty posts}">
			<div class="post-list row">
				<c:forEach var="post" items="${posts}">
					<div class="col-6 post-place">
						<div class="post position-relative">
							<div class="post-head">
								<div class="post-title fs-4">
									<a class="post-link" href="forum/post/${post.id}.htm">
										${post.title}
									</a>
								</div>
								<div class="post-author fs-6">${post.author.getFullname()}</div>
							</div>
							<div class="post-content fs-5">${post.description}</div>
							<div class="post-action position-absolute left-0">
								<div class="post-status fs-5 d-inline">
									<c:choose>
										<c:when test="${not empty post.post_employee}">
											<c:choose>
												<c:when test="${not empty post.rejectReason}">
													<img src="<c:url value='resources/imgs/status-error.svg'/>" width="16" height="16" alt="Status Deny">
												</c:when>
												<c:otherwise>
													<img src="<c:url value='resources/imgs/status-ok.svg'/>" width="16" height="16" alt="Status OK">
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<img src="<c:url value='resources/imgs/status-warn.svg'/>" width="16" height="16" alt="Status Waiting">
										</c:otherwise>
									</c:choose>
								</div>
								<c:if test="${owner != null && owner}">
									|
									<a href="forum/post/${post.id}/edit.htm" class="post-edit fs-5"><i class="bi bi-pen"></i></a> |
									<a href="forum/post/${post.id}/remove.htm" class="post-delete fs-5"><i class="bi bi-trash3"></i></a>
								</c:if>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:if>
		<c:if test="${empty posts}">
			<div class="no-post-message alert alert-info">Người dùng này chưa có bài viết nào!</div>
		</c:if>
	</div>
</div>
