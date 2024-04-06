<%@ page pageEncoding="UTF-8"%>
<style>
	.forum-user {
		margin-top: 20px;
		width: 100%;
	}
	
	.forum-user>* {
		display: flex;
		position: relative;
		gap: 15px;
	}
	
	.forum-user .user-img {
		height: 50px;
		width: 50px;
	}
	
	.forum-user a {
		color: black;
	}
	
	.user-controller {
		margin: auto;
	}
</style>

<div class="forum-user container-fluid w-75 fs-4 d-flex">
	<a href="user/${user_id}">
		<img class="user-img" src="resources/imgs/test1.png" class="userImg">
		<div class="user-name">${user_name}</div>
	</a>
	<div class="user-controller">
		<a href="">
			<div class="user-createpost">Tạo bài viết</div>
		</a>
		<a href="">
			<div class="user-postcontrol">Quản lý bài viết</div>
		</a>
	</div>
</div>
