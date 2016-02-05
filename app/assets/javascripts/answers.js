$(function(){
  $('.answer-btn-js').parent().on ('ajax:success', function(event, data, status, xhr){
    var template = (data.template);
debugger;
    $(this).parent().append(template)
//if i want to keep the text underneath don't put the line below
    $('textarea').val('')
    $(this).parent().addClass('displaying')
    $(this).parent().parent().addClass('change-color')
    // $(this).parents('.parent').css( "color", "red" )

  })
})


// function removeElement(parentDiv, childDiv){
          
//           var child = document.getElementById(childDiv);
//           var parent = document.getElementById(parentDiv);
//           parent.removeChild(child);

// }

// $('.answer-btn-js').parent().on('click', removeElement())