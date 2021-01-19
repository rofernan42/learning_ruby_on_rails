$(function() {
    console.log("Index loaded");
    return $("a[data-remote]").on("ajax:beforeSend", function(event) {
      return console.log(`Event ${event} is going to be sent`);
    });
  });

require('books/show')