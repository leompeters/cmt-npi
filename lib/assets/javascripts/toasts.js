// Place all the behaviors and hooks related to this plugin library here.
// All this logic will automatically be available in files that you import this.
//
//= require_self

/**
 * Toast notification with success message.
 *
 * @param title
 * @param body
 */
function showSuccessToast(title, body) {
  showToast(title, body, 'success', 'success');
}

/**
 * Toast notification with warning message.
 *
 * @param title
 * @param body
 */
function showWarningToast(title, body) {
  showToast(title, body, 'warning', 'warning');
}

/**
 * Toast notification with error message.
 *
 * @param title
 * @param body
 */
function showErrorToast(title, body) {
  showToast(title, body, 'danger', 'error')
}

function showToast(title, body, badgeClass, badgeText) {
  const notificationToast = buildToast(title, body, badgeClass, badgeText);
  const toast = new bootstrap.Toast(notificationToast);
  toast.show();
}

function buildToast(title, body, badgeClass, badgeText) {
  const toast = $([
    '<div class="toast" role="alert" aria-live="assertive" aria-atomic="true">',
    '  <div class="toast-header">',
    '    <span class="badge bg-' + badgeClass + ' text-uppercase me-2">' + badgeText + '</span>',
    '    <strong class="me-auto">' + title + '</strong>',
    '    <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>',
    '  </div>',
    '  <div class="toast-body">' + body + '</div>',
    '</div>'
  ].join("\n"));
  $('#toastContainer').append(toast);

  return toast;
}
