$(function() {
	$('#hidebox').click(function() {
		$('#ibox').fadeOut();
		alert("Hidden your box");
	});

	$('#showbox').click(function() {
		$('#ibox').fadeIn();
		alert('Show your box');
	});

	$('#ibox').click(function() {
		$('#ibox').animate({
			opacity : 0.25,
			left : "+=50",
			//height : "toggle"
			width : "toggle"
		}, 5000, function() {
			// Animation complete.
		});
		alert('move 580px');
	});

	//$('li').addClass('selected');

	var i = $('#themxoa li').size();
	$('#countli').click(function() {
		alert("Số element là " + i);
	});

	$('#addli').click(function() {
		i++;
		$('<li>' + i + '</li>').appendTo('ul#themxoa');
	});

	$('#deleteli').click(function() {
		$('#themxoa li:last').remove();
		i--;
	});

	$('#bttoggle').click(function() {
		$('#ibox').toggle(4000);
	});

	$("#accordiondemo .accordion:not(:first)").hide();
	$("#accordiondemo h3").first().addClass('highlight');
	// Áp dụng sự kiện click vào thẻ h3
	$("#accordiondemo h3").click(function() {
		// chọn .accordion (do phần tử đi đi ngay sau phần tử h3 nên ta dùng .next())
		$("#accordiondemo h3").removeClass();
		$(this).addClass('highlight');
		$accordion = $(this).next();
		// Kiểm tra nếu đang ẩn thì sẽ hiện và ẩn các phần tử khác
		// Nếu đang hiện thì click vào h3 sẽ ẩn
		if ($accordion.is(':hidden') === true) {
			$("#accordiondemo .accordion").slideUp();
			$accordion.slideDown();
		} else {
			$accordion.slideUp();
		}
	});

	//$('.neoslideshow img:gt(0)').hide();
	var Maxcount = $('#slideshow img').size();
	var count = 0;
	$('#slideshow img').hide();
	$('#slideshow img:eq(' + count + ')').show();
	setInterval(function() {
		count = count + 1;
		if (count > Maxcount) {
			count = 0;
		} else {
			$('#slideshow img').hide();
			$('#slideshow img:eq(' + count + ')').show();
		}
	}, 4000);

});
