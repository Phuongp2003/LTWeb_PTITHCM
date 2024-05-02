<style>
	.content-row {
		display: flex;
		justify-content: center;
		min-height: 20px;
		border: blue solid;
		overflow: overlay;
	}
	
	.post-image {
		position: relative;
		display: inline-block;
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
	
	.post-text textarea {
		width: 100%;
		height: 47px;
		resize: none;
	}
	
	.post-image .img-size-controller input {
		width: 50%;
		display: inline-block;
	}
	
	.post-image:hover .img-size-controller {
		display: flex;
	}
	
	.post-element-controller {
		width: 320px;
		display: none;
		width: max-content;
		position: absolute;
		left: 25%;
		background-color: rgba(0, 0, 0, 0.5);
		padding: 5px;
		border-radius: 5px;
		z-index: 50;
		flex-direction: column;
		transform: translateY(-130px);
	}
	
	.post-image .post-element-controller {
		top: 30px
	}
	
	.post-element-controller button {
		margin: 3px;
		padding: 5px 10px;
		background-color: #fff;
		border: none;
		border-radius: 3px;
		cursor: pointer;
	}
	
	.post-element-controller button:hover {
		background-color: #f0f0f0;
	}
</style>


<div class="forum-post-create container-fluid w-75">
	<div class="post-controller">
		<button type="button" name="add-element-row" title="Add text-block"><i class="bi bi-card-text"></i></button>
	</div>
	<form action="create-success" method="POST">
		<div class="port-title">
			<input type="text" name="title" id="title" placeholder="Title">
		</div>
		<div class="post-contents">
			<div class="content-row" id="content-row-0">
				<div class="post-element-controller" id="e-controller-0">
					<div class="pec-row1">
						<h4 style="display: contents;">Align</h4>
						<button type="button" name="delete-element" title="Remove this element.">Delete</button>
						<button type="button" name="set-left" title="Left align this element.">Left</button>
						<button type="button" name="set-right" title="Right align this element.">Right</button>
					</div>
					<div class="pec-row2">
						<h4 style="display: contents;">Center</h4>
						<button type="button" name="center-element-1" title="Center lv 1 this element.">Lv1</button>
						<button type="button" name="center-element-2" title="Center lv 2 this element.">Lv2</button>
						<button type="button" name="center-element-3" title="Center lv 3 this element.">Lv3</button>
						<button type="button" name="center-element-4" title="Center lv 4 this element.">Lv4</button>
					</div>
					<div class="pec-row3">
						<h4 style="display: contents;">Add</h4>
						<button type="button" name="add-text" title="Add text block to this element.">+Text</button>
						<button type="button" name="add-image" title="Add image to this element.">+Image</button>
					</div>
				</div>
				
			</div>
		</div>
	</form>
	<input type="file" id="imageInput" style="display: none;" accept="image/*">
</div>

<script>
	$("textarea").each(function() {
		this.setAttribute("style", "height:" + (this.scrollHeight) + "px;overflow-y:hidden;");
	}).on("input", function() {
		this.style.height = 0;
		this.style.height = (this.scrollHeight) + "px";
	});
</script>

<script>
	$(document).ready(function() {
		// Counter for content rows
		var contentRowCounter = 1;
		var currentEvent;
		
		// Function to add a new text block
		function addTextBlock() {
			contentRowCounter++;
			var newTextBlock = '<div class="content-row" id="content-row-' + contentRowCounter + '">' +
				'<div class="post-element-controller" id="e-controller-' + contentRowCounter + '">' +
				'<div class="pec-row1">' +
				'<h4 style="display: contents;">Align</h4>' +
				'<button type="button" name="delete-element" title="Remove this element.">Delete</button>' +
				'<button type="button" name="set-left" title="Left align this element.">Left</button>' +
				'<button type="button" name="set-right" title="Right align this element.">Right</button>' +
				'</div>' +
				'<div class="pec-row2">' +
				'<h4 style="display: contents;">Center</h4>' +
				'<button type="button" name="center-element-1" title="Center lv 1 this element.">Lv1</button>' +
				'<button type="button" name="center-element-2" title="Center lv 2 this element.">Lv2</button>' +
				'<button type="button" name="center-element-3" title="Center lv 3 this element.">Lv3</button>' +
				'<button type="button" name="center-element-4" title="Center lv 4 this element.">Lv4</button>' +
				'</div>' +
				'<div class="pec-row3">' +
				'<h4 style="display: contents;">Add</h4>' +
				'<button type="button" name="add-text" title="Add text block to this element.">+Text</button>' +
				'<button type="button" name="add-image" title="Add image to this element.">+Image</button>' +
				'</div>' +
				'</div>' +
				'</div>';
			$('.post-contents').append(newTextBlock);
		}
		
		// Event listener for add text block button
		$('[name="add-element-row"]').click(addTextBlock);
		
		// Event listener for hovering over content rows
		$('.post-contents').on('mouseenter', '.content-row', function() {
			$(this).find('.post-element-controller').css('display', 'flex');
		}).on('mouseleave', '.content-row', function() {
			$(this).find('.post-element-controller').css('display', 'none');
		});
		
		// Event listener for delete element button
		$('.post-contents').on('click', '[name="delete-element"]', function() {
			$(this).closest('.content-row').remove();
		});
		
		// Event listener for set-left button
		$('.post-contents').on('click', '[name="set-left"]', function() {
			$(this).closest('.content-row').css('justify-content', 'flex-start');
		});
		
		// Event listener for set-right button
		$('.post-contents').on('click', '[name="set-right"]', function() {
			$(this).closest('.content-row').css('justify-content', 'flex-end');
		});
		
		// Event listener for center-element buttons
		$('.post-contents').on('click', '[name^="center-element-"]', function() {
			var justifyValue = '';
			switch ($(this).attr('name')) {
				case 'center-element-1':
					justifyValue = 'space-between';
					break;
				case 'center-element-2':
					justifyValue = 'space-evenly';
					break;
				case 'center-element-3':
					justifyValue = 'space-around';
					break;
				case 'center-element-4':
					justifyValue = 'center';
					break;
			}
			$(this).closest('.content-row').css('justify-content', justifyValue);
		});
		
		// Event listener for add-text button
		$('.post-contents').on('click', '[name="add-text"]', function() {
			var contentRow = $(this).closest('.content-row');
			var textBlock = '<div class="post-text" style="width: 100%;">' +
				'<textarea name="content-' + contentRowCounter + '" id="content-' + contentRowCounter + '"></textarea>' +
				'<div class="row-element-controller">' +
				'<button type="button" name="delete-element" title="Remove this element."></button>' +
				'<button type="button" name="set-center" title="Align center this element."></button>' +
				'<button type="button" name="set-left" title="Left align this element."></button>' +
				'<button type="button" name="set-right" title="Right align this element."></button>' +
				'</div>' +
				'</div>';
			contentRow.append(textBlock);
			contentRowCounter++;
		});
		
		// Event listener for add-image button
		$('.post-contents').on('click', '[name="add-image"]', function() {
			// Trigger file input
			currentEvent = this;
			$('#imageInput').click();
		});
		
		// Handle image upload
		$('#imageInput').change(function() {
			var contentRow = $(currentEvent).closest('.content-row');
			var file = this.files[0];
			if (file) {
				var reader = new FileReader();
				reader.onload = function(event) {
					var imageUrl = event.target.result;
					console.log("$ ~ imageUrl:", imageUrl)
					var imageBlock = '<div class="post-image" id="image-' + contentRowCounter + '">' +
						'<img src="' + imageUrl + '" alt="Image" width="200" height="200">' +
						'<div class="row-element-controller">' +
						'<button type="button" name="delete-element" title="Remove this element."></button>' +
						'<button type="button" name="set-center" title="Align center this element."></button>' +
						'<button type="button" name="set-left" title="Left align this element."></button>' +
						'<button type="button" name="set-right" title="Right align this element."></button>' +
						'</div>' +
						'</div>';
					contentRow.append(imageBlock);
					contentRowCounter++;
				};
				reader.readAsDataURL(file);
			}
		});
	});
</script>

<div class="row-element-controller">
	<button type="button" name="delete-element" title="Remove this element."></button>
	<button type="button" name="set-center" title="Align center this element."></button>
	<button type="button" name="set-left" title="Left align this element."></button>
	<button type="button" name="set-right" title="Right align this element."></button>
</div>
