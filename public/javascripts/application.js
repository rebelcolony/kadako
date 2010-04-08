$(document).ready(function() {
	$("a.new_window").attr("target", "_blank");
	setTimeout(hideFlashes, 2000);
});

var hideFlashes = function() {
  $("#flash_notice, #flash_error").fadeOut(4000);
}


TopUp.images_path = "/images/top_up/";
TopUp.addPresets({
  "a.top_up": {
	title: "",
	group: "photo",
    type: "image",
	layout: "dashboard",
	effect: "transform",
	shaded: 0
  },

});

