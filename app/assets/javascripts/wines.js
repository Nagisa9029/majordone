$(function(){
  $('.List--image').click(function(e){
    $('.Main--image').fadeOut(500, function(){
      $('.Main--image').attr('src', e.target.src).fadeIn(500);
    });
  });

  var taste = gon.taste;
  if (taste["taste"] == null){
    taste_label = ["果実味", "渋味", "酸味"]
    color = ["#750225", "rgb(185, 6, 170)", "rgb(255, 181, 44)"]
    data = [taste["fruit_flavor"], taste["astringency"], taste["acidity"]]
    $('.Bar__Para__bar').addClass('Rouge_border');
    $('.Bar__Para__bar--ele').addClass('Rouge_bar');
  }else{
    console.log("コク");
    taste_label = ["果実味", "コク", "酸味"]
    color = ["rgb(105, 243, 84)", "rgb(2, 100, 9)", "rgb(173, 252, 71)"]
    data = [taste["fruit_flavor"], taste["taste"], taste["acidity"]]
    $('.Bar__Para__bar').addClass('Blanc_border');
    $('.Bar__Para__bar--ele').addClass('Blanc_bar');
  };

  var ctx = document.getElementById("myChart").getContext('2d');
  var myChart = new Chart(ctx, {
    type: 'pie',
    data: {
      labels: taste_label,
      datasets: [{
        backgroundColor: color,
        data: data
      }]
    }
  });

  let body_para = taste["body"] * 27.3
    $('.Bar__Para__bar--ele').animate({width: body_para}, 5000);
    if (taste["body"] == 10){
      $('.Bar__Para__bar--ele').addClass('Mav_body');
    };
});
