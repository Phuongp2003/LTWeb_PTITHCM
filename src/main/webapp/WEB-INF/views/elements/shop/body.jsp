<%@ page pageEncoding="UTF-8" %>
    <div class="container-fluid shop" style="width: 80%;">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pd5">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="home.htm">Trang chủ</a></li>
                        <li class="breadcrumb-item"><a href="#">Danh mục</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Tất cả sản phẩm</li>
                    </ol>
                </nav>
            </div>
        </div>
        <div class="collection">
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
                    <div class="card">
                        <div class="card-header">
                            <h4>Danh mục nhóm</h4>
                            <i class="bi bi-dash h3"></i>
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">An item</li>
                            <li class="list-group-item">A second item</li>
                            <li class="list-group-item">A third item</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9 col-md-9 col-sm-8 col-xs-12">
                    <div class="row">
                        <nav class="navbar bg-body-tertiary">
                            <div class="container-fluid">
                                <h4>Tất cả sản phẩm</h4>
                                <form class="d-flex" role="search">
                                    <input class="form-control me-2" type="search" placeholder="Search"
                                        aria-label="Search">
                                    <button class="btn btn-outline-success" type="submit">Search</button>
                                </form>
                                <div class="dropdown d-flex">
                                    <button class="btn btn-secondary dropdown-toggle" type="button"
                                        data-bs-toggle="dropdown" aria-expanded="false">
                                        Sắp xếp theo
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item active" href="#">Sản phẩm nổi bật</a></li>
                                        <li><a class="dropdown-item" href="#">Giá: tăng dần</a></li>
                                        <li><a class="dropdown-item" href="#">Giá: giảm dần</a></li>
                                        <li><a class="dropdown-item" href="#">Tên: A->Z</a></li>
                                        <li><a class="dropdown-item" href="#">Tên: Z->A</a></li>
                                        <li><a class="dropdown-item" href="#">Cũ nhất</a></li>
                                        <li><a class="dropdown-item" href="#">Mới nhất</a></li>
                                        <li><a class="dropdown-item" href="#">Bán chạy nhất</a></li>
                                    </ul>
                                </div>
                            </div>
                        </nav>
                    </div>
                    <div class="collection-product">
                        <div class="row">
                            <% for(int i=0; i < 12; i++) { %>
                                <div class="col-md-4 col-sm-12 col-lg-4">
                                    <a href="">
                                        <div class="card">
                                            <img src="https://salt.tikicdn.com/cache/750x750/ts/product/6f/c4/48/574854f032ae36fc0d0a57b61f588965.jpg.webp"
                                                class="card-img-top" alt="...">
                                            <div class="card-body">
                                                <h5 class="card-title">Card title</h5>
                                                <p class="card-text">Some quick example text to build on the card title
                                                    and make up the bulk of the card's
                                                    content.</p>
                                                <a href="#" class="btn btn-primary">Go somewhere</a>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <%}%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>