//Blur background on Modal click
$(document).on('show.bs.modal', '#SignUpModal', function(){
  $('.container').addClass('blur');
});

$(document).on('hide.bs.modal', '#SignUpModal', function(){
  $('.container').removeClass('blur');
});
