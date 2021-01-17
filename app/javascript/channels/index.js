// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

$(function() {
    console.log("Index loaded");
    return $("a[data-remote]").on("ajax:beforeSend", function(event) {
      return console.log(`Event ${event} is going to be sent`);
    });
  });
  