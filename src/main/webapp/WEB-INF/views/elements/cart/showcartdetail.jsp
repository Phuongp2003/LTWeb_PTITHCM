<%@ page pageEncoding="UTF-8" %>
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
            justify-content:space-between;
        }
        .cart-detail .btn-delete{
            height: 2.5rem;
            width: 4rem;
        }
    </style>
    <div class="cart-detail container-fluid" style="width: 80%">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="${pageContext.request.contextPath}/home.htm">Trang chủ</a>
                </li>
                <li class="breadcrumb-item active" aria-current="page">Giỏ hàng</li>
            </ol>
        </nav>
        <div class="row">
            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-8 pd5">
                <div class="card mb-3">
                    <div class="row g-0">
                        <div class="col-md-2">
                            <img src="https://salt.tikicdn.com/cache/750x750/ts/product/6f/c4/48/574854f032ae36fc0d0a57b61f588965.jpg.webp" class="img-fluid" alt="..." />
                        </div>
                        <div class="col-md-10">
                            <div class="partcenter card-body">
                                <div class="content">
                                    <h5 class="card-title">Cuộc sống thật thú dị</h5>
                                    <p class="card-text">30000</p>
                                    <div class="wrapper">
                                        <label>Số lượng</label>
                                        <div class="group-input">
                                            <button class="btn btn-outline-secondary">
                                                <i class="bi bi-dash"></i>
                                            </button>
                                            <input type="text" value="1" class="input" />
                                            <button class="btn btn-outline-secondary">
                                                <i class="bi bi-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <a href="#" class="btn-delete btn btn-danger">Xóa sản phẩm</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-4 pd5">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Đơn hàng</h5>
                        <p class="card-text">Tổng tiền</p>
                        <p class="card-text">300000</p>
                        <a href="#" class="btn btn-danger">Thanh toán</a>
                    </div>
                </div>
            </div>
        </div>
    </div>