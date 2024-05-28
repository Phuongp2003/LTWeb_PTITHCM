<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<style>
	.content-row {
		display: flex;
		justify-content: center;
		min-height: 20px;
		border: rgba(17, 0, 250, 0.25) solid 1px;
		position: relative;
	}
	
	.content-row:hover {
		border: blue solid 1px;
	}
	
	.post-content {
		position: relative;
		height: max-content;
	}
	
	.post-image {
		position: relative;
		display: inline-block;
		height: max-content;
	}
	
	.post-image img {
		border: 1px solid #ccc;
	}
	
	.post-image .img-size-controller {
		width: 150px;
		margin-right: 5px;
		display: none;
		position: absolute;
	}
	
	.post-text .ctextarea {
		width: 100%;
		border: rgba(17, 0, 250, 0.25) solid 1px;
	}
	
	.post-text .ctextarea:hover {
		border: rgba(blue) solid 1px;
	}
	
	.post-text .ctextarea:active {
		border: rgba(blue) solid 1px;
	}
	
	.post-image .img-size-controller input {
		width: 50%;
		display: inline-block;
	}
	
	.post-content:hover>.row-element-controller,
	.post-content:focus-within>.row-element-controller {
		display: flex;
	}
	
	.post-element-controller {
		display: none;
		width: max-content;
		position: absolute;
		background-color: rgba(0, 0, 0, 0.5);
		padding: 5px;
		border-radius: 5px;
		z-index: 50;
		flex-direction: column;
		left: 0;
		bottom: -170px;
	}
	
	.post-image .post-element-controller {
		top: 0;
		transform: translateY(-100%);
	}
	
	
	.post-image .row-element-controller {
		display: none;
		width: max-content;
		position: absolute;
		background-color: rgba(0, 0, 0, 0.5);
		padding: 5px;
		border-radius: 5px;
		z-index: 50;
		flex-direction: column;
		top: 0;
		transform: translateY(-100%);
	}
	
	.post-text .row-element-controller {
		display: none;
		width: max-content;
		position: absolute;
		background-color: rgba(0, 0, 0, 0.5);
		padding: 5px;
		border-radius: 5px;
		z-index: 50;
		flex-direction: column;
		top: 0;
		transform: translateY(-100%);
	}
	
	.row-element-controller button,
	.post-element-controller button {
		margin: 3px;
		padding: 5px 10px;
		background-color: #fff;
		border: none;
		border-radius: 3px;
		cursor: pointer;
	}
	
	.row-element-controller button:hover,
	.post-element-controller button:hover {
		background-color: #f0f0f0;
	}
	
	.font-size-controller {
		width: 50px;
		overflow: none;
	}
	
	.dragbar {
		resize: both;
		overflow: auto;
		-webkit-user-select: none;
		/* Chrome, Safari, Opera */
		-moz-user-select: none;
		/* Firefox all */
		-ms-user-select: none;
		/* IE 10+ */
		user-select: none;
	}
	
	.handle {
		position: absolute;
		height: 6px;
		width: 6px;
		border: 1px solid #89B;
		background: #9AC;
	}
	
	.EE,
	.SE {
		right: -4px;
	}
	
	.SS,
	.SE {
		bottom: -4px;
	}
	
	
	.SE {
		cursor: nw-resize;
	}
	
	.SS {
		cursor: n-resize;
		left: 50%;
		margin-left: -4px;
	}
	
	.EE {
		cursor: e-resize;
		top: 50%;
		margin-top: -4px;
	}
	
	.selected {
		background-color: #ECB;
		border-color: #B98;
	}
	
	.selected .handle {
		background-color: #CA9;
		border-color: #B98;
	}
</style>


<div class="forum-post-create container-fluid w-75">
	<form:form method="POST" action="forum/post/${post.id}/edit-success.htm" modelAttribute="post">
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
			${post.content}</div>
		<!-- <form:input class="post-number-e" path="format" style="display:  none;">1 0</form:input> -->
		<button type="submit">Save</button>
	</form:form>
	<input type="file" id="imageInput" style="display: none;" accept="image/*">
</div>

<jsp:include page="script_post_edit.jsp" />
