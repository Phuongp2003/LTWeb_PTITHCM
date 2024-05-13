<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="user-login container-fluid w-75 fs-4 d-flex">
    <form:form method="POST" action="/webapp/user/login-success.htm" modelAttribute="account">
        <div class="username">
			<form:label path="USERNAME">Username: </form:label>
			<form:input path="USERNAME" />
		</div>
        <div class="password">
			<form:label path="PASSWORD">Password: </form:label>
			<form:input path="PASSWORD" />
		</div>
        <button type="submit">Login</button>
    </form:form>
</div>
