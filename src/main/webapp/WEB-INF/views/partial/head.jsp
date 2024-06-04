<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>${title}</title>
<base href="${pageContext.request.contextPath}/">
<link rel="stylesheet" type="text/css" href="resources/css/partial.css">
<link rel="stylesheet" type="text/css" href="resources/css/jquery-ui.css">
<c:if test="${type != null}">
	<link rel="stylesheet" type="text/css" href="resources/css/${type}/style.css">
</c:if>
<c:if test="${type_2 != null}">
	<link rel="stylesheet" type="text/css" href="resources/css/${type_2}/style.css">
</c:if>
<c:if test="${type_3 != null}">
	<link rel="stylesheet" type="text/css" href="resources/css/${type_3}/style.css">
</c:if>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<%@ include file="script.jsp" %>
