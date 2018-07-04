// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
  if ($('body.groups.show').length == 0) {
    return;
  }
  $('.delete-member').click(function(e){
    e.preventDefault();
    let deletionUrl = e.target.getAttribute('href');
    $.ajax({
      method: 'DELETE',
      url: deletionUrl,
      success: function(data) {
        $(e.target).parents('.member-div').remove();
        toastr.success('Member has been successfully deleted.');
      }
    })
  });

});