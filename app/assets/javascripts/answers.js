$(function(){
  $('.answer-btn-js').parent().on ('ajax:success', function(event, data, status, xhr){
    var template = (data.template);
    $(this).parent().append(template)
//if i want to keep the text underneath don't put the line below
    $('textarea').val('')
    $(this).parent().addClass('displaying')
    $(this).parent().parent().addClass('change-color')
    // $(this).parents('.parent').css( "color", "red" )
  })
})

//due to turbolinks I need to add additional event listener for page load:
$(document).on('page:load', function(){
  $('.answer-btn-js').parent().on ('ajax:success', function(event, data, status, xhr){
    var template = (data.template);
    $(this).parent().append(template)
//if i want to keep the text underneath don't put the line below
    $('textarea').val('')
    $(this).parent().addClass('displaying')
    $(this).parent().parent().addClass('change-color')
    // $(this).parents('.parent').css( "color", "red" )
  })
})