<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	
	<head>
		<meta charset="ISO-8859-1">
		<title>SpringMVC</title>
		<base href="${pageContext.servletContext.contextPath }/">
	</head>
	
	<body>
		<form action="student/update.htm" method="POST">
			<div>Họ và tên</div>
			<input name="name" value="${student.name}" />
			<div>Điểm trung bình</div>
			<input name="mark" value="${student.mark}" />
			
			<div>Chuyên ngành</div>
			<label>
				<input name="major" type="radio" value="APP" ${student.major=='APP' ?'checked':''} />
				Ứng dụng phần mềm
			</label>
			<label>
				<input name="major" type="radio" value="WEB" ${student.major=='WEB' ?'checked':''} />
				Thiết kế trang web
			</label>
			<hr>
			
			<button name="btnUpdate"> Cập nhật </button>s
			
		</form>
	</body>
	
</html>
