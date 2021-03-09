jQuery(document).ready(function() {

	/* morenvy.com 상단 올라가기 */
	jQuery("a.scroll").click(function(event){
		event.preventDefault();
		jQuery('html,body').animate({scrollTop:jQuery(this.hash).offset().top}, 800);
	});
    
	/* morenvy.com 상단 카테고리 */
	jQuery('#left_menu > li').mouseenter(function() {
		jQuery(this).find('.sub1').css("display","block");
		jQuery("> a", this).addClass('mouse_hover');
	}).mouseleave(function() {
		jQuery("> a", this).removeClass('mouse_hover');
		jQuery(this).find(".sub1").css("display","none");
	});

	/* morenvy.com 상단 카테고리 소분류 */
	jQuery('#left_menu > li .sub1 > li').mouseenter(function() {
		jQuery(this).find('.sub2').css("display","block");
		jQuery("> a", this).addClass('sub_mouse_hover');
		jQuery(this).find('.sub_cate_on_arrow').addClass('rotateon');
	}).mouseleave(function() {
		jQuery(this).find('.sub_cate_on_arrow').removeClass('rotateon');
		jQuery("> a", this).removeClass('sub_mouse_hover');
		jQuery(this).find(".sub2").css("display","none");
	});
        
        /* 상단 적립금 아이콘 */
	function loop() {
		jQuery('.scroll').animate ({ bottom: '+=4' }, 500)
			.animate({ bottom: '-=4' }, 500)
			.animate({ bottom: '+=4' }, 500)
			.animate({bottom: '-=4'}, 500, function() {
		loop();
		});
	}
	loop();
    
	/* morenvy.com 상단메뉴 스크롤 고정 */
	var msie6 = $.browser == 'msie' && $.browser.version < 7;
		if (!msie6) {
		var top = jQuery('#comment_top').offset().top;
		jQuery(window).scroll(function(event) {
		// what the y position of the scroll is
		var y = jQuery(this).scrollTop();

		// whether that's below the form
		if (y >= top) {
		// if so, ad the fixed class
		jQuery('#comment_top').addClass('fixed');
		} else {
		// otherwise remove it
		jQuery('#comment_top').removeClass('fixed');
		}
		});
	}

	/* morenvy.com 상품 할인율 */
	jQuery( ".salebox" ).each(function( index ) {

		var custom_price = jQuery( this ).find( "input[name='custom_price']" ).val(); // 소비자가
		var product_price = jQuery( this ).find( "input[name='product_price']" ).val(); // 판매가
		var sale_cnt = "";

		if (custom_price == "" )  custom_price = 0;
		else custom_price =  parseInt(custom_price);

		if (product_price == "" )  product_price = 0;
		else product_price =  parseInt(product_price.replace(",",""));

		if(  ( custom_price > 0 )  && ( product_price > 0 )  && ( custom_price > product_price  ) ) {
			sale_cnt = Math.round(  ( custom_price - product_price ) / custom_price * 100 );
			jQuery( this ).find('.sale_text').text(sale_cnt + '%');
			jQuery( this ).find('.sale_text').css("display", "block");
		} else {
			jQuery( this ).find('.sale_text').css("display", "none");
		}
	});

});
   