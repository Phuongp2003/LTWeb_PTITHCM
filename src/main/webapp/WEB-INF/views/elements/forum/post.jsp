<div class="forum-post container-fluid w-75">
	<div class="post-group">
		<div class="post-group-name">Group1</div>
		<div class="post-list">
			<c:forEach var="post" items="${posts}">
				<div class="post">
					<div class="post-title"> ${post.title}</div>
					<div class="post-content">${post.content}</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
