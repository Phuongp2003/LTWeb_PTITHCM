<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Giỏ hàng</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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

    .cart-detail .btn-delete {
      height: 2.5rem;
      width: 4rem;
    }
  </style>
</head>

<body>
  <div class="container-fluid" style="width: 80%">
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
          <div class="row justify-content-center">
            <div class="col-md-6 text-center">
              <h1>Giỏ hàng của bạn đang trống.</h1>
              <a href="shop.htm" class="btn btn-primary">Quay lại cửa hàng</a>
            </div>
          </div>
        </c:when>
        <c:otherwise>
          <div class="row">
            <div class="col-md-8">

              <c:forEach var="detail" items="${cartdetail}" varStatus="status">
                <div class="card mb-3">
                  <div class="row no-gutters">
                    <div class="col-md-4 d-flex flex-column align-items-center justify-content-center">
                      <img src="https://salt.tikicdn.com/cache/750x750/ts/product/6f/c4/48/574854f032ae36fc0d0a57b61f588965.jpg.webp" class="img-fluid" alt="..." style="height: 100%;" />
                    </div>

                    <div class="col-md-8">
                      <div class="card-body d-flex flex-column">
                        <!-- Sửa ở đây -->
                        <div class="form-check ml-auto">
                          <c:choose>
                            <c:when test="${detail.CHON == 1}">
                              <input class="form-check-input" type="checkbox" id="flexCheckChecked-${status.index}" checked="checked" onclick="updateHiddenInput(${status.index});">
                            </c:when>
                            <c:otherwise>
                              <input class="form-check-input" type="checkbox" id="flexCheckChecked-${status.index}" onclick="updateHiddenInput(${status.index});">
                            </c:otherwise>
                          </c:choose>
                        </div>


                        <h5 class="card-title">${detail.cartdetail_book.TENSACH}
                        </h5>
                        <p class="card-text">
                          <fmt:formatNumber value="${detail.DONGIA}" type="currency" currencySymbol="đ" maxFractionDigits="0" />
                        </p>
                        <div class="wrapper">
                          <label class="mr-2">Số lượng </label>
                          <div class="input-group input-group-sm">
                            <div class="input-group-prepend">
                              <button type="button" class="btn btn-outline-secondary" onclick="adjustQuantity(${status.index}, false)">
                                <i class="bi bi-dash"></i>
                              </button>
                            </div>
                            <input type="text" value="${detail.SOLUONG}" class="form-control" id="quantity-${status.index}" data-soluong="${detail.SOLUONG}" readonly />

                            <div class="input-group-append">
                              <button type="button" class="btn btn-outline-secondary" onclick="adjustQuantity(${status.index}, true)">
                                <i class="bi bi-plus"></i>
                              </button>
                            </div>
                          </div>
                        </div>
                        <div class="d-flex justify-content-between align-items-center">
                          <div>
                            <a href="cart/delete-cart-detail/${detail.cartdetail_book.MASACH}.htm" class="btn-delete btn btn-danger" onclick="return confirm('Bạn có chắc muốn xóa sản phẩm ${detail.cartdetail_book.TENSACH} không?')">Xóa
                              sản phẩm </a>
                          </div>
                          <div>
                            <form:form action="cart/update-cart-detail.htm" modelAttribute="detail">
                              <input type="hidden" name="MASACH" value="${detail.cartdetail_book.MASACH}">
                              <input type="hidden" name="DONGIA" value="${detail.DONGIA}">
                              <input type="hidden" id="formquantity${status.index}" name="SOLUONG" value="${detail.SOLUONG}">
                              <input type="hidden" id="hiddencheckbox${status.index}" name="CHON" value="${detail.CHON}">
                              <button type="submit" class="btn btn-primary" onclick="updateCart(${status.index});updateHasSelectedProduct(${status.index});">Chỉnh
                                sửa</button>

                            </form:form>
                          </div>


                        </div>




                      </div>
                    </div>
                  </div>
                </div>
              </c:forEach>
              <div class="row justify-content-center">
                <div class="col-md-6 d-flex justify-content-start">

                  <a href="shop.htm" class="btn btn-primary">Quay lại cửa hàng</a>
                </div>
              </div>

            </div>
            <div class="col-md-4">
    <div class="card">
      <div class="card-body d-flex flex-column h-100">
        <h5 class="card-title">Đơn hàng</h5>
        <p class="card-text">Tổng tiền</p>
        <p class="card-text">
          <fmt:formatNumber value="${totalmoney}" type="currency" currencySymbol="đ" maxFractionDigits="0" />
        </p>
        <div>
          <c:choose>
            <c:when test="${totalmoney != 0}">
              <a href="bill/check-out.htm" class="btn btn-primary">Thanh toán</a>
            </c:when>
            <c:otherwise>
              <button href="bill/check-out.htm" class="btn btn-primary" disabled>Thanh toán</button>
            </c:otherwise>
          </c:choose>
        </div>
      </div>
    </div>
  </div>
          </div>


        </c:otherwise>
      </c:choose>
    </div>

  </div>
  <!-- <div class="row justify-content-center">
    <div class="col-md-6 d-flex justify-content-start">
      
      <a href="shop.htm" class="btn btn-primary">Quay lại cửa hàng</a>
    </div>
  </div> -->


  


  <script>
    // Lưu trữ giá trị SOLUONG ban đầu
    var originalQuantities = [];

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
        // updateCart(index); // Gọi hàm để cập nhật SOLUONG của form
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
        var originalQuantity = originalQuantities[index]; // Lấy giá trị SOLUONG ban đầu
        var newQuantity = currentQuantity - originalQuantity; // Số lượng mới
        var formQuantityInput = document.getElementById('formquantity' + index);
        // Kiểm tra nếu không có tác động lên form-control
        if (newQuantity === 0) {
          formQuantityInput.value = 0;
        } else {
          formQuantityInput.value = newQuantity; // Cập nhật giá trị SOLUONG của form
        }
      } catch (error) {
        console.error(error.message);
      }
    }

    function updateHasSelectedProduct(index) {
      var checkbox = document.getElementById("flexCheckChecked-" + index);
      var hasSelectedProduct = document.getElementById("hasSelectedProduct");
      if (checkbox.checked) {
        hasSelectedProduct.value = "true";
      } else {
        hasSelectedProduct.value = "false";
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

    // Hàm này được gọi khi trang tải xong để lấy giá trị SOLUONG ban đầu và lưu trữ chúng
    window.onload = function() {
      var quantityInputs = document.querySelectorAll('[id^="quantity-"]');
      quantityInputs.forEach(function(input, index) {
        originalQuantities[index] = parseInt(input.getAttribute('data-soluong'));
      });
    };

    console.log("hi")
  </script>

</body>


</html>