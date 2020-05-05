$(function(){
  function buildHTML(comment){
    var html = `<p>
                  <strong>
                    <a href=/users/${comment.user_id}>${comment.user_name}</a>
                    ：
                  </strong>
                  ${comment.text}
                </p>`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    console.log(this)
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.comments').append(html);
      $('.textbox').val('');
      $('.form__submit').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
  $('.delete_btn').on('click', function(e){
    e.preventDefault();
    e.stopPropagation();
    var href = $(this).attr('href');
    var free_question_id = $(this)[0].dataset['freeQuestionId'];
    $.ajax({
      type: 'DELETE',
      headers: {
        'Content-Type': 'application/json',
      },
      dataType: 'json',
      url: href,
      data: JSON.stringify({free_question_id: free_question_id}),
      success: function(res) {
        $(".row[data=" + free_question_id + "]").empty();
        $(".row[data=" + free_question_id + "]").html(
          `<span>削除しました</span>`
        );
        return false;
      },
      error: function(res) {
        return false;
      }
    })
  });
})