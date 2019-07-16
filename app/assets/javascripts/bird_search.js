$(function() {

  var search_list = $("#search_birds_result");
  var preInput;


  function appendUserName(birdName, birdId) {
    var html = `<li class="result_bird_name">
                  <a href="/birds/${birdId}">${birdName}</a>
                </li>`
    search_list.append(html);
  }

  function appendErrMsgToHTML(msg) {
    var html = `<div class="result_bird_name">
                  ${ msg }
                </div>`
    search_list.append(html);
  }

  $("#search_bird_name").on('keyup', function() {
  
    var input = $("#search_bird_name").val();
    if (input != preInput){

      $.ajax({
        type: 'GET',
        url: '/birds/search',
        data: { birds_name: input },
        dataType: 'json'
      })
      
      .done(function(birds) {
        $("#search_birds_result").empty();
        
        if (birds.length == 0) {
          appendErrMsgToHTML("一致する野鳥が見つかりません");
        }
        
        birds.forEach(function(bird) {
          appendUserName(bird.name, bird.id);
        });
      })
      
      .fail(function() {
        alert('検索に失敗しました');
      })
    }
    preInput = input
  });
});