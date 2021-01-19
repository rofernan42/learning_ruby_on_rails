$(document).on("turbolinks:load", function() {
  if ($("#new-comment").length === 0) {
    return;
  }
  console.log("Show loaded");
  $("#new-comment").hide();
  return $("#add-comment").on("click", function(e) {
    e.preventDefault();
    $("#new-comment").show();
    $("#new-comment").find("form")[0].reset();
    $("#comments").hide();
    $("#add-comment").hide();
    return false;
  });
});
