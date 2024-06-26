<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<style>
	.user-dashboard-place {
		padding: 0 20px;
	}
	
	.user-dashboard {
		border: 1px black solid;
	}
	
	.user-navbar {
		width: 20%;
		height: 100%;
		min-width: 150px;
		padding-left: 15px;
	}
	
	.user-info {
		border-left: 2px grey solid;
		padding-left: 10px;
	}
</style>
<div class="user-dashboard-place">
	<div class="user-dashboard container-fluid w-100 fs-4 m-auto d-flex">
		<unav class="user-navbar d-flex flex-column fs-6">
			<a href="user/${account.ID}/posts.htm" class="posts-user fw-bold">Danh sách bài viết</a>
		</unav>
		<div class="user-info w-100">
			<div class="account-info">
				<div class="ace-name">Họ và tên: ${user_name}</div>
				<div class="ace-cccd">Địa chỉ email: ${model.EMAIL}</div>
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
			<div class="acc-role">Vai trò: ${user_type == "employee" ? "Nhân viên" : "Người dùng"}</div>
			<div class="acc-id">UID: ${account.ID}</div>
			<div class="customer-info"></div>
		</div>
	</div>
</div>
