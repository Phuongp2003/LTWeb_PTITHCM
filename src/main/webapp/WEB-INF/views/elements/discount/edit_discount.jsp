<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<style>
	.add-discount {
		padding: 10px 0;
		border: 1px black solid;
		border-radius: 5px;
	}
	
	.add-discount form>* {
		padding: 3px 10px;
	}
	
	.add-discount .discount .discount-head {
		margin-bottom: 10px;
	}
	
	.add-discount .discount-input--label {
		width: 25%;
	}
	
	.add-discount .discount-input--textbox {
		width: 72%;
	}
	
	label,
	input {
		width: 100%;
	}
	
	.discount-input {
		display: flex;
	}
	
	@media (max-width: 400px) {
		.add-discount .add-discount {
			padding: 0;
		}
		
		.add-discount .discount {
			margin: 0 0;
			margin-bottom: 10px;
			border: none;
			border-top: solid .5px brown;
			
		}
		
		.add-discount .discount:last-child {
			margin-bottom: 0;
		}
		
	}
</style>

<div class="add-discount container-fluid w-50">
	<form:form method="POST" action="discount/${discount.MAKM}/edit-success.htm" modelAttribute="discount">
		<div class="discount-input">
			<div class="discount-input--label">
				<form:label path="TENKM">Tên chương trình khuyến mãi: </form:label>
			</div>
			<div class="discount-input--textbox">
				
				<form:input path="TENKM" />
			</div>
		</div>
		<div class="discount-input">
			<div class="discount-input--label">
				<form:label path="NGAYBD">Ngày bắt đầu: </form:label>
			</div>
			<div class="discount-input--textbox">
				<form:input path="NGAYBD" type="date" />
			</div>
		</div>
		<div class="discount-input">
			<div class="discount-input--label">
				<form:label path="NGAYKT">Ngày kết thúc: </form:label>
			</div>
			<div class="discount-input--textbox">
				<form:input path="NGAYKT" type="date" />
			</div>
		</div>
		<div class="discount-input">
			<button type="submit">Thêm chương trình khuyến mãi</button>
		</div>
	</form:form>
</div>
