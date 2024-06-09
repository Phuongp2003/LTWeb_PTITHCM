<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<style>
	.forum-post-create {
		border: solid 1px black;
		border-radius: 5px;
		margin-top: 20px;
		padding: 10px 5px;
	}
	
	.forum-post-create .post-input {
		width: 100%;
		display: flex;
		margin-bottom: 5px;
	}
	
	.forum-post-create .form-title-1 {
		width: 20%
	}
	
	.forum-post-create .form-input-1 {
		width: 80%;
	}
</style>

<div class="forum-post-create container-fluid w-75">
	<form:form method="POST" action="forum/create-success.htm" modelAttribute="post">
		<div class="post-title post-input">
			<form:label class="form-title-1" path="title">Tiêu đề: </form:label>
			<form:input class="form-input-1" path="title" />
		</div>
		<div class="post-description post-input">
			<form:label class="form-title-1" path="description">Mô tả(tóm tắt): </form:label>
			<form:input class="form-input-1" path="description" />
		</div>
		<div class="post-controller">
			<button type="button" name="add-element-row" title="Thêm một khối lơn mới"><i class="bi bi-plus-square"></i></button>
		</div>
		<form:label path="content">Nội dung: </form:label>
		<div class="post-contents">
			<div class="content-row" id="content-row-0">
				<div class="post-element-controller" id="e-controller-0">
					<div class="pec-row1">
						<button type="button" name="delete-element" title="Xóa cả khối và các thành phần."><i class="bi bi-trash3"></i></button>
						<button type="button" name="set-left" title="Căn trái."><i class="bi bi-text-left"></i></button>
						<button type="button" name="set-right" title="Căn phải."><i class="bi bi-text-right"></i></button>
					</div>
					<div class="pec-row2">
						<button type="button" name="set-top" title="Dồn các thành phần lên đỉnh."><i class="bi bi-align-top"></i></button>
						<button type="button" name="set-middle" title="Dồn các thành phần vào giữa."><i class="bi bi-align-center"></i></button>
						<button type="button" name="set-bottom" title="Dồn các thành phần xuống đáy."><i class="bi bi-align-bottom"></i></button>
					</div>
					<div class="pec-row3">
						<button type="button" name="center-element-1" title="Căn giữa sát cạnh.">Lv1</button>
						<button type="button" name="center-element-2" title="Căn đều nội dung.">Lv2</button>
						<button type="button" name="center-element-3" title="Căn nội dung gần cạnh.">Lv3</button>
						<button class="non-disabled-btn" type="button" name="center-element-4" title="Gom toàn bộ nội dung vào giữa.">Lv4</button>
					</div>
					<div class="pec-row4">
						<button type="button" name="add-text" title="Thêm một khối chữ."><i class="bi bi-card-text"></i></button>
						<button type="button" name="add-image" title="Thêm một khối hình."><i class="bi bi-file-image"></i></button>
					</div>
				</div>
			</div>
		</div>
		<div class="mt-2 message-place"> </div>
		<button type="submit">Tạo bài viết</button>
	</form:form>
	<input type="file" id="imageInput" style="display: none;" accept="image/*">
</div>

<jsp:include page="script_post_edit.jsp" />
