/* blur on modal open, unblur on close */
$('#myModal').on('show.bs.modal', function () {
   $('.s-container').addClass('blur');
   alert("I am an alert box!");
});

$('#myModal').on('hide.bs.modal', function () {
   $('.s-container').removeClass('blur');
   alert("I am an alert box!");
});