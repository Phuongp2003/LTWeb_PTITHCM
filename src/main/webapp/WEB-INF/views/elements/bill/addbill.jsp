<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="bill-add container-fluid" style="width: 80%;">
    <form:form method="POST" action="check-out.htm" modelAttribute="bill">
        <!-- <div class="category-name"> -->
            <!-- <div>
                
			<form:hidden path="bill_cart.IDGH" required="required"/>
            </div> -->
            <!-- <div>
                <form:label path="MAHD">Mã hóa đơn: </form:label>
			<form:input path="MAHD" required="required"/>
            </div>
            <div>
                <form:label path="bill_customer.MAKH">Mã khách hàng: </form:label>
			<form:input path="bill_customer.MAKH" required="required"/>
            </div> -->
            <!-- <div>
                <form:label path="NGAYLAP">Ngày lập: </form:label>
			<form:input path="NGAYLAP" value="" required="required"/>
            </div> -->
			<!-- <div>
                <form:label path="TONGTIEN">Tổng tiền: </form:label>
			<form:input path="TONGTIEN" required="required"/>
            </div>
            <div>
                <form:label path="HOTENNN">Họ và tên người nhận: </form:label>
			<form:input path="HOTENNN" required="required"/>
            </div>
            <div>
                <form:label path="DIACHINN">Địa chỉ người nhận: </form:label>
			<form:input path="DIACHINN" required="required"/>
            </div>
            <div>
                <form:label path="EMAILNN">Email người nhận: </form:label>
			<form:input path="EMAILNN" required="required"/>
            </div>
            <div>
                <form:label path="SDTNN">Số điện thoại người nhận: </form:label>
			<form:input path="SDTNN" required="required"/>
            </div>
            <div>
                <form:label path="GHICHU">Ghi chú: </form:label>
			<form:input path="GHICHU" required="required"/>
            </div>
            <div class="input-box">
			<form:label path="NGAYLAP"> </form:label>
			<form:input type="date" path="NGAYLAP" placeholder="Ngày lập: " /> -->
		</div>
		<!-- </div> -->
        <button type="submit">Thanh toán</button>
    </form:form>
</div>