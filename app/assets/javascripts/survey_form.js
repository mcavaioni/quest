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


// $(function(){
 
//   $('select').on('change', function(){
//   str = $(this).val()
//   var html_str = "<%=collection_check_boxes :question_ids, Question.select{|a| a.title =="+"'"+ str +"'"+"}" +", :id, :content do |cb| %><% cb.label(class: 'checkbox-inline input_checkbox  question_choice') {cb.check_box(class: 'checkbox') + cb.text} %><%end%>";
// // debugger;
//   var wrapped = $(html_str)
//   $(".check").append(wrapped)
//   })
// })

$(function(){
  $('select').on('change', function(){
   // event.preventDefault();
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

   // debugger;
  })
})








