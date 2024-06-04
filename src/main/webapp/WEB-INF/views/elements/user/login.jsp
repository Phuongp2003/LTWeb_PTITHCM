<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<style>
	* {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
		
	}
	
	.user-login {
		background-color: lightblue;
		text-align: center;
		border-radius: 20px;
		padding: 30px 40px;
		box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
	}
	
	.user-login .h3 {
		color: white;
		
		font-size: 35px;
		font-weight: 1000;
		text-shadow: 2px 2px grey;
	}
	
	.user-login .input-box {
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
	
	.user-login .login-btn {
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
	
	.user-login .login-btn:hover {
		background-color: rgb(10, 129, 224);
		color: white;
	}
	
	.user-login .sign-up {
		font-size: 14.5px;
	}
	
	.user-login .sign-up a {
		text-decoration: none;
	}
	
	.user-login .sign-up p a:hover {
		text-decoration: underline;
	}
</style>
<div class="user-login container-fluid w-25 fs-4 m-auto">
	<h1 class="h3 mb-3 fw-normal">PLEASE SIGN IN</h1>
	<form:form method="POST" action="user/login-success.htm" modelAttribute="account">
		
		<div class="input-box">
			<form:label path="USERNAME"></form:label>
			<form:input type="text" class="username-input" path="USERNAME" placeholder="Username" />
		</div>
		
		<div class="input-box">
			<form:label path="PASSWORD"></form:label>
			<form:input type="password" class="password-input" path="PASSWORD" placeholder="Password" />
		</div>
		
		<button type="submit" class="login-btn">Login</button>
		<div class="sign-up">
			<p>Chưa có tài khoản ư? <a href="user/register.htm">Đăng ký ngay!</a></p>
		</div>
		<div class="sign-up">
			<p><a href="user/forgot-password.htm">Quên mật khẩu</a></p>
		</div>
	</form:form>
</div>
