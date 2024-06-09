<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<style>
	.navbar-brand {
		align-items: center;
		justify-content: center;
		padding: 10px;
	}
	
	.forum-user {
		width: 100%;
		height: 55px;
		border: black;
		border-style: solid;
		border-width: 2px;
		border-radius: 10px;
		border-bottom-left-radius: 0;
		line-height: 2.25;
		margin: 0 auto;
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
	
	.user-func-toggler {
		display: none;
	}
	
	.user-controller {
		margin: 0 12px 0 auto;
		height: 100%;
	}
	
	.user-controller .nav-item {
		display: flex;
		flex-flow: row;
		gap: 10px;
	}
	
	@media (max-width: 650px) {
		.user-func-toggler {
			display: block;
		}
		
		.user-controller {
			display: flex;
			flex-flow: column;
		}
		
		.user-func-toggler {
			height: 100%;
			border: solid 1px black;
		}
		
		.nav-close-dropdown {
			display: none;
		}
		
		.user-func-toggler.active>.nav-dropdown {
			display: none;
		}
		
		.user-func-toggler.active>.nav-close-dropdown {
			display: inline;
		}
		
		.user-controller .nav-item {
			display: none;
			transition: opacity 0.9s ease-in-out;
			opacity: 0;
		}
		
		.user-controller .nav-item>* {
			padding: 0 5px;
		}
		
		.user-controller .nav-item>*:first-child {
			border: none;
		}
		
		.user-controller .nav-item.show {
			background-color: #f0f0f0;
			opacity: 1;
			display: block;
			position: relative;
			top: -15px;
			text-align: end;
			border: solid 2px;
			border-top: none;
		}
	}
</style>
<c:if test="${user_id != null}">
	<div class="forum-user w-75 fs-4 d-flex">
		<a class="navbar-brand" href="user/${user_id}.htm">
			<div class="user-name">${user_name}</div>
		</a>
		<div class="user-controller">
			<button class="user-func-toggler" type="button" aria-label="Toggle navigation" onclick="toggleNavItems()">
				<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-chevron-compact-down nav-dropdown" viewBox="0 0 16 16">
					<path fill-rule="evenodd" d="M1.553 6.776a.5.5 0 0 1 .67-.223L8 9.44l5.776-2.888a.5.5 0 1 1 .448.894l-6 3a.5.5 0 0 1-.448 0l-6-3a.5.5 0 0 1-.223-.67"></path>
				</svg>
				<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-chevron-up nav-close-dropdown" viewBox="0 0 16 16">
					<path fill-rule="evenodd" d="M7.646 4.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1-.708.708L8 5.707l-5.646 5.647a.5.5 0 0 1-.708-.708z" />
				</svg>
			</button>
			<div class="nav-item">
				<div class="user-createpost">
					<a class="nav-link" href="forum/create-post.htm">
						Tạo bài viết
					</a>
				</div>
				<div class="user-postcontrol">
					<a class="nav-link" href="user/${user_id}/posts.htm">Quản lý bài viết</a>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		function toggleNavItems() {
			var navItems = document.querySelectorAll('.user-controller .nav-item');
			navItems.forEach(function(item) {
				item.classList.toggle('show');
			});
			var button = document.querySelector('.user-func-toggler');
			button.classList.toggle('active');
		}
	</script>
</c:if>
