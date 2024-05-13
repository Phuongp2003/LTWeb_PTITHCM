<%@ page pageEncoding="UTF-8" %>
    <div class="container-fluid shop" style="width: 80%;">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pd5">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/home.htm">Trang chủ</a></li>
                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/cart.htm">Giỏ hàng</a></li>

                    </ol>
                </nav>
                <c:forEach var="book" items="${cart}">
                                <div class="col-md-4 col-sm-12 col-lg-4">
                                    <a href="">
                                        <div class="card">
                                            <img src="https://salt.tikicdn.com/cache/750x750/ts/product/6f/c4/48/574854f032ae36fc0d0a57b61f588965.jpg.webp"
                                                class="card-img-top" alt="...">
                                            <div class="card-body">
                                                <h5 class="card-title">${book.TENSACH}</h5>
                                                <p class="card-text">${book.author.HO} ${book.author.TEN}</p>
                                                <a href="#" class="btn btn-primary">Xem Chi Tiết</a>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </c:forEach>
            
        </div>
    </div>