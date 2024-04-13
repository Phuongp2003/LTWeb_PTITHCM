<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
	
	<head>
		<%@ include file="partial/head.jsp" %>
	</head>
	
	<body>
		<%@ include file="elements/navbar.jsp" %>
		<style>
			.message {
				width: 100%;
				height: 300px;
				border: 1px solid red;
				color: red;
			}
		</style>
		
		<div class="message">
			ERROR: No page found!
		</div>
	</body>
	
	
	<%@ include file="partial/footer.jsp" %>
	
	<script>
		setTimeout(function() {
			window.location.href = '../';
		}, 5000);
	</script>
	
</html>
