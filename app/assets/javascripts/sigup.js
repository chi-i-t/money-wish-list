$(function(){
  $('.js-modal-open').on('click',function(){
      $('.js-modal').fadeIn();
      return false;
  });
  $('.js-modal-close').on('click',function(){
      $('.js-modal').fadeOut();
      return false;
  });
});

$(function(){
  $('.js-modal-calculator-open').on('click',function(){
    $('.js-modal-calculator').fadeIn();
    return false;
  });
  $('.js-modal-calculator-close').on('click',function(){
    $('.js-modal-calculator').fadeOut();
    return false;
  });
});

