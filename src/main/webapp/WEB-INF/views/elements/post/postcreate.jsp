<%@ page pageEncoding="UTF-8"%>
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
	
	.post-content:hover>.row-element-controller {
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
		top: 30px
	}
	
	
	.row-element-controller {
		display: none;
		width: max-content;
		position: absolute;
		background-color: rgba(0, 0, 0, 0.5);
		padding: 5px;
		border-radius: 5px;
		z-index: 50;
		flex-direction: column;
		top: -80px;
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
</style>


<div class="forum-post-create container-fluid w-75">
	<form action="create-success" method="POST">
		<div class="port-title">
			<input type="text" name="title" id="title" placeholder="Title">
		</div>
		<div class="post-controller">
			<button type="button" name="add-element-row" title="Add text-block"><i class="bi bi-plus-square"></i></button>
		</div>
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
	</form>
	<input type="file" id="imageInput" style="display: none;" accept="image/*">
</div>

<script>
	$(document).ready(function() {
		// Counter for content rows
		var contentRowCounter = 1;
		var currentEvent;
		
		// Function to add a new element block
		function addTextBlock() {
			contentRowCounter++;
			var newBlock = '<div class="content-row" id="content-row-' + contentRowCounter + '">' +
				'<div class="post-element-controller" id="e-controller-' + contentRowCounter + '">' +
				'<div class="pec-row1">' +
				'<button type="button" name="delete-element" title="Remove this element."><i class="bi bi-trash3"></i></button>' +
				'<button type="button" name="set-left" title="Left align this element."><i class="bi bi-text-left"></i></button>' +
				'<button type="button" name="set-right" title="Right align this element."><i class="bi bi-text-right"></i></button>' +
				'</div>' +
				'<div class="pec-row2">' +
				'<button type="button" name="set-top" title="Remove this element."><i class="bi bi-align-top"></i></button>' +
				'<button type="button" name="set-middle" title="Left align this element."><i class="bi bi-align-center"></i></button>' +
				'<button type="button" name="set-bottom" title="Right align this element."><i class="bi bi-align-bottom"></i></button>' +
				'</div>' +
				'<div class="pec-row3">' +
				'<button type="button" name="center-element-1" title="Center lv 1 this element.">Lv1</button>' +
				'<button type="button" name="center-element-2" title="Center lv 2 this element.">Lv2</button>' +
				'<button type="button" name="center-element-3" title="Center lv 3 this element.">Lv3</button>' +
				'<button type="button" name="center-element-4" title="Center lv 4 this element.">Lv4</button>' +
				'</div>' +
				'<div class="pec-row4">' +
				'<button type="button" name="add-text" title="Add text block to this element."><i class="bi bi-card-text"></i></button>' +
				'<button type="button" name="add-image" title="Add image to this element."><i class="bi bi-file-image"></i></button>' +
				'</div>' +
				'</div>' +
				'</div>';
			$('.post-contents').append(newBlock);
		}
		
		// Event listener for add-element button
		$('[name="add-element-row"]').click(function() {
			addTextBlock();
			checkAndDisableButtons();
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
					var imageBlock = '<div class="post-image post-content" id="image-' + contentRowCounter + '">' +
						'<img src="' + imageUrl + '" alt="Image" width="200" height="200">' +
						'<div class="row-element-controller">' +
						'<div class="text-controller">' +
						'<button type="button" name="delete-element-row" title="Remove this element."><i class="bi bi-trash3"></i></button>' +
						'</div>' +
						'<div class="size-controller">' +
						'<input type="number" name="ewidth" placeholder="Width" value="200"> x ' +
						'<input type="number" name="eheight" placeholder="Height" value="200">' +
						'</div>' +
						'</div>';
					contentRow.append(imageBlock);
					// Handle real-time width/height change
					$('#image-' + contentRowCounter + ' input').on('keyup', function(e) {
						if (e.keyCode === 13) { // Check if Enter key is pressed
							var maxWidth = $(this).closest('.content-row').width(); // Get width of content row
							var totalWidth = 0;
							
							// Calculate total width of all post-text and post-image elements in the content row
							$(this).closest('.content-row').find('.post-text, .post-image').each(function() {
								totalWidth += $(this).outerWidth(true); // Include margin
							});
							totalWidth -= $(this).closest('.post-image').width();
							// Calculate maximum width for the image
							var maxImageWidth = maxWidth - totalWidth;
							
							// Get user input width and height
							var width = parseInt($(this).closest('.post-image').find('input[name="ewidth"]').val());
							var height = parseInt($(this).closest('.post-image').find('input[name="eheight"]').val());
							
							// Check if width exceeds the maximum width
							if (width > maxImageWidth) {
								width = maxImageWidth; // Set width to maximum width
								$(this).closest('.post-image').find('input[name="ewidth"]').val(maxImageWidth);
							}
							
							// Apply width and height to the image
							$(this).closest('.post-image').find('img').css({
								'width': width + 'px',
								'height': height + 'px'
							});
						}
					});
					contentRowCounter++;
					checkAndDisableButtons();
				};
				reader.readAsDataURL(file);
			}
		});
		
		// Text area auto expand
		$('.post-contents').on('input', '.ctextarea', function() {
			this.style.height = 'auto';
			this.style.height = (this.scrollHeight) + 'px';
		});
		
		/* Element block button action */
		// Event listener for add text block button
		$('.post-contents').on('click', '[name="add-text"]', function() {
			var contentRow = $(this).closest('.content-row');
			var textBlock = '<div class="post-text post-content" id="text-' + contentRowCounter + '" style="width: 500px;">' +
				'<div class="content-' + contentRowCounter + ' ctextarea" id="content-' + contentRowCounter + '" contenteditable="true" style="width: 500px; min-height: 30px;"></div>' +
				'<div class="row-element-controller">' +
				'<div class="text-controller">' +
				'<button type="button" name="delete-element-row" title="Remove this element."><i class="bi bi-trash3"></i></button>' +
				'<button type="button" name="set-left-row" title="Align text left."><i class="bi bi-text-left"></i></button>' +
				'<button type="button" name="set-center-row" title="Align text center."><i class="bi bi-text-center"></i></button>' +
				'<button type="button" name="set-right-row" title="Align text right."><i class="bi bi-text-right"></i></button>' +
				'</div>' +
				'<div class="size-controller">' +
				'<input type="number" name="ewidth" placeholder="Width" value="500"> x ' +
				'<input type="text" name="eheight" placeholder="Height" value="auto" disabled>' +
				'</div>' +
				'</div>'
			contentRow.append(textBlock);
			$('#text-' + contentRowCounter + ' input').on('keyup', function(e) {
				if (e.keyCode === 13) { // Check if Enter key is pressed
					var maxWidth = $(this).closest('.content-row').width(); // Get width of content row
					var totalWidth = 0;
					
					// Calculate total width of all post-text and post-image elements in the content row
					$(this).closest('.content-row').find('.post-text, .post-image').each(function() {
						totalWidth += $(this).outerWidth(true); // Include margin
					});
					totalWidth -= $(this).closest('.post-text').width();
					// Calculate maximum width for the image
					var maxImageWidth = maxWidth - totalWidth;
					
					// Get user input width and height
					var width = parseInt($(this).closest('.post-text').find('input[name="ewidth"]').val());
					
					// Check if width exceeds the maximum width
					if (width > maxImageWidth) {
						width = maxImageWidth; // Set width to maximum width
						$(this).closest('.post-text').find('input[name="ewidth"]').val(maxImageWidth);
					}
					
					// Apply width and height to the image
					$(this).closest('.post-text').css({
						'width': width + 'px'
					});
				}
			});
			contentRowCounter++;
			checkAndDisableButtons();
		});
		
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
		
		// Event listener for set-left button
		$('.post-contents').on('click', '[name="set-top"]', function() {
			$(this).closest('.content-row').css('align-items', 'start');
		});
		
		// Event listener for set-right button
		$('.post-contents').on('click', '[name="set-middle"]', function() {
			$(this).closest('.content-row').css('align-items', 'center');
		});
		
		// Event listener for set-left button
		$('.post-contents').on('click', '[name="set-bottom"]', function() {
			$(this).closest('.content-row').css('align-items', 'end');
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
		
		// Disable align/justify
		function checkAndDisableButtons() {
			$('.content-row').each(function() {
				var postContentCount = $(this).find('.post-content').length;
				
				if (postContentCount <= 1) {
					$(this).find('.pec-row2 button, .pec-row3 button').prop('disabled', true);
				} else {
					$(this).find('.pec-row2 button, .pec-row3 button').prop('disabled', false);
				}
			});
		}
		checkAndDisableButtons();
		
		/* Element row button action */
		// Event listener for delete element row button
		$('.post-contents').on('click', '[name="delete-element-row"]', function() {
			$(this).closest('.post-content').remove();
			checkAndDisableButtons();
		});
		// Event listener for set-left element row button
		$('.post-contents').on('click', '[name="set-left-row"]', function() {
			$(this).closest('.post-content').find('.ctextarea').css("text-align", "left");
		});
		
		// Event listener for set-center element row button
		$('.post-contents').on('click', '[name="set-center-row"]', function() {
			$(this).closest('.post-content').find('.ctextarea').css("text-align", "center");
		});
		
		// Event listener for set-right element row button
		$('.post-contents').on('click', '[name="set-right-row"]', function() {
			$(this).closest('.post-content').find('.ctextarea').css("text-align", "right");
		});
	});
</script>