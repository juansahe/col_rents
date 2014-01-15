/* blur on modal open, unblur on close */
$('#myModal').on('show.bs.modal', function () {
   $('.container').addClass('blur');
});

$('#myModal').on('hide.bs.modal', function () {
   $('.container').removeClass('blur');
});