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

// let npiDataModal = document.getElementById('npiDataModal');
// npiDataModal.addEventListener('show.bs.modal', function (event) {
$(window).on('show.bs.modal', function (event) {
  // Button that triggered the modal
  let button = event.relatedTarget;
  // Extract info from data-bs-* attributes
  let number = button.getAttribute('data-bs-number');
  let json = button.getAttribute('data-bs-json');
  // If necessary, you could initiate an AJAX request here
  // and then do the updating in a callback.
  //
  // Update the modal's content.
  let modalTitle = npiDataModal.querySelector('.modal-title');
  let modalBodyInput = npiDataModal.querySelector('.modal-body code');

  modalTitle.textContent = 'NPI: ' + number;
  modalBodyInput.textContent = json;
});
