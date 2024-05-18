<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<style>
	* {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
		
	}
	
	.user-register {
		background-color: lightblue;
		text-align: center;
		border-radius: 20px;
		padding: 30px 40px;
	}
	
	.user-register .h3 {
		color: white;
		font-size: 35px;
		font-weight: 1000;
	}
	
	.user-register .input-box {
		width: 100%;
		height: 50px;
		margin: 30px 0;
	}
	
	.input-box input {
		width: 100%;
		height: 100%;
		border: 2px solid;
		border-radius: 40px;
		padding: 20px 45px 20px 20px;
		font-size: 16px;
	}
	
	.input-box input::placeholder {
		color: black;
	}
	
	.user-register .register-btn {
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
	
	.user-register .register-btn:hover {
		background-color: rgb(10, 129, 224);
		color: white;
	}
</style>
<div class="user-register container-fluid w-25 fs-4 m-auto">
	<h1 class="h3 mb-3 fw-normal">REGISTER</h1>
	<form:form method="POST" action="user/register-success.htm" modelAttribute="registrationForm">
		
		<div class="input-box">
			<form:label path="USERNAME"></form:label>
			<form:input type="text" path="USERNAME" placeholder="Username" />
		</div>
		
		<div class="input-box">
			<form:label path="PASSWORD"></form:label>
			<form:input type="password" path="PASSWORD" placeholder="Password" />
		</div>
		
		<!-- attribute customer -->
		<div class="input-box">
			<form:label path="HO"></form:label>
			<form:input type="text" path="HO" placeholder="Họ" />
		</div>
		
		<div class="input-box">
			<form:label path="TEN"></form:label>
			<form:input type="text" path="TEN" placeholder="Tên" />
		</div>
		
		<div class="input-box">
			<form:label path="EMAIL"></form:label>
			<form:input type="text" path="EMAIL" placeholder="Email" />
		</div>
		
		<div class="input-box">
			<form:label path="SDT"></form:label>
			<form:input type="text" path="SDT" placeholder="Số điện thoại" />
		</div>
		
		<div class="input-box">
			<form:label path="GIOITINH"></form:label>
			<form:select path="GIOITINH">
				<form:option value="true">Nam</form:option>
				<form:option value="false">Nữ</form:option>
			</form:select>
		</div>
		
		<div class="input-box">
			<form:label path="NGAYSINH"> </form:label>
			<form:input type="date" path="NGAYSINH" placeholder="Ngày sinh" />
		</div>
		
		<button type="submit" class="register-btn">Register</button>
		
	</form:form>
</div>
