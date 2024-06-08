<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="en">

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
                            <option value="">Tất cả</option>
                            <c:forEach var="status" items="${statuslist}">
                                <option value="${status.MATT}" data-status="${status.TENTT}">
                                    ${status.TENTT}
                                </option>
                            </c:forEach>
                        </select>

                        <div id="selectedStatus"></div>
                        <!-- <div id="selectedStatus1">Bạn chưa chọn trạng thái</div> -->
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
                                <c:forEach var="bill" items="${allbill}">
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
                                            <fmt:formatNumber value="${bill.TONGTIEN}" type="currency"
                                                currencySymbol="đ" ${bill.status} />
                                        </td>

                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
    
    <script>
        // Lấy tất cả các combobox
        var statusFilters = document.querySelectorAll('.statusFilter');

        // Định nghĩa hàm cập nhật giá trị hiển thị của combobox đã chọn
        function updateSelectedStatus(selectedStatus) {
            var selectedStatusElement = document.getElementById('selectedStatus');
            selectedStatusElement.innerText = 'Trạng thái đã chọn: ' + selectedStatus;
        }
        function selectOption(desiredValue) {
            var selectElement = document.getElementById("statusFilter");

            // Lặp qua các tùy chọn và kiểm tra giá trị
            for (var i = 0; i < selectElement.options.length; i++) {
                if (selectElement.options[i].value === desiredValue) {
                    // Nếu giá trị khớp, chọn tùy chọn này
                    selectElement.selectedIndex = i;
                    break;
                }
            }
        }

        // Định nghĩa hàm chuyển hướng trang web
        function redirectPage(selectedStatus) {
            var newURL = '/webapp/admin/bill/' + selectedStatus + '.htm';
            window.location.href = newURL;
        }

        // Thêm sự kiện "change" cho từng combobox
        for (var i = 0; i < statusFilters.length; i++) {
            statusFilters[i].addEventListener('change', function() {
                var selectedStatus = this.value; // Lấy giá trị của combobox được chọn
                var index = this.id.replace('statusFilter', ''); // Lấy chỉ số của combobox
                updateSelectedStatus(selectedStatus); // Cập nhật giá trị hiển thị của combobox
                selectOption(selectedStatus);
                redirectPage(selectedStatus); // Chuyển hướng trang web
            });
        }
    </script>
        </body>

        </html>