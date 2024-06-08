<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <title>Danh sách hóa đơn</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'/>">
</head>

<body>
    <div class="container">
        <h2>Danh sách hóa đơn</h2>
        <div class="row mb-3">
            <div class="col-md-6">
                <select id="statusFilter" class="statusFilter">
                    <option value="-1">Tất cả</option>
                    <c:forEach var="status" items="${statuslist}">
                        <option value="${status.index}">${status.TENTT}</option>
                    </c:forEach>
                </select>
                <div id="selectedStatus"></div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <h4>Danh sách hóa đơn</h4>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Mã hóa đơn</th>
                            <th>Ngày tạo</th>
                            <th>Họ tên người nhận</th>
                            <th>Địa chỉ người nhận</th>
                            <th>Số điện thoại người nhận</th>
                            <th>Email người nhận</th>
                            <th>Ghi chú</th>
                            <th>Tổng tiền</th>
                        </tr>
                    </thead>
                    <tbody id="billTableBody">
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
                                <td>
                                    <fmt:formatNumber value="${bill.TONGTIEN}" type="currency" currencySymbol="đ" />
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <script>
        var statusFilters = document.querySelectorAll('.statusFilter');
        function updateSelectedStatus(selectedStatus) {
            var selectedStatusElement = document.getElementById('selectedStatus');
            selectedStatusElement.innerText = 'Trạng thái đã chọn: ' + selectedStatus;
        }
        function selectOption(desiredValue) {
            var selectElement = document.getElementById("statusFilter");
            for (var i = 0; i < selectElement.options.length; i++) {
                if (selectElement.options[i].text === desiredValue) { // Changed to `.text`
                    selectElement.selectedIndex = i;
                    break;
                }
            }
        }
        function redirectPage(url) {
            window.location.href = url;
        }
        for (var i = 0; i < statusFilters.length; i++) {
            statusFilters[i].addEventListener('change', function () {
                var selectedStatus = this.options[this.selectedIndex].text; // Change to use the text if necessary
                var url = '/webapp/admin/bill';
                url += this.value ? '/' + this.value + '.htm' : '.htm';
                updateSelectedStatus(selectedStatus);
                selectOption(selectedStatus);
                redirectPage(url);

            });
        }
    </script>
</body>

</html>