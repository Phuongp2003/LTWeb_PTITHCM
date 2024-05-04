<%@ page pageEncoding="UTF-8"%>
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
	
	.content-row {
		display: flex;
		justify-content: center;
		min-height: 20px;
		border: rgba(17, 0, 250, 0.25) solid 1px;
		position: relative;
	}
	
	.content-row:hover {
		border: blue solid 1px;
	}
	
	.post-content {
		position: relative;
	}
	
	.post-image {
		position: relative;
		display: inline-block;
	}
	
	.post-image img {
		border: 1px solid #ccc;
	}
	
	.post-image .img-size-controller {
		width: 150px;
		margin-right: 5px;
		display: none;
		position: absolute;
	}
	
	.post-text .ctextarea {
		width: 100%;
		border: rgba(17, 0, 250, 0.25) solid 1px;
	}
	
	.post-text .ctextarea:hover {
		border: rgba(blue) solid 1px;
	}
	
	.post-text .ctextarea:active {
		border: rgba(blue) solid 1px;
	}
	
	.post-image .img-size-controller input {
		width: 50%;
		display: inline-block;
	}
	
	.post-content:hover>.row-element-controller {
		display: flex;
	}
	
	.post-element-controller {
		display: none;
		width: max-content;
		position: absolute;
		background-color: rgba(0, 0, 0, 0.5);
		padding: 5px;
		border-radius: 5px;
		z-index: 50;
		flex-direction: column;
		left: 0;
		bottom: -170px;
	}
	
	.post-image .post-element-controller {
		top: 30px
	}
	
	
	.row-element-controller {
		display: none;
		width: max-content;
		position: absolute;
		background-color: rgba(0, 0, 0, 0.5);
		padding: 5px;
		border-radius: 5px;
		z-index: 50;
		flex-direction: column;
		top: -80px;
	}
	
	.row-element-controller button,
	.post-element-controller button {
		margin: 3px;
		padding: 5px 10px;
		background-color: #fff;
		border: none;
		border-radius: 3px;
		cursor: pointer;
	}
	
	.row-element-controller button:hover,
	.post-element-controller button:hover {
		background-color: #f0f0f0;
	}
</style>

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
