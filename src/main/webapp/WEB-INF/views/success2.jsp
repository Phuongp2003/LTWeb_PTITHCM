<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	
	<head>
		<meta charset="UTF-8">
		<title>Spring MVC</title>
	</head>
	
	<body>
		<h1>THÔNG TIN SINH VIÊN PTITHCM</h1>
		<ul>
			<li>HỌ VÀ TÊN: ${student.name}</li>
			<li>ĐIỂM TB: ${student.mark}</li>
			<li>CHUYÊN NGÀNH: ${student.major}</li>
		</ul>
	</body>
	
</html>
