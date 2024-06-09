<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<style>
	.bill-add {
		border: 1px solid black;
		border-radius: 5px;
	}
	
	.bill-add form {
		padding: 10px 5px;
	}
	
	.bill-info {
		display: flex;
		padding: 3px 0;
	}
	
	.bill-info-input {
		width: 25%;
	}
	
	.bill-info-textbox {
		width: 72%;
	}
	
	.bill-info-input>*,
	.bill-info-textbox>* {
		width: 100%;
	}
</style>

<div class="bill-add container-fluid w-50">
	<form:form method="POST" action="bill/check-out.htm" modelAttribute="bill">
		<div class="bill-info">
			<div class="bill-info-input">
				<form:label path="HOTENNN">Họ và tên người nhận: </form:label>
			</div>
			<div class="bill-info-textbox">
				<form:input path="HOTENNN" required="required" value="${user.HO} ${user.TEN}" />
			</div>
		</div>
		<div class="bill-info">
			<div class="bill-info-input">
				<form:label path="DIACHINN">Địa chỉ người nhận: </form:label>
			</div>
			<div class="bill-info-textbox">
				<form:input path="DIACHINN" required="required" />
			</div>
		</div>
		<div class="bill-info">
			<div class="bill-info-input">
				<form:label path="EMAILNN">Email người nhận: </form:label>
			</div>
			<div class="bill-info-textbox">
				<form:input path="EMAILNN" required="required" value="${user.EMAIL}" />
			</div>
		</div>
		<div class="bill-info">
			<div class="bill-info-input">
				<form:label path="SDTNN">Số điện thoại người nhận: </form:label>
			</div>
			<div class="bill-info-textbox">
				<form:input path="SDTNN" required="required" value="${user.SDT}" />
			</div>
		</div>
		<div class="bill-info">
			<div class="bill-info-input">
				<form:label path="GHICHU">Ghi chú: </form:label>
			</div>
			<div class="bill-info-textbox">
				<form:input path="GHICHU" required="required" />
			</div>
		</div>
		<button type="submit">Thanh toán</button>
	</form:form>
</div>
