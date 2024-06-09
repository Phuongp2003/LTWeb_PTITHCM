<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script>
	function updateStatusFilter() {
		const status = document.getElementById("statusFilter").value;
		const basePath = '<c:url value="/manage/bill/" />';
		window.location.href = basePath + status + ".htm";
	}
</script>

<div class="container mt-5">
	<h2 class="mb-4">Danh sách đơn hàng</h2>
	
	<div class="row mb-3">
		<div class="col-md-6">
			<div class="custom-select-container">
				<select id="statusFilter" class="custom-select" onchange="updateStatusFilter()">
					<option value="-1" ${status==-1 ? 'selected' : '' }>Tất cả</option>
					<c:forEach var="statusItem" items="${statuslist}">
						<option value="${statusItem.MATT}" ${statusItem.MATT==status ? 'selected' : '' }>
							${statusItem.TENTT}
						</option>
					</c:forEach>
				</select>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="table-responsive">
				<table class="table table-bordered">
					<thead class="thead-dark">
						<tr>
							<th>Mã hóa đơn</th>
							<th>Ngày tạo</th>
							<th>Họ tên người nhận</th>
							<th>Địa chỉ người nhận</th>
							<th>Số điện thoại người nhận</th>
							<th>Email người nhận</th>
							<th>Ghi chú</th>
							<th>Họ tên khách hàng</th>
							<th>Họ tên nhân viên</th>
							<th>Tổng tiền</th>
							<th>Trạng thái</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="bill" items="${billlist}">
							<tr>
								<td>${bill.MAHD}</td>
								<td>
									<fmt:formatDate value="${bill.NGAYLAP}" pattern="dd/MM/yyyy" />
								</td>
								<td>${bill.HOTENNN}</td>
								<td>${bill.DIACHINN}</td>
								<td>${bill.SDTNN}</td>
								<td>${bill.EMAILNN}</td>
								<td>${bill.GHICHU}</td>
								<td>${bill.bill_customer.HO} ${bill.bill_customer.TEN}</td>
								<td>${bill.bill_employee.HO} ${bill.bill_employee.TEN}</td>
								<td>
									<fmt:formatNumber value="${bill.TONGTIEN}" type="currency" currencySymbol="đ" />
								</td>
								<td>${bill.status.TENTT}</td>
								<td>
									<c:if test="${bill.status.MATT != 5 && bill.status.MATT != 6}">
										
										<form:form action="admin/bill/${bill.status.MATT}/edit.htm" modelAttribute="bill" method="post" class="d-inline">
											<input type="hidden" name="status" value="${bill.status.MATT}">
											<input type="hidden" name="MAHD" value="${bill.MAHD}">
											<button type="submit" class="btn btn-primary">Duyệt</button>
										</form:form>
										
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
