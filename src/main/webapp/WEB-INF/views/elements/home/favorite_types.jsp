<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<div class="favorite-types container-fluid text-center" style="width:80%; margin-top: 2rem;">
	<h2 class="title align-middle">Khám phá theo danh mục</h2>
	<div class="row">
		<c:forEach var="category" items="${categories}">
			<div class="col-md-4 col-sm-12 col-lg-4">
				<a href="shop/typebook/${category.MATL}.htm">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">${category.TENTL}</h5>
						</div>
					</div>
				</a>
			</div>
		</c:forEach>
	</div>
</div>
