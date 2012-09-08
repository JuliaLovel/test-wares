$(document).ready(function(){

  //Load these functions so they can be called
  $("#scheme_from_file_true").click(function(){
    $(".from_file_fields").show();
    $(".not_from_file_fields").hide();
  });
  
  $("#scheme_from_file_false").click(function(){
    $(".from_file_fields").hide();
    $(".not_from_file_fields").show();
  });
  
  //Call these things on page load
  $("#scheme_from_file_true").click();
});