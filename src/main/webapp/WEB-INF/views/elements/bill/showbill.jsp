<%@ page pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <html>

            <head>
                <title>Hóa Đơn Bán Hàng</title>
                <link rel="stylesheet" href="/path/to/your/css/if-any.css">
                <style>
                    body {
                        font-family: 'Arial', sans-serif;
                        margin: 0;
                        padding: 0;
                        background-color: #f4f4f4;
                    }

                    .invoice-box {
                        max-width: 800px;
                        margin: auto;
                        padding: 30px;
                        border: 1px solid #eee;
                        box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);
                        background-color: #fff;
                        color: #555;
                    }

                    .header {
                        text-align: left;
                        margin-bottom: 20px;
                    }

                    .header .title {
                        text-align: center;
                        margin-bottom: 20px;
                    }

                    .header img {
                        max-width: 150px;
                    }

                    table {
                        width: 100%;
                        line-height: inherit;
                        text-align: left;
                    }



                    .table-header {
                        background-color: #f8f8f8;
                    }

                    .table-row {
                        background-color: #ffffff;
                    }

                    th,
                    td {
                        max-width: 200px;
                        padding: 10px;
                        border-bottom: 1px solid #eee;
                        overflow: hidden;
                        text-overflow: ellipsis;
                       
                        /* white-space: nowrap; */
            
                    }

                    .total {
                        text-align: right;
                        font-size: 18px;
                    }

                    .invoice-box {
                        width: 100%;
                        /* Bảng sẽ có chiều rộng bằng 100% của container */
                        overflow-x: auto;
                        /* Tạo thanh cuộn ngang nếu nội dung vượt ra khỏi chiều rộng của container */
                    }

                    .table-body {
                        width: 100%;
                        /* Bảng sẽ có chiều rộng bằng 100% của container */
                        border-collapse: collapse;
                        /* Loại bỏ khoảng cách giữa các ô */
                    }

                    .table th,
                    .table td {
                        padding: 8px;
                        /* Thêm padding vào các ô */
                        border: 1px solid #ddd;
                        /* Thêm viền cho các ô */
                        text-align: left;
                        /* Căn lề văn bản sang trái */
                    }
                </style>
            </head>

            <body>
                <div class="invoice-box">
                    <div class="header">
                        <div class="title">
                            <h1><b>Hóa Đơn Bán Hàng</b></h1>
                        </div>

                        <hr>
                        <h2><b>Thông Tin Đơn Hàng</b></h2>
                        <p><b>Mã hóa đơn:</b> ${bill.MAHD}</p>
                        <p><b>Mã khách hàng:</b> ${bill.bill_customer.MAKH}</p>
                        <p><b>Ngày lập đơn</b>:
                            <fmt:formatDate value="${bill.NGAYLAP}" pattern="dd/MM/yyyy" />
                        </p>
                        <p><b>Họ tên người nhận:</b> ${bill.HOTENNN}</p>
                        <p><b>Email:</b> ${bill.EMAILNN}</p>
                        <p><b>Số điện thoại:</b> ${bill.SDTNN}</p>
                        <p><b>Địa chỉ:</b> ${bill.DIACHINN}</p>
                        <p><b>Ghi chú:</b> ${bill.GHICHU}</p>
                    </div>
                    <hr>

                    <table class="table-body">
                        <tr class="table-header">
                            <th>Mã SP</th>
                            <th>Tên Sản Phẩm</th>
                            <th>Số Lượng</th>
                            <th>Đơn Giá</th>
                            <th>Thành Tiền</th>
                        </tr>
                        <c:forEach items="${billdetail}" var="detail">
                            <!-- Giả sử billDetails là danh sách chi tiết hóa đơn -->
                            <tr class="table-row">
                                <td>${detail.billdetail_book.MASACH}</td>
                                <td title=" ${detail.billdetail_book.TENSACH}">
                                    ${detail.billdetail_book.TENSACH}</td>
                                <td>${detail.SOLUONG}</td>
                                <td>
                                    <fmt:formatNumber value="${detail.DONGIA}" type="currency" currencySymbol="đ"
                                        maxFractionDigits="0" />
                                </td>
                                <td>
                                    <fmt:formatNumber value="${detail.SOLUONG * detail.DONGIA}" type="currency"
                                        currencySymbol="đ" maxFractionDigits="0" />
                                </td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td colspan="4" class="total">Tổng Cộng:</td>
                            <td>
                                <fmt:formatNumber value="${bill.TONGTIEN}" type="currency" currencySymbol="đ"
                                    maxFractionDigits="0" />
                            </td>
                        </tr>
                    </table>
                </div>
            </body>

            </html>