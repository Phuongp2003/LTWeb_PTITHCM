<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<style>
	.discount-list {
		border-top: brown;
		border-top-style: solid;
		border-top-width: 2px;
		padding-top: 20px;
	}
	
	.discount-list .discount-list {
		border: brown;
		border-style: solid;
		border-width: .5px;
		padding: 20px 10px;
	}
	
	.discount-list .discount {
		width: 220px;
		min-width: 220px;
		margin: 3px calc(20px / 3);
		border: brown;
		border-style: solid;
		border-width: .5px;
		padding-top: 20px;
	}
	
	.discount-list .discount .discount-head {
		margin-bottom: 10px;
		border-bottom: .3px brown solid;
	}
	
	@media (max-width: 400px) {
		.discount-list .discount-list {
			padding: 0;
		}
		
		.discount-list .discount {
			margin: 0 0;
			margin-bottom: 10px;
			border: none;
			border-top: solid .5px brown;
			
		}
		
		.discount-list .discount:last-child {
			margin-bottom: 0;
		}
		
	}
</style>

<div class="discount-list container-fluid w-75">
	<form:form method="POST" action="manage/discount/add-success.htm" modelAttribute="discount">
		<div class="port-title">
			<form:label path="TENKM">Title: </form:label>
			<form:input path="TENKM" />
		</div>
		<div class="port-title">
			<form:label path="NGAYBD">Title: </form:label>
			<form:input path="NGAYBD" type="date" />
		</div>
		<div class="port-title">
			<form:label path="NGAYKT">Title: </form:label>
			<form:input path="NGAYKT" type="date" />
		</div>
		<button type="submit" title="Thêm khuyến mãi mới!">OK</button>
	</form:form>
</div>
