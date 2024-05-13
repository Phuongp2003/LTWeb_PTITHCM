<%@ page pageEncoding="UTF-8" %>
<div class="product-detail container-fluid" style="width: 80%;">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/home.htm">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/shop/typebook/${category.MATL}.htm">KINH DỊ</a></li>
            <li class="breadcrumb-item active" aria-current="page">Cuộc đời thú vị</li>
        </ol>
    </nav>
    <div class="row">
        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-6 pd5">
            <div class="card">
                <img src="https://salt.tikicdn.com/cache/750x750/ts/product/6f/c4/48/574854f032ae36fc0d0a57b61f588965.jpg.webp"
                    class="card-img-top" alt="...">
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-6 pd5">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">${book.TENSACH}</h5>
                    <p class="card-text">${book.author.HO} ${book.author.TEN}</p>
                    <p class="card-text"><fmt:formatNumber value="${book.GIA}" type="currency" currencySymbol="đ" maxFractionDigits="0"/></p>
                    <p class="card-text">Số lượng</p>
                    <a href="${pageContext.request.contextPath}/cart.htm" class="btn btn-primary">Thêm vào giỏ</a>
                    <a href="#" class="btn btn-primary">Mua ngay</a>
                </div>
            </div>
        </div>
    </div>
</div>