$(function() {
  qa = new Array();
  count = 0; 
  answer_param = [];

  function choiceQA(){
    answer_param[0] = tabs[0].name;
    const index = tabs.index(this);
    if (index == 1) {
      qa[0] = ["ワインについて教えてください","好きだが、詳しくない","スパークリングワインが好きです","白が好きです","赤が好きですね","自称ですが、詳しいです"];
      qa[1] = ["お酒は好きですか？","弱いです","あまり飲まない","普通かな","まあまあ好き","大好き"];
      qa[2] = ["普段ワインは飲まれますか？","飲む機会がありません","苦手です","たまに","よく飲む","ほぼ毎日"];
      qa[3] = ["好きなお酒は何ですか？","どれも苦手です","度数の強い酒","ワイン","ビール","日本酒"];
      qa[4] = ["好きなタイプのワインはありますか？","特に好き嫌いはない","軽い白","重い白","軽い赤","重い赤"];
      qa[5] = ["白ワインで苦手なタイプはありますか？","基本白は苦手","甘口","濃厚なコクのあるやつ","キリッと爽やか","どれも好きです"];
      qa[6] = ["赤ワインで好きなタイプはありますか？","基本赤は苦手","フレッシュな軽いタイプ","年代物の古酒","どっしり濃ぃーやつ","どれも好きです"];
      qa[7] = ["味付けといえば？","しょうゆ","ソース","塩","薄味がいちばん","なんでも辛くする"];
      qa[8] = ["辛いものは好きですか？","苦手です","普通がいちばん","まぁ、大丈夫","結構、いける口です","無類の激辛好き"];
      qa[9] = ["コーヒーはどうやって飲む？","コーヒーは飲まない","砂糖","ミルク","砂糖・ミルク","ブラック"];
    }

    quiz();

    let re_answer = $(".AnswerBtn");
    re_answer.click(clickAnswer);
    

    function clickAnswer(e) {
      e.preventDefault();

      $('.Chat__MainField--Answer')[count].innerHTML = `<div style="color: #fff;">
                                                          ${this.value}
                                                        </div>`;
      count += 1;
      const num = re_answer.index(this);
      answer_param[count] = (num + 1)

      if (count >= 10) {
        let html_finite = buildHTML_finite(answer_param);
        $('.Chat__MainField').append(html_finite);
        $('.Chat__MainField').animate({ scrollTop: $('.Chat__MainField')[0].scrollHeight});
        console.log(answer_param);
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
  function buildHTML_finite(answer_param){
    let html_finite = `<div class="Chat__MainField--Butler">
                        いろいろお話し頂き、ありがとうございます</br>
                        では、このままデータを更新します。よろしいでしょうか？
                      </div>
                      <div style="margin: 30px 30px; text-align: center;">
                        <form class="" enctype="multipart/form-data" action="/roots" accept-charset="UTF-8" method="post">
                          <input type="hidden" name="taste_params" value="${answer_param}">
                          <input type="submit" name="commit" value="結果を更新します" class="Finite--btn">
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
