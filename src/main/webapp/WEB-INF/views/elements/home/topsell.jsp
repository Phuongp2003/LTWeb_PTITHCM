<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<div class="top-sell container-fluid mt-4" style="width:80%;">


  <h2 class="title align-middle text-center">Top sách bán chạy - best seller</h2>
  <div class="row">
    <c:forEach var="book" items="${books}">

      <div class="col-md-3 col-md-2 col-sm-12">
        <c:if test="${book.SOLUONGTON - book.SOLUONGBAN > 0}">
          <a href="book/${book.MASACH}.htm">
        </c:if>

        <!-- <a href="book/${book.MASACH}.htm"> -->
          <div class="card">
            <img src="resources/imgs/products/${book.ANH}" class="card-img-top" alt="..." style="width: 18.5rem; min-height: 24rem;">
            <div class="card-body">
              <h5 class="card-text">
                <fmt:formatNumber value="${book.GIA}" type="currency" currencySymbol="đ" maxFractionDigits="0" />
              </h5>
              <p class="card-text text-capitalize fs-6">${book.author.HO} ${book.author.TEN}</p>
              <p class="card-text text-capitalize fs-5" style="height: 3.7rem;">${book.TENSACH}</p>

              <div class="d-flex justify-content-between">
                <div><i class="bi bi-star-fill" style="color:#FFDB00; font-size: 0.8rem;"></i><i class="bi bi-star-fill" style="color:#FFDB00; font-size: 0.8rem;"></i><i class="bi bi-star-fill" style="color:#FFDB00; font-size: 0.8rem;"></i><i class="bi bi-star-fill" style="color:#FFDB00; font-size: 0.8rem;"></i></div>
                <div class="star-detail">
                  <c:choose>
                    <c:when test="${f.VOTE == 1}">
                      <i class="bi bi-star-fill" style="color:#FFDB00; font-size: 0.8rem;"></i>
                    </c:when>
                    <c:when test="${f.VOTE == 2}">
                      <i class="bi bi-star-fill" style="color:#FFDB00; font-size: 0.8rem;"></i><i class="bi bi-star-fill" style="color:#FFDB00;"></i>
                    </c:when>
                    <c:when test="${f.VOTE == 3}">
                      <i class="bi bi-star-fill" style="color:#FFDB00; font-size: 0.8rem;"></i><i class="bi bi-star-fill" style="color:#FFDB00;"></i><i class="bi bi-star-fill" style="color:#FFDB00;"></i>
                    </c:when>
                    <c:when test="${f.VOTE == 4}">
                      <i class="bi bi-star-fill" style="color:#FFDB00; font-size: 0.8rem;"></i><i class="bi bi-star-fill" style="color:#FFDB00; font-size: 0.8rem;"></i><i class="bi bi-star-fill" style="color:#FFDB00; font-size: 0.8rem;"></i><i class="bi bi-star-fill" style="color:#FFDB00; font-size: 0.8rem;"></i>
                    </c:when>
                    <c:when test="${f.VOTE == 5}">
                      <i class="bi bi-star-fill" style="color:#FFDB00; font-size: 0.8rem;"></i><i class="bi bi-star-fill" style="color:#FFDB00; font-size: 0.8rem;"></i><i class="bi bi-star-fill" style="color:#FFDB00; font-size: 0.8rem;"></i><i class="bi bi-star-fill" style="color:#FFDB00; font-size: 0.8rem;"></i><i class="bi bi-star-fill" style="color:#FFDB00; font-size: 0.8rem;"></i>
                    </c:when>
                  </c:choose>
                </div>
                <div class="d-flex gap-3">
                  <div class="sold">Đã bán ${book.SOLUONGBAN}/${book.SOLUONGTON}
                    ${book.SOLUONGTON - book.SOLUONGBAN == 0 ? "Hết sách" : ""}
                  </div>
                </div>
              </div>
            </div>
          </div>
        </a>
      </div>
    </c:forEach>
  </div>

</div>

