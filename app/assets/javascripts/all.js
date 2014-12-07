$(function() {
  $('.post_anonymous label').on('click', function(){
    if($(this).find("input[type='checkbox']").get(0).checked){
      $('#password_field').removeClass("hide");
    } else {
      $('#password_field').addClass("hide");
    }
  });
});
