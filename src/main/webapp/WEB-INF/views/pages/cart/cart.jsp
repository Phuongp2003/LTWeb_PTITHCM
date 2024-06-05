<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
	<jsp:include page="${initParam.viewsPath}/path.jsp" /> 
	<head>
		<jsp:include page="${partial}/head.jsp" />
	</head>
	
	<body>
		<jsp:include page="${elements}/navbar.jsp" />
	
		
		<jsp:include page="${elements}/cart/showcart.jsp" />  
		

	</body>
	
	
	<jsp:include page="${partial}/footer.jsp" />
	
</html>
