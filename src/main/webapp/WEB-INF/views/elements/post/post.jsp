<%@ page pageEncoding="UTF-8"%>

<style>
	.forum-post {
		padding-top: 20px;
	}
	
	.forum-post .post {
		border: black 1px solid;
		border-radius: 5px;
	}
	
	.forum-post .post .post-head {
		border-bottom: black 1px solid;
		border-radius: 5px;
	}
	
	.forum-post .post .post-content {
		padding: 5px 0px;
	}
</style>

<div class="forum-post container-fluid w-75">
	<div class="post w-100">
		<div class="post-head">
			<div class="post-title fs-4 fw-bold">
				${post.title}
			</div>
			<a href="user/${post.author.getAccount().getID()}.htm" class="post-author fs-6">${post.author.getFullname()}</a>
		</div>
		<div class="post-content fs-5">${post.content}</div>
	</div>
	
</div>

<script>
	$(document).ready(function() {
		$('.post-element-controller').remove();
		$('.row-element-controller').remove();
		$('.ctextarea').attr('contenteditable', 'false');
	})
</script>
