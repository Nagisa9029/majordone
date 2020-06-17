$(function() {
  qa = new Array();
  count = 0; 
  answer_params = [];

  function choiceQA(){
    const index = tabs.index(this);
    if (index == 0) {
      qa[0] = ["Q1:イルカを漢字で書くとどれ？","海豚","海牛","河豚","水浮","水母"];
      qa[1] = ["Q2:クラゲを漢字で書くとどれ？","水浮","水母","水星","水浮","水母"];
      qa[2] = ["Q3:カタツムリを漢字で書くとどれ？","禍牛","鍋牛","蝸牛","水浮","水母"];
      qa[3] = ["04:バッタを漢字で書くとどれ？","A4-1","飛蟻","飛脚","水浮","水母"];
      qa[4] = ["05:バッタを漢字で書くとどれ？","A5","飛蟻","飛脚","水浮","水母"];
      qa[5] = ["06:バッタを漢字で書くとどれ？","A6","飛蟻","飛脚","水浮","水母"];
      qa[6] = ["07:バッタを漢字で書くとどれ？","A7","飛蟻","飛脚","水浮","水母"];
      qa[7] = ["08:バッタを漢字で書くとどれ？","A8","飛蟻","飛脚","水浮","水母"];
      qa[8] = ["09:バッタを漢字で書くとどれ？","A9","飛蟻","飛脚","水浮","水母"];
      qa[9] = ["10:バッタを漢字で書くとどれ？","A10","飛蟻","飛脚","水浮","水母"];
    }

    quiz();

    let re_answer = $(".AnswerBtn");
    re_answer.click(clickAnswer);
    

    function clickAnswer(e) {
      e.preventDefault();
      const num = re_answer.index(this);
      answer_params[count] = (num + 1)
      // console.log(answer_params);
      $('.Chat__MainField--Answer')[count].innerHTML = `<div style="color: #fff;">
                                                          ${this.value}
                                                        </div>`;
      count += 1;
      if (count >= 10) {
        let html_finite = buildHTML_finite(answer_params);
        $('.Chat__MainField').append(html_finite);
        $('.Chat__MainField').animate({ scrollTop: $('.Chat__MainField')[0].scrollHeight});
        return
      }
      quiz();
      $('.Chat__MainField').animate({ scrollTop: $('.Chat__MainField')[0].scrollHeight});

      re_answer = $(".AnswerBtn");
      re_answer.click(clickAnswer);
    }
  }

  function buildHTML_quiz(quiz, count){
    if (count == 0){
      let html = `<div class="Chat__MainField--Butler">承知しました。</br>
                    では、少しお話ししましょう</div>
                    <div class="Chat__MainField--Butler">${quiz}
                  </div>`
      return html;
    }
    let html = `<div class="Chat__MainField--Butler">${quiz}</div>`
    return html;
  }
  function buildHTML_answer(answer){
    let html2 = `<div class="Chat__MainField--Answer">
                  <form class="AnswerField" action="/butler" accept-charset="UTF-8" method="get">
                    <input type="submit" ans=1 value="${answer[1]}" class="AnswerBtn" >
                    <input type="submit" ans=2 value="${answer[2]}" class="AnswerBtn" >
                    <input type="submit" ans=3 value="${answer[3]}" class="AnswerBtn" >
                    <input type="submit" ans=4 value="${answer[4]}" class="AnswerBtn" >
                    <input type="submit" ans=5 value="${answer[5]}" class="AnswerBtn" >
                  </form>
                </div>`
  return html2;
  }
  function buildHTML_finite(answer_params){
    let html_finite = `<div class="Chat__MainField--Butler">
                        いろいろお話し頂き、ありがとうございます</br>
                        では、このままデータを更新します。よろしいでしょうか？
                      </div>
                      <div style="margin: 30px 30px; text-align: center;">
                        <form class="" action="/butler" accept-charset="UTF-8" method="get">
                          <input type="submit" answer=${answer_params} value="結果を更新します" class="Finite--btn">
                        </form>
                      </div>`
    return html_finite;
  }

  function clickAnswer(e) {
    e.preventDefault();

    const index = re_answer.index(this);
    $('.Chat__MainField--Answer')[count].innerHTML = `<div style="color: #fff;">
                                                        ${this.value}
                                                      </div>`;
  }
  function quiz() {
    let html = buildHTML_quiz(qa[count][0], count);
    $('.Chat__MainField').append(html);
    let html2 = buildHTML_answer(qa[count]);
    $('.Chat__MainField').append(html2);
  }


  let tabs = $(".ButlerMenu--btn");
  tabs.click(choiceQA);

});
