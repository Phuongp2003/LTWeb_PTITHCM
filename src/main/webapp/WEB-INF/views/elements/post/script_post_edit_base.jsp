<script>
	$(document).ready(function() {
		// Counter for content rows
        var elementCounter = 1;
        var rowElementCounter = [][1];
        rowElementCounter[0][0] = 0;
        
		var contentRowCounter = 1;
		var currentEvent;
		
		// Function to add a new element block
		function addTextBlock() {
			contentRowCounter++;
			var elementBlock = '<div class="content-row" id="content-row-' + contentRowCounter + '">' +
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
				'<button class="non-disabled-btn" type="button" name="center-element-4" title="Center lv 4 this element.">Lv4</button>' +
				'</div>' +
				'<div class="pec-row4">' +
				'<button type="button" name="add-text" title="Add text block to this element."><i class="bi bi-card-text"></i></button>' +
				'<button type="button" name="add-image" title="Add image to this element."><i class="bi bi-file-image"></i></button>' +
				'</div>' +
				'</div>' +
				'</div>';
			$('.post-contents').append(elementBlock);
			$('input').on('keypress', function(e) {
				if (e.which == 13) { // 13 is the ASCII code for Enter
					e.preventDefault();
				}
			});
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
					var imageBlock = '<div class="post-image post-content" id="image-' + contentRowCounter + ' container-' + contentRowCounter + '">' +
						'<img class="dragbar-' + contentRowCounter + '" src="' + imageUrl + '" alt="Image" width="200" height="200">' +
						'<div class="handle EE"></div>' +
						'<div class="handle SS"></div>' +
						'<div class="handle SE"></div>' +
						'</img>' +
						'<div class="row-element-controller">' +
						'<div class="text-controller">' +
						'<button type="button" name="delete-element-row" title="Remove this element."><i class="bi bi-trash3"></i></button>' +
						'</div>' +
						'<div class="size-controller">' +
						'<input class="ew-controller size-controller" type="number" name="ewidth" placeholder="Width" value="200"> x ' +
						'<input class="eh-controller size-controller" type="number" name="eheight" placeholder="Height" value="200">' +
						'</div>' +
						'</div>';
					contentRow.append(imageBlock);
					$('input').on('input', 'keypress', function(e) {
						if (e.which == 13) { // 13 is the ASCII code for Enter
							e.preventDefault();
						}
					});
					// Handle real-time width/height change
					$('#image-' + contentRowCounter + ' .size-controller').on('keyup', function(e) {
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
					
					makeResizable(contentRowCounter);
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
			var textBlock =
				'<div class="post-text post-content" id="container-' + contentRowCounter + ' text-' + contentRowCounter + '">' +
				'<div class="dragbar-' + contentRowCounter + '" style="width: 500px;">' +
				'<div class="content-' + contentRowCounter + ' ctextarea" id="content-' + contentRowCounter + '" contenteditable="true" style="width: 100%; min-height: 30px;"> </div>' +
				'<div class="handle EE"></div>' +
				'</div>' +
				'<div class="row-element-controller">' +
				'<div class="text-controller">' +
				'<button type="button" name="delete-element-row" title="Remove this element."><i class="bi bi-trash3"></i></button>' +
				'<button type="button" name="set-left-row" title="Align text left."><i class="bi bi-text-left"></i></button>' +
				'<button type="button" name="set-center-row" title="Align text center."><i class="bi bi-text-center"></i></button>' +
				'<button type="button" name="set-right-row" title="Align text right."><i class="bi bi-text-right"></i></button>' +
				'</div>' +
				'<div class="font-controller">' +
				'<input class="font-size-controller" type="number" name="fs-input" placeholder="Height" value="12">' +
				'<select class="color-selector" name="text-color">' +
				'<option value="red">Red</option>' +
				'<option value="yellow">Yellow</option>' +
				'<option value="blue">Blue</option>' +
				'<option value="green">Green</option>' +
				'<option value="black" selected>Black</option>' +
				'<option value="white">White</option>' +
				'</select>' +
				'<select class="font-family-selector" name="font-family">' +
				'<option value="Arial">Arial</option>' +
				'<option value="Verdana">Verdana</option>' +
				'<option value="Georgia">Georgia</option>' +
				'<option value="Times New Roman">Times New Roman</option>' +
				'<option value="Courier New">Courier New</option>' +
				'</select>' +
				'</div>' +
				'<div class="size-controller">' +
				'<input class="ew-controller size-controller" type="number" name="ewidth" placeholder="Width" value="500"> x ' +
				'<input class="eh-controller size-controller" type="text" name="eheight" placeholder="Height" value="auto" disabled>' +
				'</div>' +
				'</div>';
			contentRow.append(textBlock);
			$('input').on('input', 'keypress', function(e) {
				if (e.which == 13) { // 13 is the ASCII code for Enter
					e.preventDefault();
				}
			});
			$('#text-' + contentRowCounter + ' size-controller').on('keyup', function(e) {
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
					} else {
						width = $(this).closest('.post-text').find('input[name="ewidth"]').val(maxImageWidth);
					}
					console.log("🚀 ~ $ ~ $(this).closest('.post-text').find('input[name=\"ewidth\"]').val(maxImageWidth):", $(this).closest('.post-text').find('input[name="ewidth"]').val(maxImageWidth))
					
					// Apply width and height to the image
					$(this).closest('.post-text').css({
						'width': width + 'px'
					});
				}
			});
			$('#text-' + contentRowCounter + ' font-size-controller').on('keyup', function(e) {
				if (e.keyCode === 13) { // Check if Enter key is pressed
					var fs = parseInt($(this).closest('.post-text').find('input[name="fs-input"]').val());
					
					// Apply width and height to the ctextarea element
					$(this).closest('.post-text').find('.ctextarea').css({
						'width': fs + 'px'
					});
				}
			});
			checkAndDisableButtons(contentRowCounter);
			makeResizable(contentRowCounter);
			contentRowCounter++;
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
					$(this).find('.pec-row2 button').prop('disabled', true);
				} else {
					$(this).find('.pec-row2 button').prop('disabled', false);
				}
			});
		}
		checkAndDisableButtons();
		
		/* Element row button action */
		$('.parent-element').on('click', function() {
			$(this).addClass('active');
		});
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
		
		//Text controiller
		// --Font size
		$('.post-contents').on('input', '.font-size-controller', function() {
			var fontSize = $(this).val() + 'px';
			$(this).closest('.post-text').find('.ctextarea').css('font-size', fontSize);
		});
		// --Font color
		$('.post-contents').on('change', '.color-selector', function() {
			var color = $(this).val();
			var selection = window.getSelection();
			if (selection.rangeCount) {
				var range = selection.getRangeAt(0);
				var span = document.createElement('span');
				span.style.color = color;
				
				// Extract the contents of the selection
				var contents = range.extractContents();
				
				// Remove any span elements within the contents
				$(contents).find('span').contents().unwrap();
				
				// Append the cleaned contents to the new span
				span.appendChild(contents);
				
				// Insert the new span into the range
				range.insertNode(span);
			}
		});
		// --Font-family
		$('.post-contents').on('change', '.font-family-selector', function() {
			var fontFamily = $(this).val();
			$(this).closest('.post-text').find('.ctextarea').css('font-family', fontFamily);
		});
		
		
		
		$('form').on('submit', function(e) {
			// Get the contents of the div
			var content = $('.post-contents').html();
			// Create a hidden input for the content
			var contentInput = $('<input>', {
				type: 'hidden',
				name: 'content',
				value: content
			});
			
			// Append the hidden inputs to the form
			$(this).append(contentInput);
		});
	});
	
	function makeResizable(param) {
		var startPos, startRect, rectDiv = $(".dragbar-" + param);
		
		function update() {
			var handle = $(this),
				dir = handle.attr("class").split(" ")[1],
				delta;
			
			if (dir[1] === "E") {
				rectDiv.width(startRect.width + handle.position().left - startPos.left);
			}
			if (dir[1] === "W") {
				delta = handle.position().left - startPos.left;
				rectDiv.css({
					left: startRect.left + delta,
					width: startRect.width - delta
				});
			}
			if (dir[0] === "S") {
				rectDiv.height(startRect.height + handle.position().top - startPos.top);
			}
			if (dir[0] === "N") {
				delta = handle.position().top - startPos.top;
				rectDiv.css({
					top: startRect.top + delta,
					height: startRect.height - delta
				});
			}
			resetHandles();
		}
		
		function resetHandles() {
			$(".EE, .SE").css({
				left: "auto",
				right: -4
			});
			$(".SS, .SE").css({
				top: "auto",
				bottom: -4
			});
			$(" .SS").css({
				left: "50%",
				marginLeft: -4
			});
			$(".EE").css({
				top: "50%",
				marginTop: -4
			});
		}
		
		$('.handle').draggable({
			snap: "#container-" + param,
			start: function() {
				startPos = $(this).position();
				startRect = {
					top: rectDiv.position().top,
					left: rectDiv.position().left,
					width: rectDiv.width(),
					height: rectDiv.height()
				};
			}
		});
		
		$('.SS').on('mousedown', function(e) {
			$(this).draggable({
				axis: "y",
				stop: update
			});
		});
		
		$('.EE').on('mousedown', function(e) {
			$(this).draggable({
				axis: "x",
				stop: update
			});
		});
		
		$('.SE').on('mousedown', function(e) {
			$(this).draggable({
				stop: update
			});
		});
	}
</script>