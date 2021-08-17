// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//
//= require application
//= require toasts
//= require modal
//= require_self

$(document).ready(function() {
  $('#request_npi').on('submit', function() {
    const form = $(this);

    const submitButton = $('#button_request_npi');
    submitButton.button('loading');

    $.ajax({
      url:      form.attr('action'),
      type:     form.attr('method'),
      data:     form.serialize(),
      dataType: 'json'
    }).done(function(data, textStatus, jqXHR) {
      showSuccessToast(jqXHR.statusText, 'NPI # ' + data.number + ' found with success');
      submitButton.button('complete');
      // I could remove the row with the provided id and prepend it on the top
      // of the table body, but this time I preferred to show you guys this option.
      $.getScript(form.attr('action'));
    }).fail(function(data) {
      if (data.status > 299 && data.status < 500) {
        data.responseJSON.forEach(function(d) {
          showWarningToast(data.statusText, d);
        });
      } else {
        showErrorToast('Error', data.statusText);
      }
    }).always(function() {
      submitButton.button('reset');
    });

    return false;
  });
});
