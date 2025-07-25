

		var slider = document.getElementById("mySlider");
		let isDragging = false;
		let offset = 0;
		let startPosition = 0;

		slider.addEventListener("mousedown", dragStart);
		slider.addEventListener("touchstart", dragStart);

		slider.addEventListener("mouseup", dragStop);
		slider.addEventListener("touchend", dragStop);
        window.addEventListener("mouseup",dragStop);

		slider.addEventListener("mousemove", dragMove);
		slider.addEventListener("touchmove", dragMove);

		function dragStart(e) {
			isDragging = true;
			startPosition = e.clientX;
			offset = slider.scrollLeft;
		}

		function dragStop(e) {
			isDragging = false;
		}

		function dragMove(e) {
			if (isDragging) {
				let currentpos = e.clientX;
				let direction = currentpos - startPosition;
				slider.scrollLeft = offset - direction;
			}
		}
