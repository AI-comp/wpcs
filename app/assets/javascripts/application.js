// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery.autosize
//= require jquery_ujs
//= require jquery.ui.datepicker
//= require jquery.ui.slider
//= require jquery-ui-timepicker-addon
//= require twitter/bootstrap
//= require_tree .

$(function () {
  jQuery.fn.preventDoubleSubmission = function() {
    $(this).on('submit',function(e){
      var $form = $(this);
   
      if ($form.data('submitted') === true) {
        // Previously submitted - don't submit again
        e.preventDefault();
      } else {
        // Mark it so that the next submit can be ignored
        $form.data('submitted', true);
      }
    });
   
    // Keep chainability
    return this;
  };
  $('form').preventDoubleSubmission();

  $('.dropdown-toggle').dropdown();
});
