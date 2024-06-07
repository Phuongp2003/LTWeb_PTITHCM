<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<style>
	.user-dashboard {
		padding-left: 0;
		padding-right: 0;
		border: 2px brown solid;
		
	}
	
	.user-navbar {
		width: 12%;
		height: 100%;
		min-width: 150px;
		padding-left: 15px;
	}
	
	.user-info {
		border-left: 2px brown solid;
	}
</style>

<div class="user-dashboard container-fluid w-100 fs-4 m-auto d-flex">
	<unav class="user-navbar d-flex flex-column fs-6">
		<a href="user/${account.ID}/edit-info.htm" class="c-info fw-bold">Thay đổi thông tin</a>
		<a href="user/${account.ID}/posts.htm" class="post-manage fw-bold">Quản lý bài viết</a>
		<c:if test="${user_type == 'employee'}">
			<a href="manage/posts.htm" class="check-post fw-bold">Kiểm duyệt bài viết</a>
			<a href="manage/books.htm" class="check-book fw-bold">Kiểm duyệt sách</a>
		</c:if>
		<a href="user/change-password.htm" class="c-password fw-bold">Thay đổi mật khẩu</a>
		<a href="user/logout.htm" class="logout fw-bold">Đăng xuất</a>
	</unav>
	<div class="user-info w-100">
		<div class="account-info">
			<div class="acc-id">UID: ${account.ID}</div>
			<div class="acc-role">Vai trò: ${user_type}</div>
			<div class="ace-name">Họ và Tên: ${user_name}</div>
			<c:if test="${user_type == 'employee'}">
				<div class="ace-cccd">CCCD: ${model.CCCD}</div>
			</c:if>
			<div class="ace-cccd">EMAIL: ${model.EMAIL}</div>
			<div class="ace-birthday">Ngày sinh: ${birthday}</div>
			<div class="ace-cccd">Giới tính:
				<c:if test="${model.GIOITINH}">
					Nam
				</c:if>
				<c:if test="${!model.GIOITINH}">
					Nữ
				</c:if>
			</div>
		</div>
		<div class="customer-info"></div>
	</div>
</div>
