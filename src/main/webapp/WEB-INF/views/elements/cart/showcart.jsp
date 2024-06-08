<%@ page pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
        <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                <style>
                    .cart-detail .wrapper {
                        margin-bottom: 0.5rem;
                    }

                    .cart-detail .group-input {
                        display: flex;
                    }

                    .cart-detail .input {
                        height: 2.5rem;
                        width: 4rem;
                        color: black;
                        background-color: white;
                        border: 1px solid rgb(166, 166, 176);
                        border-radius: 4px;
                    }

                    .cart-detail .partcenter {
                        display: flex;
                        justify-content: space-between;
                    }

                    .cart-detail .btn-delete {
                        height: 2.5rem;
                        width: 4rem;
                    }
                </style>
                <div class="cart-detail container-fluid" style="width: 80%">

                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="home.htm">Trang chủ</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">Giỏ hàng</li>
                        </ol>
                    </nav>
                    <div class="product">
                        <c:choose>
                            <c:when test="${empty cartdetail}">
                                <h1>Giỏ hàng của bạn đang trống.</h1>
                                <a href="shop.htm" class="btn btn-primary">Quay lại cửa hàng</a>
                            </c:when>
                            <c:otherwise>
                                <div class="row">
                                    <div class="col-lg-8 col-md-8 col-sm-12">
                                        <c:forEach var="detail" items="${cartdetail}" varStatus="status">
                                            <div class="row">
                                                <div class="col-lg-8 col-md-8 col-sm-12 col-xs-8 pd5">
                                                    <div class="card mb-3">
                                                        <div class="row g-0">
                                                            <div class="col-md-2">
                                                                <img src="https://salt.tikicdn.com/cache/750x750/ts/product/6f/c4/48/574854f032ae36fc0d0a57b61f588965.jpg.webp"
                                                                    class="img-fluid" alt="..." />
                                                            </div>
                                                            <div class="col-md-10">
                                                                <div class="partcenter card-body">
                                                                    <div class="content">
                                                                        <h5 class="card-title">
                                                                            ${detail.cartdetail_book.TENSACH}</h5>
                                                                        <p class="card-text">
                                                                            <fmt:formatNumber value="${detail.DONGIA}"
                                                                                type="currency" currencySymbol="đ"
                                                                                maxFractionDigits="0" />
                                                                        </p>
                                                                        <div class="wrapper">
                                                                            <label>Số lượng </label>
                                                                            <div class="group-input">
                                                                                <button type="button"
                                                                                    class="btn btn-outline-secondary"
                                                                                    onclick="adjustQuantity(${status.index}, false)">
                                                                                    <i class="bi bi-dash"></i>
                                                                                </button>
                                                                                <input type="text"
                                                                                    value="${detail.SOLUONG}"
                                                                                    class="input"
                                                                                    id="quantity-${status.index}"
                                                                                    readonly />
                                                                                <button type="button"
                                                                                    class="btn btn-outline-secondary"
                                                                                    onclick="adjustQuantity(${status.index}, true)">
                                                                                    <i class="bi bi-plus"></i>
                                                                                </button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <a href="cart/delete-cart-detail/${detail.cartdetail_book.MASACH}.htm"
                                                                        class="btn-delete btn btn-danger"
                                                                        onclick="return confirm('Bạn có chắc muốn xóa sản phẩm ${detail.cartdetail_book.TENSACH} không?')">Xóa
                                                                        sản phẩm </a>
                                                                    <div class="form-check">
                                                                        <c:choose>
                                                                            <c:when test="${detail.CHON == 1}">
                                                                                <input class="form-check-input"
                                                                                    type="checkbox"
                                                                                    id="flexCheckChecked-${status.index}"
                                                                                    checked="checked"
                                                                                    onclick="updateHiddenInput(${status.index})">
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <input class="form-check-input"
                                                                                    type="checkbox"
                                                                                    id="flexCheckChecked-${status.index}"
                                                                                    onclick="updateHiddenInput(${status.index})">
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                        <label class="form-check-label"
                                                                            for="flexCheckChecked-${status.index}"></label>
                                                                    </div>
                                                                    <form:form action="cart/update-cart-detail.htm"
                                                                        modelAttribute="detail">
                                                                        <input type="hidden" name="MASACH"
                                                                            value="${detail.cartdetail_book.MASACH}">
                                                                        <input type="hidden" name="DONGIA"
                                                                            value="${detail.DONGIA}">
                                                                        <input type="hidden"
                                                                            id="formquantity${status.index}"
                                                                            name="SOLUONG" value="${detail.SOLUONG}">
                                                                        <input type="hidden"
                                                                            id="hiddencheckbox${status.index}"
                                                                            name="CHON" value="${detail.CHON}">
                                                                            <input type="hidden"
                                                                            id="hiddencheckbox${status.index}"
                                                                            name="CHON" value="${detail.CHON}">
                                                                            <input type="hidden"
                                                                            id="hiddencheckbox${status.index}"
                                                                            name="CHON" value="${detail.CHON}">
                                                                            <input type="hidden"
                                                                            id="hiddencheckbox${status.index}"
                                                                            name="CHON" value="${detail.CHON}">
                                                                        <button type="submit"
                                                                            class="btn btn-primary">Chỉnh sửa</button>
                                                                    </form:form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                        <div>
                                            <a href="shop.htm" class="btn btn-primary">Quay lại cửa hàng</a>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-4 pd5">
                                        <div class="card">
                                            <div class="card-body">
                                                <h5 class="card-title">Đơn hàng</h5>
                                                <p class="card-text">Tổng tiền</p>
                                                <p class="card-text">
                                                    <fmt:formatNumber value="${totalmoney}" type="currency"
                                                        currencySymbol="đ" maxFractionDigits="0" />
                                                </p>

                                                <a href="bill/check-out.htm" class="btn btn-primary">Thanh toán</a>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <script>
                        function adjustQuantity(index, increment) {
                            try {
                                var quantityInput = document.getElementById('quantity-' + index);
                                if (!quantityInput) {
                                    throw new Error("Không thể tìm thấy phần tử với id 'quantity-" + index + "'");
                                }
                                var currentQuantity = parseInt(quantityInput.value);
                                if (isNaN(currentQuantity)) {
                                    throw new Error("Giá trị của quantityInput không phải là một số hợp lệ");
                                }
                                if (increment) {
                                    quantityInput.value = currentQuantity + 1;
                                } else if (currentQuantity > 1) { // Prevents quantity from going below 1
                                    quantityInput.value = currentQuantity - 1;
                                }
                                updateCart(index);
                            } catch (error) {
                                console.error(error.message);
                            }
                        }

                        function updateCart(index) {
                            try {
                                var quantityInput = document.getElementById('quantity-' + index);
                                if (!quantityInput) {
                                    throw new Error("Không thể tìm thấy phần tử với id 'quantity-" + index + "'");
                                }
                                var currentQuantity = parseInt(quantityInput.value);
                                if (isNaN(currentQuantity)) {
                                    throw new Error("Giá trị của quantityInput không phải là một số hợp lệ");
                                }
                                var formQuantityInput = document.getElementById('formquantity' + index);
                                if (!formQuantityInput) {
                                    throw new Error("Không thể tìm thấy phần tử với id 'formquantity" + index + "'");
                                }
                                var newformQuantityInput=formQuantityInput.value;
                                formQuantityInput.value = currentQuantity-newformQuantityInput;
                            } catch (error) {
                                console.error(error.message);
                            }
                        }

                        function updateHiddenInput(index) {
                            try {
                                var checkbox = document.getElementById("flexCheckChecked-" + index);
                                if (!checkbox) {
                                    throw new Error("Không thể tìm thấy phần tử với id 'flexCheckChecked-" + index + "'");
                                }
                                var hiddenInput = document.getElementById('hiddencheckbox' + index);
                                if (!hiddenInput) {
                                    throw new Error("Không thể tìm thấy phần tử với id 'hiddencheckbox-" + index + "'");
                                }
                                var number = checkbox.checked ? 1 : 0;
                                hiddenInput.value = number;
                            } catch (error) {
                                console.error(error.message);
                            }
                        }
                        console.log("hi")
                    </script>
                </div>