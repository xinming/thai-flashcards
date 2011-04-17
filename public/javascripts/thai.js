$("document").ready(function(){
	$("#help").dialog({autoOpen: false,
										draggable: false, 
										title: "HELP",
										resizable: false,
										buttons: []});
})


// function update_size globals

var ENG_MAX_LENGTH = 25
var ENG_DEFAULT_SIZE = 17.0
var ENG_MIN_SIZE = 13.0
var THAI_MAX_LENGTH = 6
var THAI_DEFAULT_SIZE = 60.0
var THAI_MIN_SIZE = 30.0

function update_size(){
  var thai_length = $("#thai").html().replace(/[่ัิีึืฺุู็่้๊๋์ํ๎ ัิีึืฺุู็่้๊]/g, "").length;
  _update_size($("#thai"), thai_length, THAI_MAX_LENGTH, THAI_DEFAULT_SIZE, THAI_MIN_SIZE)
  var english_length = $('#english').html().length;
  _update_size($("#english"), english_length, ENG_MAX_LENGTH, ENG_DEFAULT_SIZE, ENG_MIN_SIZE)
}

function _update_size(obj, length, max_length, default_size, min_size){
  if(length > max_length){
    var size = max_length/length * default_size;
    var final_size = size > min_size? size : min_size;
    obj.css("font-size", final_size + "px");
  }
  else{
    obj.css("font-size", default_size + "px");
  }
}


function set_shortcuts(page){
	$(document).bind('keydown', 'n', function(){
		window.location="/vocabs/new"
	});
	$(document).bind('keydown', 'shift+/', function(){
		if($("#help").dialog('isOpen')){
			$("#help").dialog('close');
		}else{
			$("#help").dialog('open');
		}
	});
	$(document).bind('keydown', 'i', function(){
		window.location="/vocabs/"
	});
	$(document).bind('keydown', 'esc', function(){
		window.location="/vocabs/"
	});
	$(document).bind('keydown', 'd', function(){
		window.location="/vocabs/done"
	});
	if(page == "card"){
	  $(document).bind('keydown', 'a', function(){
	    $('#left_card a').click();
	  });
	  $(document).bind('keydown', 's', function(){
	    $('#right_card a').click();
	  });
	  $(document).bind('keydown', 'e', function(){
	    window.location= $("#current_vocab_id").html()+ "/edit"
	  });
	}
	else if(page == "index"){
	  $(document).bind('keydown', 'a', function(){
			previous_page();
	  });
	  $(document).bind('keydown', 's', function(){
	    next_page();
	  });
	}
}

function done(obj, id){
	$.post("/vocabs/" + id  + "/done", function(data){
		if(data == "success"){
			obj.parent().parent().fadeOut();
		}
	})
}