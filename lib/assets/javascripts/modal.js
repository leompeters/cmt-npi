// Place all the behaviors and hooks related to this plugin library here.
// All this logic will automatically be available in files that you import this.
//
//= require_self

$(window).on('show.bs.modal', function (event) {
  const button = event.relatedTarget;
  const number = button.getAttribute('data-bs-number');
  const json = button.getAttribute('data-bs-json');
  const modalTitle = npiDataModal.querySelector('.modal-title');
  const modalBodyInput = npiDataModal.querySelector('.modal-body code');

  modalTitle.textContent = 'NPI: ' + number;
  modalBodyInput.textContent = json;
});
