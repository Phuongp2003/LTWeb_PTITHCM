<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<div class="container-fluid text-center top-sell" style="width:80%; margin-top: 2rem;">
	<h2 class="title align-middle">Top Sách Bán Chạy - Best Seller</h2>
	<div class="row">
		<c:forEach var="book" items="${books}">
			
			<div class="col-md-3 col-md-2 col-sm-12">
				<a href="${pageContext.request.contextPath}/book/${book.MASACH}.htm">
					<div class="card">
						<img src="https://salt.tikicdn.com/cache/750x750/ts/product/6f/c4/48/574854f032ae36fc0d0a57b61f588965.jpg.webp" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">${book.TENSACH}</h5>
							<p class="card-text">${book.author.HO} ${book.author.TEN}</p>
							<p class="card-text">
								<fmt:formatNumber value="${book.GIA}" type="currency" currencySymbol="đ" maxFractionDigits="0" />
							</p>
						</div>
					</div>
				</a>
			</div>
		</c:forEach>
	</div>
</div>
