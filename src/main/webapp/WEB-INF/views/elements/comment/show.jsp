<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<style>
	.user-comment-action {
		padding: 5px 5px;
		border: black 1px solid;
		border-radius: 5px;
	}
	
	.forum-comment {
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
		border: black;
		border-style: solid;
		border-width: .5px;
		padding-top: 20px;
	}
	
	.forum-comment .comment .comment-head {
		margin-bottom: 10px;
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
		padding: 0 10px 1px 10px;
	}
	
	.comment-account {
		position: relative;
	}
	
	.comment-account .comment-account--action {
		display: block;
		width: max-content;
		position: absolute;
		right: 0;
		top: 0;
	}
	
	.comment-content-input {
		width: 75%;
		height: 100%;
		border-radius: 2px;
		border: 1px solid;
		padding: 3px 10px;
	}
	
	.comment-content {
		height: 100%;
		border-radius: 2px;
		border: 1px solid grey;
		padding: 3px 10px;
		margin-top: 10px;
	}
	
	.comment-submit {
		width: 10%;
		border: 1px black solid;
		border-bottom-right-radius: 10px;
		background-color: inherit;
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
		<c:if test="${not empty user_id}">
			<div class="user-comment-action container-fluid w-100 fs-4">
				<div class="user-comment">
					<c:if test="${empty comment.id or comment.id == 0}">
						<form:form method="POST" action="forum/post/${id}/comment/create-success.htm" modelAttribute="comment">
							<form:label path="content">Nội dung: </form:label>
							<form:input class="comment-content-input" path="content" />
							<button class="comment-submit" type="submit"><i class="bi bi-send"></i></button>
						</form:form>
					</c:if>
					<c:if test="${not empty comment.id and comment.id != 0}">
						<form:form method="POST" action="forum/post/${id}/comment/${comment.id}/edit-success.htm" modelAttribute="comment">
							<form:label path="content">Nội dung: </form:label>
							<form:input class="comment-content" path="content" />
							<button class="comment-submit" type="submit"><i class="bi bi-check-lg"></i></button>
						</form:form>
					</c:if>
				</div>
			</div>
		</c:if>
		<div class="comment-list row">
			<c:forEach var="comment" items="${comments}">
				<div class="comment col">
					<div class="comment-head">
						<div class="comment-account">
							<a href="user/${comment.getAccount().getID()}.htm">
								${comment.getAccount().getUSERNAME()}
							</a>
							<div class="comment-account--action">
								<c:if test="${user_id == comment.getAccount().getID()}">
									<a href="forum/post/${id}/comment/${comment.id}/edit-comment.htm">
										<i class="bi bi-pencil-square"></i>
									</a>
								</c:if>
								
							</div>
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
