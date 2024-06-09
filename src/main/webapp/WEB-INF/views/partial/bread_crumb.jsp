<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<nav aria-label="breadcrumb" class="w-75 ms-auto me-auto">
	<ol class="breadcrumb">
		<c:forEach var="item" items="${BC.preLinks}">
			<li class="breadcrumb-item"><a href="${item.url}">${item.name}</a></li>
		</c:forEach>
		<li class="breadcrumb-item active" aria-current="page">${BC.currentLink.name}</li>
	</ol>
</nav>
