// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//
//= require application
//= require_self

$('#request_npi').submit(function() {
  let form = $(this);

  let submitButton = $('#button_request_npi');
  submitButton.button('loading');

  $.ajax({
    url:      form.attr('action'),
    type:     form.attr('method'),
    data:     form.serialize(),
    dataType: 'json'
  }).done(function() {

    submitButton.button('complete');

  }).fail(function(jqXHR) {
    // TODO: submitButton.button('reset');
    // if (jqXHR.responseJSON) {
    //   showErrorToast(jqXHR.responseJSON.message);
    // } else {
    //   showErrorToast(jqXHR.statusText);
    // }
  });

  return false;
});
