<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="forum-post-create container-fluid w-75">
	
	<form:form method="POST" action="forum/create-success.htm" modelAttribute="post">
		<div class="port-title">
			<form:label path="title">Title: </form:label>
			<form:input path="title" />
		</div>
		<div class="port-description">
			<form:label path="description">Description: </form:label>
			<form:input path="description" />
		</div>
		<div class="post-controller">
			<button type="button" name="add-element-row" title="Add text-block"><i class="bi bi-plus-square"></i></button>
		</div>
		<form:label path="content">Content: </form:label>
		<div class="post-contents">
			<div class="content-row" id="content-row-0">
				<div class="post-element-controller" id="e-controller-0">
					<div class="pec-row1">
						<button type="button" name="delete-element" title="Remove this element."><i class="bi bi-trash3"></i></button>
						<button type="button" name="set-left" title="Left align this element."><i class="bi bi-text-left"></i></button>
						<button type="button" name="set-right" title="Right align this element."><i class="bi bi-text-right"></i></button>
					</div>
					<div class="pec-row2">
						<button type="button" name="set-top" title="Remove this element."><i class="bi bi-align-top"></i></button>
						<button type="button" name="set-middle" title="Left align this element."><i class="bi bi-align-center"></i></button>
						<button type="button" name="set-bottom" title="Right align this element."><i class="bi bi-align-bottom"></i></button>
					</div>
					<div class="pec-row3">
						<button type="button" name="center-element-1" title="Center lv 1 this element.">Lv1</button>
						<button type="button" name="center-element-2" title="Center lv 2 this element.">Lv2</button>
						<button type="button" name="center-element-3" title="Center lv 3 this element.">Lv3</button>
						<button type="button" name="center-element-4" title="Center lv 4 this element.">Lv4</button>
					</div>
					<div class="pec-row4">
						<button type="button" name="add-text" title="Add text block to this element."><i class="bi bi-card-text"></i></button>
						<button type="button" name="add-image" title="Add image to this element."><i class="bi bi-file-image"></i></button>
					</div>
				</div>
			</div>
		</div>
		<div class="mt-2 message-place"> </div>
		<button type="submit">Save</button>
	</form:form>
	<input type="file" id="imageInput" style="display: none;" accept="image/*">
</div>

<jsp:include page="script_post_edit.jsp" />
