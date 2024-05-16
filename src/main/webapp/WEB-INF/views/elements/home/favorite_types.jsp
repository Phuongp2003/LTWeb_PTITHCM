<%@ page pageEncoding="UTF-8" %>
	<div class="favorite-types container-fluid text-center" style="width:80%; margin-top: 2rem;">
		<h2 class="title align-middle ">Thể Loại Sách Ưu Thích</h2>
		<div class="row">
			<c:forEach var="category" items="${categories}">
				<div class="col-md-4 col-sm-12 col-lg-4">
					<a href="">
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