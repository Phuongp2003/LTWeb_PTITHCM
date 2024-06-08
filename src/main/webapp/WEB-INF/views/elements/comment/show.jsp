<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<style>
	.user-comment-action {
		padding: 5px 5px;
		border: brown 2px solid;
		border-radius: 5px;
	}
	.forum-comment {
		border-top: brown;
		border-top-style: solid;
		border-top-width: 2px;
		padding-top: 20px;
	}
	
	.forum-comment .comment-list {
		border-width: .5px;
		padding: 20px 10px;
	}
	
	.forum-comment .comment {
		width: 100%;
		min-width: 100%;
		margin: 3px calc(20px / 3);
		border: brown;
		border-style: solid;
		border-width: .5px;
		padding-top: 20px;
	}
	
	.forum-comment .comment .comment-head {
		margin-bottom: 10px;
		border-bottom: .3px brown solid;
	}

	.user-comment-action {
		display: grid;
		grid-template-rows: 1fr 1fr;
	}

	.user-info {
		display: grid;
		grid-template-columns: 50px 1fr;
		width: 15%;
	}

	.user-comment form {
		display: flex;
		width: 100%;
		position: relative;
		justify-content: space-between;
	}

	.comment-content {
		width: 75%;
		height: 100%;
		border-radius: 2px;		
	}

	.comment-submit {
		width: 10%;
	}

	@media (max-width: 400px) {
		.forum-comment .comment-list {
			padding: 0;
		}
		
		.forum-comment .comment {
			margin: 0 0;
			margin-bottom: 10px;
			border: none;
			border-top: solid .5px brown;
			
		}
		
		.forum-comment .comment:last-child {
			margin-bottom: 0;
		}
		
	}
</style>

<div class="forum-comment container-fluid w-75">
	<div class="comment-group">
		<div class="comment-group-name fs-2">
			<div class="comment-group-name-text">
				<p>Bình luận</p>
			</div>
		</div>
		<div class="user-comment-action container-fluid w-100 fs-4">
			<a href="user/${user_id}" class="user-info">
				<img class="user-img" src="resources/imgs/test1.jsp" class="userImg">
				<div class="user-name">${user_name}</div>
			</a>
			<div class="user-comment">
				<c:if test="${empty comment.id or comment.id == 0}">				
					<form:form method="POST" action="forum/post/${id}/comment/create-success.htm" modelAttribute="comment">						
						<form:label path="content">Nội dung: </form:label>
						<form:input class="comment-content" path="content"/>						
						<button class="comment-submit" type="submit">Gửi</button>
					</form:form>
				</c:if>
				<c:if test="${not empty comment.id and comment.id != 0}">				
					<form:form method="POST" action="forum/post/${id}/comment/${comment.id}/edit-success.htm" modelAttribute="comment">
						<form:label path="content">Nội dung: </form:label>
						<form:input class="comment-content" path="content" />
						<button class="comment-submit" type="submit">Chỉnh sửa</button>
					</form:form>
				</c:if>
			</div>
		</div>
		
		<div class="comment-list row">
			<c:forEach var="comment" items="${comments}">
				<div class="comment col">
					<div class="comment-head">
						<div class="comment-accoount">
							<a href="user/${comment.getAccount().getID()}.htm">
								${comment.getAccount().getUSERNAME()}
							</a>
						</div>
						<div>
							<c:if test="${user_id == comment.getAccount().getID()}">
								<a href="forum/post/${id}/comment/${comment.id}/edit-comment.htm">
									Chỉnh sửa
								</a>
							</c:if>
							
							
						</div>
						<div class="comment-time">
							${comment.getTHOIGIANLAP()}
						</div>
						<div class="comment-content fs-4">					
							${comment.content}
						</div>
					</div>
					
				</div>
			</c:forEach>
		</div>
	</div>
</div>
