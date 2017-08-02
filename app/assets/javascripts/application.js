//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .
$(document).ready(function(){

  var ulNav= "#nav", openNav = "active";

  $(document).on('click', '.toggle-menu', function(e){

      if($(ulNav).hasClass(openNav)){
        $(ulNav).removeClass(openNav);
      }else{
        $(ulNav).addClass(openNav);
      }
      e.preventDefault();
  })
})

$(function(){
  $(".tab_cont").on("submit", function(event){
    $.ajax({
      type: "POST",
      url: this.action,
      data: $(this).serialize(),

    success: function(response) {
        if (response == "success")
        alert("")
        else
        $(".message-class").html("<span class='text-error marginl10' ><b>Not sent, please fill in the correct details..</b></span>")
    }
    });
    event.preventDefault();
    $(".tab_cont").trigger('reset');

  });
})

//
// $(document).on('ready page:load', function() {
//   $("#submit_contact").submit(function () {
//     var valuesToSubmit = $(this).serialize();
//     $.ajax({
//       type: "POST",
//       url: $(this).attr('action'), //sumbits it to the given url of the form
//       data: valuesToSubmit,
//       dataType: "JSON" // you want a difference between normal and ajax-calls, and json is standard
//     }).success(function(json){
//       console.log("success", json);
//     });
//     $("#submit_contact").trigger('reset');
//   })
// })

$(document).on('click', '.specific_service', function(event) {
  $('.cd-popup').addClass('is-visible');
});


$(document).on('click', '.deletecomment', function(event) {
  $(event.target).closest(".center_div_comment").delay(1500).slideUp('slow');

})
