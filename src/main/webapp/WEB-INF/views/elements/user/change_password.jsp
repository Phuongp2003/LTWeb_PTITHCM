<%@ page pageEncoding="UTF-8"%>
<style>
	* {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
		
	}
	
	.user-cpass {
		background-color: lightblue;
		text-align: center;
		border-radius: 20px;
		padding: 30px 40px;
		box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
	}
	
	.user-cpass .h3 {
		color: white;
		
		font-size: 35px;
		font-weight: 1000;
		text-shadow: 2px 2px grey;
	}
	
	.user-cpass .input-box {
		width: 100%;
		height: 50px;
		margin: 30px 0;
	}
	
	.input-box input {
		width: 100%;
		height: 100%;
		border: none;
		border: 2px solid;
		border-radius: 40px;
		padding: 20px 45px 20px 20px;
		font-size: 16px;
	}
	
	.user-cpass .login-btn {
		width: 50%;
		height: 45px;
		background: white;
		border: none;
		outline: none;
		border-radius: 40px;
		box-shadow: 0 0 10px black;
		cursor: pointer;
		font-size: 16px;
		color: #333;
		font-weight: 600;
		margin: 30px 0;
	}
	
	.user-cpass .login-btn:hover {
		background-color: rgb(10, 129, 224);
		color: white;
	}
	
	.user-cpass .sign-up {
		font-size: 14.5px;
	}
	
	.user-cpass .sign-up a {
		text-decoration: none;
	}
	
	.user-cpass .sign-up p a:hover {
		text-decoration: underline;
	}
</style>
<div class="user-cpass container-fluid w-25 fs-4 m-auto">
	<h1 class="h3 mb-3 fw-normal">Thay đổi mật khẩu</h1>
	<form method="POST" action="user/change-password.htm">
		
		<div class="input-box">
			<label>Mật khẩu cũ</label>
			<input type="password" name="opassword" class="o-password-input" placeholder="Password" />
		</div>
		<div class="input-box">
			<label>Mật khẩu mới</label>
			<input type="password" name="npassword" class="n-password-input" placeholder="Password" />
		</div>
		<div class="input-box">
			<label>Nhập lại mật khẩu mới</label>
			<input type="password" name="rtnpassword" class="rtn-password-input" placeholder="Password" />
		</div>
		<button type="submit" class="login-btn">Đổi mật khẩu</button>
	</form>
</div>

<script>
	$(document).ready(function() {
		$('form').submit(function(event) {
			var newPassword = $('.n-password-input').val();
			var retypedPassword = $('.rtn-password-input').val();
			
			if (newPassword !== retypedPassword) {
				event.preventDefault();
				alert('New password and retyped password do not match!');
			}
		});
	});
</script>
