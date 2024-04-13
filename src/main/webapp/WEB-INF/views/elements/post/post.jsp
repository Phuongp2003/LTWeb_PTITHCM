<style>
	.forum-post .post {
		width: 220px;
		min-width: 220px;
		margin: 3px calc(20px / 3);
		border: brown;
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
	
	<div class="post w-100">
		<div class="post-head">
			<div class="post-title fs-4">
				${post.title}
			</div>
			<div class="post-author fs-6">${post.author}</div>
		</div>
		<div class="post-content fs-5">${post.content}</div>
	</div>
	
</div>
