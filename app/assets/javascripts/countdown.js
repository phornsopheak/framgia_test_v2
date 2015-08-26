var countdown = function() {
  $("#clock").countdown({
    until: $("#duration").val(),
    format: "HMS",
    onExpiry: function() {
      alert("Your exam is time out. We are going to submit your test automatically");
      $(".btn-submit").trigger("click");
      $(".btn-submit").hidden();
    }
  });
}

$(document).ready(countdown);
$(document).on("page:update", countdown);
