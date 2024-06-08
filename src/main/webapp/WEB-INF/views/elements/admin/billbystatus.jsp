<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <title>Danh sách hóa đơn</title>
                <!-- <script>
        function updateStatusFilter() {
            const status = document.getElementById("statusFilter").value;
            const url = new URL(window.location.href);
            const basePath = url.pathname.split('/').slice(0, -1).join('/');
            console.log(url.pathname.split('/').slice(0, -1).join('/'));
            window.location.href = `${basePath}/${status}`;
        }
    </script> -->
                <script>
                    function updateStatusFilter() {
                        const status = document.getElementById("statusFilter").value;
                        const basePath = '<c:url value="/admin/bill/" />';
                        window.location.href = basePath + status + ".htm";
                    }
                </script>
            </head>

            <body>
                <div class="container">
                    <h2>Danh sách hóa đơn</h2>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <select id="statusFilter" class="statusFilter" onchange="updateStatusFilter()">
                                <option value="-1" ${status==-1 ? 'selected' : '' }>Tất cả</option>
                                <c:forEach var="statusItem" items="${statuslist}">
                                    <option value="${statusItem.MATT}" ${statusItem.MATT==status ? 'selected' : '' }>
                                        ${statusItem.TENTT}</option>
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
                                                <fmt:formatNumber value="${bill.TONGTIEN}" type="currency"
                                                    currencySymbol="đ" />
                                            </td>
                                            <td>
                                                <form:form action="admin/bill/edit.htm" modelAttribute="bill">
                                            <input type="hidden" name="MAHD" value="${bill.MAHD}">
                                            <input type="hidden" name="TRANGTHAI" value="${bill.status.MATT}">
                                            <button type="submit" class="btn btn-primary">Duyệt</button>
                                        </form:form>
                                            </td>
                                            
                                        </tr>
                                        

                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </body>

            </html>