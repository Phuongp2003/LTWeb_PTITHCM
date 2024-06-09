<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page pageEncoding="UTF-8"%>
<style>
	.forum-post .post-list {
		padding: 20px 10px;
	}
	
	.forum-post .post-link {
		color: black;
		font-weight: 500;
	}
	
	.forum-post .post {
		width: 48.95%;
		min-width: 220px;
		margin: 3px calc(20px / 3);
		border: black;
		border-radius: 5px;
		border-style: solid;
		border-width: .5px;
		padding-top: 20px;
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
	<c:if test="${not empty posts}">
		<div class="post-group">
			<div class="post-list row">
				<c:forEach var="post" items="${posts}">
					<div class="post col-6">
						<div class="post-head">
							<div class="post-title fs-4">
								<a class="post-link" href="forum/post/${post.id}.htm">
									${post.title}
								</a>
							</div>
							<a href="user/${post.author.getAccount().getID()}.htm" class="post-author fs-6">${post.author.getFullname()}</a>
						</div>
						<div class="post-content fs-5">${post.description}</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</c:if>
	<c:if test="${empty posts}">
		<div class="no-post-message alert alert-info">Người dùng này chưa có bài viết nào!</div>
	</c:if>
</div>
