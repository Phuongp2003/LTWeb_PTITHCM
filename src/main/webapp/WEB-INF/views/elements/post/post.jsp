<%@ page pageEncoding="UTF-8"%>

<div class="forum-post container-fluid w-75">
	
	<div class="post w-100">
		<div class="post-head">
			<div class="post-title fs-4">
				${post.title}
			</div>
			<div class="post-author fs-6">${post.author.getFullname()}</div>
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
