<%@ page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
	<jsp:include page="${initParam.viewsPath}/path.jsp" />
	
	<head>
		<jsp:include page="${partial}/head.jsp" />
	</head>
	
	<body>
		<jsp:include page="${elements}/navbar.jsp" />
		<jsp:include page="${partial}/bread_crumb.jsp" />
		<jsp:include page="${elements}/forum/user.jsp" />
		<jsp:include page="${elements}/forum/post.jsp" />
	</body>
	
	<jsp:include page="${partial}/footer.jsp" />
	
</html>
