$(function(){
  $('.answer-btn-js').parent().on ('ajax:success', function(event, data, status, xhr){
    
    // document.getElementById("answer_content").value=""
    // $("#selElement_Id option:selected").removeAttr("selected")
    var template = (data.template);
debugger;
    $(this).parent().append(template)
    // this.getElementsByClassName('answer-form')=""
    // data.template=""
    // document.getElementById("answer_content").value=""
    $('textarea').val('')
  })
})


function removeElement(parentDiv, childDiv){
          
          var child = document.getElementById(childDiv);
          var parent = document.getElementById(parentDiv);
          parent.removeChild(child);

}

$('.answer-btn-js').parent().on('click', removeElement())