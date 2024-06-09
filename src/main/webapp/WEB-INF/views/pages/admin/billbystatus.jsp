<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
	
	<jsp:include page="${initParam.viewsPath}/path.jsp" />
	
	<head>
		<jsp:include page="${partial}/head.jsp" />
	</head>
	
	<body>
		<jsp:include page="${elements}/navbar.jsp" />
		<jsp:include page="${partial}/bread_crumb.jsp" />
		<jsp:include page="${elements}/admin/billbystatus.jsp" />
		
	</body>
	<jsp:include page="${partial}/footer.jsp" />
	
</html>
