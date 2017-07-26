//
// $(document).ready(function(){
//   $('#newcomment')
//     .bind("ajax:beforeSend", function(evt, xhr, settings){
//     })
//     .bind("ajax:success", function(evt, data, status, xhr){
//       var $form = $(this);
//
//       // Reset fields and any validation errors, so form can be used again, but leave hidden_field values intact.
//       $form.find('textarea,input[type="text"],input[type="file"]').val("");
//       $form.find('div.validation-error').empty();
//
//     });
// });

// $(document).ready(function(){
//   $('.likecomment')
//     .bind("ajax:beforeSend", function(evt, xhr, settings){
//     })
//     .bind("ajax:success", function(evt, data, status, xhr){
//       var valuesToSubmit = $(this).serialize();
//       $.ajax({
//         type: "POST",
//         url: $(this).attr('action'), //sumbits it to the given url of the form
//         data: valuesToSubmit,
//         dataType: "JSON" // you want a difference between normal and ajax-calls, and json is standard
//       }).success(function(json){
//         console.log("success", json);
//       });
//       $(".unlikecomment").trigger('reset');
//       return false; // prevents normal behaviour
//
//     });
// });
