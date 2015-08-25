// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets

$(document).on("ready", function() {
  setTimeout(function() {
    $(".hide-flash").fadeOut("normal");
  }, 3000);

  check_question_type();

  $("#question_question_type").on("change",function() {
    if (this.value === "text"){
      $(".remove-button").trigger("click");
      $(".add-button").trigger("click");
      $(".add-button").hide();
      $(".check-box-remove").hide();
    }else{
      $(".add-button").show();
      $(".check-box-remove").show();
    }
  });
});

function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".form-group").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $(link).parent().before(content.replace(regexp, new_id));
}

function check_question_type() {
  if ($("#question_question_type").val() === "text"){
    $(".add-button").hide();
    $(".check-box-remove").hide();
  }else{
    $(".add-button").show();
    $(".check-box-remove").show();
  }
}
