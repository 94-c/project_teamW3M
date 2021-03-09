(function ($) {
    // 사이즈 차트 관련 js
    if ($('a.btn-size-chart')) {
        $('a.btn-size-chart').click(function () {
            var _chart = $('#sizeChart');
            if (_chart) {
                if (_chart.css('display') == 'block') {
                    _chart.hide();
                } else {
                    var _parent = $(this).parent('td');
                    var add_po = { top : 40, left: -352 };
                    var _css = { 'top': (_parent.offset().top + add_po.top) + 'px', 'left': (_parent.offset().left + add_po.left) + 'px' };
                    _chart.css(_css).show();
                }
                return false;
            }
        })
    }
    if ($('#sizeChart a.btn-close-layer')) {
        $('#sizeChart a.btn-close-layer').click(function () {
            $('#sizeChart').hide();
        });
    }
    
    //상품정보 탭 이동
    jQuery(".detailTab a").on('click', function(e){
		e.preventDefault();
		jQuery("html,body").animate({scrollTop:jQuery(this.hash).offset().top - 70},300);
	});
    
    //선택완료 버튼
    jQuery(".sel-btn a").html("선택완료");
    
})(jQuery);