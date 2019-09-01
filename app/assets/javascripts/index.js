$(function(){
  $(' p.word-box__bottom__show').click(function(e){
    e.preventDefault();
    $(this).next('ul.word-box__bottom__mean').slideToggle();
  })
})

