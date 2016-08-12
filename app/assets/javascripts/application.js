//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require init_attachinary
//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require attachinary
//= require attachinary_template
//
//
$(document).ready(function() {
  $("#user_is_client").click(function(){
    $('#is_client').val($("#user_is_client").prop('checked'))
  });
});

