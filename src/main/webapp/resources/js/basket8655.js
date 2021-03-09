(function($){
 $(function(){
  $('.cart-free-wrap > .btn-list-open').click(function(){
   $(this).find('span').toggleClass('open');

   if ( $(this).find('span').hasClass('open') ){
    $(this).html('무료배송 추천상품 보기 <span class=open></span>');
   } else {
    $(this).html('무료배송 추천상품 닫기 <span></span>');
   }
   $('.cart-free-wrap .list-wrap').toggle();
  });
 });
})(jQuery);