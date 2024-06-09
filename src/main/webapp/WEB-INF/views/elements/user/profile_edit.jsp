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
		width: 12%;
		height: 100%;
		min-width: 150px;
		padding-left: 15px;
	}
	
	.user-navbar * {
		text-align: center;
	}
	
	.user-info {
		border-left: 2px grey solid;
		padding: 0 20px;
	}
	
	.account-info {
		font-size: 20px;
	}
	
	.account-info>* {
		padding: 3px 0;
	}
	
	label,
	input {
		size: inherit;
	}
</style>
<div class="user-dashboard-place">
	<form action="user/${account.ID}/edit-info.htm" method="post">
		<div class="user-dashboard container-fluid w-100 fs-4 m-auto d-flex">
			<unav class="user-navbar d-flex flex-column fs-6">
				<button type="submit" class="posts-user fw-bold" style="background: none; border: none; padding: 0; color: #007bff; text-decoration: none; cursor: pointer;">Lưu</button>
				<a href="user/${account.ID}.htm" class="books-user fw-bold" style="background: none; border: none; padding: 0; color: #007bff; text-decoration: none; cursor: pointer;">Hủy</a>
			</unav>
			<div class="user-info w-100">
				<div class="account-info">
					<div class="ace-name">
						<label for="user_name">Họ và tên:</label>
						<input type="text" id="user_name" name="user_name" value="${user_name}">
					</div>
					<div class="ace-mail">
						<label for="email">Địa chỉ email:</label>
						<input type="email" id="email" name="email" value="${model.EMAIL}">
					</div>
					<div class="ace-birthday">
						<label for="NGAYSINH">Ngày sinh:</label>
						<input type="date" id="NGAYSINH" name="NGAYSINH" value="${birthday}">
					</div>
					<c:if test="${user_type == 'employee'}">
						<div class="ace-cccd">
							<label for="CCCD">Số căn cước công dân:</label>
							<input type="text" id="CCCD" name="CCCD" value="${model.CCCD}">
						</div>
					</c:if>
					<div class="ace-gt">
						<label for="GIOITINH">Giới tính:</label>
						<select id="GIOITINH" name="GIOITINH">
							<option value="Nam" ${model.GIOITINH ? ' selected' : '' }>Nam</option>
							<option value="Nữ" ${!model.GIOITINH ? ' selected' : '' }>Nữ</option>
						</select>
					</div>
					<div class="acc-role">Vai trò: ${user_type == "employee" ? "Nhân viên" : "Người dùng"}</div>
					<div class="acc-id">UID: ${account.ID}</div>
				</div>
				<div class="customer-info"></div>
			</div>
		</div>
	</form>
</div>
