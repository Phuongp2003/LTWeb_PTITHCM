<%@ page pageEncoding="UTF-8" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

        <div class="bill-add container-fluid" style="width: 80%;">
            <form:form method="POST" action="check-out.htm" modelAttribute="bill">

                <div>
                    <form:label path="HOTENNN">Họ và tên người nhận: </form:label>
                    <form:input path="HOTENNN" required="required" />
                </div>
                <div>
                    <form:label path="DIACHINN">Địa chỉ người nhận: </form:label>
                    <form:input path="DIACHINN" required="required" />
                </div>
                <div>
                    <form:label path="EMAILNN">Email người nhận: </form:label>
                    <form:input path="EMAILNN" required="required" />
                </div>
                <div>
                    <form:label path="SDTNN">Số điện thoại người nhận: </form:label>
                    <form:input path="SDTNN" required="required" />
                </div>
                <div>
                    <form:label path="GHICHU">Ghi chú: </form:label>
                    <form:input path="GHICHU" required="required" />
                </div>
                <button type="submit">Thanh toán</button>
            </form:form>
        </div>