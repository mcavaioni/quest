$(function(){
  $('#new_question_btn-js').on('click', function(){
    var numQuestionFields = $('.question_field-js').length/2
    var questionTitleFieldHtmlStr = $('.question_field-js').clone().get(0).outerHTML;
    var questionContentFieldHtmlStr = $('.question_field-js').clone().get(1).outerHTML;
    var totalQuestion = questionTitleFieldHtmlStr + questionContentFieldHtmlStr
    var newQuestionField = totalQuestion.replace(/\d+/g, numQuestionFields)
    var wrapped = $(newQuestionField).wrap('<p>')
    $('.container_question').append(wrapped)
  })
})

