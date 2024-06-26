<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page pageEncoding="UTF-8"%>
<style>
	.forum-post {
		padding-top: 20px;
	}
	
	.forum-post .post-list {
		padding: 20px 10px;
	}
	
	.forum-post .post {
		width: 220px;
		min-width: 220px;
		margin: 3px calc(20px / 3);
		border: black;
		border-radius: 5px;
		border-style: solid;
		border-width: .5px;
		padding-top: 20px;
	}
	
	@media (max-width: 1255px) {
		.post-place {
			width: 100%;
		}
	}
	
	.post-content {
		padding-bottom: 10px;
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
	<div class="list-post-title fs-4 fw-bold">Danh sách bài viết chưa duyệt: </div>
	<c:if test="${not empty posts}">
		<div class="post-group">
			<div class="post-list row">
				<c:forEach var="post" items="${posts}">
					<div class="post col position-relative">
						<div class="post-head">
							<div class="post-title fs-4">
								<a href="manage/posts/${post.id}.htm">
									${post.title}
								</a>
							</div>
							<div class="post-author fs-6">${post.author.getFullname()}</div>
						</div>
						<div class="post-content fs-5">${post.description}</div>
					</div>
				</c:forEach>
			</div>
	</c:if>
	<c:if test="${empty posts}">
		<div class="no-post-message alert alert-info">Không có bài viết nào cần duyệt!</div>
	</c:if>
</div>
</div>
