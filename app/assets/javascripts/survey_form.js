$(function(){
 
  $('#new_question_btn-js').on('click', function(){
    
    var numQuestionFieldsLength = $('.question_field-js').length/4
    var questTitle = $('.question_field-js').clone().get(0).outerHTML;
    var questionTitleFieldHtmlStr = $('.question_field-js').clone().get(1).outerHTML;
    var questContent = $('.question_field-js').clone().get(2).outerHTML;
    var questionContentFieldHtmlStr = $('.question_field-js').clone().get(3).outerHTML;
    var totalQuestion = questTitle + " " + questionTitleFieldHtmlStr + " " + questContent + " " + questionContentFieldHtmlStr
    var newQuestionField = totalQuestion.replace(/\d+/g, numQuestionFieldsLength)
    var wrapped = $(newQuestionField).wrap('<p>')
    $('.container-quest').append(wrapped)
    $('.container-quest').append("<p></p>")
  })
});

//due to turbolinks I need to add additional event listener for page load:
$(document).on('page:load', function(){
 
  $('#new_question_btn-js').on('click', function(){
    
    var numQuestionFieldsLength = $('.question_field-js').length/4
    var questTitle = $('.question_field-js').clone().get(0).outerHTML;
    var questionTitleFieldHtmlStr = $('.question_field-js').clone().get(1).outerHTML;
    var questContent = $('.question_field-js').clone().get(2).outerHTML;
    var questionContentFieldHtmlStr = $('.question_field-js').clone().get(3).outerHTML;
    var totalQuestion = questTitle + " " + questionTitleFieldHtmlStr + " " + questContent + " " + questionContentFieldHtmlStr
    var newQuestionField = totalQuestion.replace(/\d+/g, numQuestionFieldsLength)
    var wrapped = $(newQuestionField).wrap('<p>')
    $('.container-quest').append(wrapped)
    $('.container-quest').append("<p></p>")
  })
})

//test for show form for answers

// $(document).on('click', '.panel-heading span.clickable', function(e){
//     var $this = $(this);
//     if(!$this.hasClass('panel-collapsed')) {
//         $this.parents('.panel').find('.specialCollapse').slideUp();
//         $this.addClass('panel-collapsed');
//         $this.find('i').removeClass('glyphicon-chevron-up').addClass('glyphicon-chevron-down');
//     } else {
//         $this.parents('.panel').find('.specialCollapse').slideDown();
//         $this.removeClass('panel-collapsed');
//         $this.find('i').removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-up');
//     }
// })


//first ajax call to popolate and hide all the checkboxes items at page load
$(function(){
   var action = '/get_checkboxes';
   var method = 'get';
   // var title = $(this).val();
   var data = $(this).serializeArray();

   $.ajax({
    method: method,
    url: action,
    // data: {title: title},
    data: data,
    dataType: 'script'
   })
})

//second ajax call to detect the choice in the dropdown list and show only the ones with the selected title
$(function(){
  $('select').on('change', function(){
   var action = '/show_checkboxes';
   var method = 'get';
   // var title = $(this).val();
   var data = $(this).serializeArray();

   $.ajax({
    method: method,
    url: action,
    // data: {title: title},
    data: data,
    dataType: 'script'
   })
  })
})



