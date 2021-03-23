//====================================================================
//장바구니 부분 공통 스크립트
//===================================================================
var basketchks      = document.getElementsByName('basketchks');
var basket_item     = document.getElementsByName('basket_item');

// 천단위 콤마 붙이기
String.prototype.number_format = function() {
    return this.replace(/(\d)(?=(?:\d{3})+(?!\d))/g,'$1,');
};
Number.prototype.number_format = function() {
    return this.toString().number_format();
};
//전체선택
function all_basket_check(all_check_obj) {
    for (var i = 0; i < basketchks.length; i++) {
		basketchks[i].checked  = all_check_obj.checked; 
    }
    cal_basket_chk(null);
}

function basket_multidel(){
	
	var ar_multi;
	if (basket_checkbox_validate() == false) {
        return;
    }
	//if (confirm("선택한 상품(들)을 삭제하시겠습니까?")) {

		for (var i = 0; i < basketchks.length; i++) {

			if(basketchks[i].checked == true ) {				
				ar_multi += basket_item[i].value+"|@|";
			}
		}
		ar_multi = ar_multi.replace("undefined","");

		document.multdelform.type.value = "multidel";
		document.multdelform.setype.value = ar_multi;
		document.multdelform.submit();

	//}
}
	
function multi_order(temp){

	var ar_multi;
        if (basketchks.length==0) {
	    document.multdelform.navertype.value = temp;
            multi_all_order(temp);
            return;
        }

	if (basket_checkbox_validate() == false) {
        	return;
    	}
	var si= 0;
	var si2 =0;
 	//if (confirm("선택한 상품(들)을 주문하시겠습니까?")) {
		for (var i = 0; i < basketchks.length; i++) {
			if(basketchks[i].checked == false ) {
				ar_multi += basket_item[i].value+"|@|";
				si ++;
			}
		}
		if( si > 0 ){ 
			ar_multi = ar_multi.replace("undefined","");
		}


		if( si == 0 ){
			ar_multi = "allbasket";
		}
		document.multdelform.type.value = "multiorder";
		document.multdelform.navertype.value = temp;
		document.multdelform.setype.value = ar_multi;

        // 페이코 간편구매
        if (temp == 'payco_checkout') {
            if (typeof MOBILE_USE != 'undefined' && MOBILE_USE == 1) {
                document.multdelform.target = "";
            }
            else {
                window.open('', 'payco_win', 'width=692');
                document.multdelform.target = "payco_win";
            }
        }

        // 페이스북 광고 스크립트 - 주문 시작
        if (document.multdelform.facebook_pixel_id != undefined) {
            // InitiateCheckout
            // Track when people enter the checkout flow (ex. click/landing page on checkout button)
            fbq('track', 'InitiateCheckout');
        }

		document.multdelform.submit();

        // 페이코 간편구매
        if (temp == 'payco_checkout') {
            document.multdelform.target = "";
        }
	//}
}

function multi_all_order(temp){


 	//if (confirm("전체상품을 주문하시겠습니까?")) {

		for (var i = 0; i < basketchks.length; i++) {
			if (basketchks[i].checked === false) {
				basketchks[i].checked = true;
			}
		}

        // 페이코 간편구매
        if (temp == 'payco_checkout') {
            if (typeof MOBILE_USE != 'undefined' && MOBILE_USE == 1) {
                document.multdelform.target = "";
            }
            else {
                window.open('', 'payco_win', 'width=692');
                document.multdelform.target = "payco_win";
            }
        }

        // 페이스북 광고 스크립트 - 주문 시작
        if (document.multdelform.facebook_pixel_id != undefined) {
            // InitiateCheckout
            // Track when people enter the checkout flow (ex. click/landing page on checkout button)
            fbq('track', 'InitiateCheckout');
        }

		document.multdelform.type.value = "multiorder";
		document.multdelform.setype.value = "allbasket";
		document.multdelform.submit();

        // 페이코 간편구매
        if (temp == 'payco_checkout') {
            document.multdelform.target = "";
        }
	//}
}
	

	
function basket_checkbox_validate() {
    var c = 0;
    for (var i = 0; i < basketchks.length; i++) {
        if (basketchks[i].checked === true) {
            c++;
        }
    }
    if (typeof d4 != 'undefined' && d4) {
    if (jQuery('input[name=basketchks]:checked').length == jQuery('input[name=basketchks]').length) {                 
        jQuery('input[name=__allcheck]').attr('checked', true);                                                       
    } else {                                                                                                          
        jQuery('input[name=__allcheck]').attr('checked', false);                                                      
    }  
    }
    if (c == 0) {
        alert("상품을 선택해 주십시오.");
    if (typeof d4 != 'undefined' && d4) {
        change_html('total_price_sell', 0, false);
        change_html('total_vat',0);
        change_html('total_delivery',0);
        change_html('total_delivery_add',0);
        change_html('group_sale_price',0);
        change_html('group_sale_reserve',0);
        change_html('sale_total_sell_price',0);
        change_html('none_groupsale_total_price_sell',0);
        change_html('total_price',0, false);
        change_html('total_package_price',0);
        change_html('total_reserve',0);
        change_html('total_point',0);

            var init_pvd_code = typeof pvd_codes == 'object' ? clone(pvd_codes) : false;
            if (init_pvd_code !== false) {
                jQuery.each(init_pvd_code, function(i, v) {
                    if (pvd_chg_txt_chk === true) {
                        jQuery.each(pvd_price_txt, function (pt,pv) {
                           change_html(pt + i, 0, false);
                        });
                    } else if(pvd_chg_txt_chk === false) {
                        jQuery('.MK_change_provider' + i + '_price').html('0');
                    }
                });
            }
        }
        return false;
    }
}

function change_html(chk_text, set_data, hide_option) {
    if (typeof jQuery('.MK_' + chk_text) != 'undefined' && jQuery('.MK_' + chk_text) != null && jQuery('.MK_' + chk_text).length > 0 && ((set_data > 0 && hide_option !== false) || hide_option === false)) {
        jQuery('.MK_' + chk_text).show();
        jQuery('.MK_chg_' + chk_text).html(set_data.number_format());
    } else {
        jQuery('.MK_' + chk_text).hide();
    }
}

function clone(obj) {
    var output = {};
    for(var i in obj) {
        output[i] = obj[i];
    }
    return output;
}

jQuery(function() {
    jQuery('input[name="basketchks"]').click(function() {
        var _this = jQuery(this), _item = {}, _extra = {};
        var _index = jQuery('input[name="basketchks"]').index(_this);
        if (typeof jQuery('input[name="basket_item"]').eq(_index).val() != 'undefined') {
            _item = jQuery.parseJSON(jQuery('input[name="basket_item"]').eq(_index).val());
        }
        if (typeof jQuery('input[name="extra_item"]').eq(_index).val() != 'undefined') {
            _extra = jQuery.parseJSON(jQuery('input[name="extra_item"]').eq(_index).val());
        }

        if (_this.is(':checked') === true) {
                if (_item.cart_type == 'NORMAL') {
                    if (typeof _extra.extra_require_uid != 'undefined' && _extra.extra_require_uid != null) {
                        var _eu_ar = _extra.extra_require_uid.split(','),
                            _checked = true;

                        _eu_ar.forEach(function(v, i) {
                            if (jQuery('.pr_EXTRA_' + v + '_' + _item.uid).size() > 0) {
                                if (jQuery('.pr_EXTRA_' + v + '_' + _item.uid).prop('checked') === false) {
                                    _checked = false; 
                                    jQuery('.pr_EXTRA_' + v + '_' + _item.uid).prop('checked', true);
                                }
                            }
                        });
                        if (_checked === false) {
                            alert('필수로 같이 구매해야 하는 추가 구성 상품도 동시에 선택됩니다.');
                        }
                    }
                }
        } else {
            if (_item.cart_type == 'EXTRA') {
                if (_extra.extra_require == 'Y') {
                    if (jQuery('.pr_NORMAL_' + _item.pack_uid + ':checked').size() > 0) {
                        alert('메인 상품 [' + decodeURIComponent(_extra.extra_main_brandname) + '] 구매 시, 같이 구매해야 하는 상품이므로 메인 상품도 선택 해제됩니다.');
                        jQuery('.pr_NORMAL_' + _item.pack_uid).prop('checked', false);
                    }
                }
            }
        }
    });
});

var is_basket_price_process = false;
function cal_basket_chk(obj) { 
    if (obj != null) {
        var _this = jQuery(obj), _item = {}, _extra = {};
        var _index = jQuery('input[name="basketchks"]').index(_this);
        if (typeof jQuery('input[name="basket_item"]').eq(_index).val() != 'undefined') {
            _item = jQuery.parseJSON(jQuery('input[name="basket_item"]').eq(_index).val());
        }
        if (typeof jQuery('input[name="extra_item"]').eq(_index).val() != 'undefined') {
            _extra = jQuery.parseJSON(jQuery('input[name="extra_item"]').eq(_index).val());
        }

        if (_this.is(':checked') === true) {
                if (_item.cart_type == 'NORMAL') {
                    if (typeof _extra.extra_require_uid != 'undefined' && _extra.extra_require_uid != null) {
                        var _eu_ar = _extra.extra_require_uid.split(','),
                            _checked = true;

                        _eu_ar.forEach(function(v, i) {
                            if (jQuery('.pr_EXTRA_' + v + '_' + _item.uid).size() > 0) {
                                if (jQuery('.pr_EXTRA_' + v + '_' + _item.uid).prop('checked') === false) {
                                    _checked = false; 
                                    jQuery('.pr_EXTRA_' + v + '_' + _item.uid).prop('checked', true);
                                }
                            }
                        });
                        if (_checked === false) {
                            alert('필수로 같이 구매해야 하는 추가 구성 상품도 동시에 선택됩니다.');
                        }
                    }
                }
        } else {
            if (_item.cart_type == 'EXTRA') {
                if (_extra.extra_require == 'Y') {
                    if (jQuery('.pr_NORMAL_' + _item.pack_uid + ':checked').size() > 0) {
                        alert('메인 상품 [' + decodeURIComponent(_extra.extra_main_brandname) + '] 구매 시, 같이 구매해야 하는 상품이므로 메인 상품도 선택 해제됩니다.');
                        jQuery('.pr_NORMAL_' + _item.pack_uid).prop('checked', false);
                    }
                }
            }
        }
    }

    if (basket_checkbox_validate() == false) {
        return;
    }

    j = 0;
    var list = '';
    for (var i = 0; i < basketchks.length; i++) {
        if (basketchks[i].checked != false) {
            list += basket_item[i].value + ',';
            j++;
        }
    }

    list = list.substr(0, list.length-1);
    var chk_pvd_code = typeof pvd_codes == 'object' ? clone(pvd_codes) : false;
    if (is_basket_price_process) {
        alert('가격 계산중입니다.');
    }

    jQuery.ajax({
        type : 'POST',
        url : '/' + local_path + '/basket.html',
        dataType : 'json',
        async : true,
        data : jQuery.parseJSON('{ "basket_list" : [' + list + ']}'),
        beforeSend : function() {
            jQuery('.MK_basket_price_check_loading').show();
            is_basket_price_process = true;
        },
        success : function(res) {
            if (res.RESULT !== true) {
                if (res.MSG.length > 0) {
                    alert(res.MSG);
                    location.reload();
                } else {
                    alert('상품 옵션이 변경되어 주문이 불가능한 상품은 제외합니다');
                }
            }

            // 총 금액 정보
            var total_data = res.TOTAL;
            // 부가세
//            console.log('test', total_data);
            change_html('total_vat', total_data.total_vat);
            // 배송비
            change_html('total_delivery_add', total_data.total_delivery_add);
            change_html('total_delivery', parseInt(total_data.total_delivery));

            // 그룹할인
            change_html('group_sale_price', total_data.group_sale_price);
            change_html('group_sale_reserve', total_data.group_sale_reserve);
            change_html('sale_total_sell_price', total_data.total_price_sell);
            change_html('none_groupsale_total_price_sell', total_data.none_group_total_price_sell);
            change_html('total_price_sell', total_data.total_price_sell);
            change_html('total_price', total_data.total_price);
            /*
            //if (typeof jQuery('#MK_group_sale_price').html() != 'undefined' && jQuery('#MK_group_sale_price').html() != null) {
            if (total_data.none_group_total_price_sell > 0 ) {
                //jQuery('.MK_chg_group_sale_price').html(total_data.total_groupsale_price.number_format());

                // 상품총금액
                change_html('total_price_sell', total_data.total_price_sell);
                change_html('total_sale_total_sell_price', total_data.sale_total_sell_price);
                change_html('none_groupsale_total_price_sell', total_data.none_group_total_price_sell);
                change_html('total_price', total_data.total_price);
            } else {
                // 그룹할인 포함 총금액
                change_html('sale_total_sell_price', total_data.total_sell_price);
                change_html('none_groupsale_total_price_sell', total_data.total_sell_price);
                change_html('total_price_sell', parseInt(total_data.total_price_sell) + parseInt(total_data.none_group_total_price_sell));
                change_html('total_price', parseInt(total_data.total_price) + parseInt(total_data.none_group_total_price_sell));
            }
            */
            // 세트할인

            change_html('total_package_price', total_data.total_package_price);
            change_html('total_reserve', total_data.total_reserve);
            change_html('total_point', total_data.total_point);
            //console.log('start', pvd_price_txt);
            if (typeof total_data.provider != 'undefined') {
                jQuery.each(total_data.provider, function(i, v) {
                    delete chk_pvd_code[i];
                    jQuery.each(v, function(ti, tv) {
                        // 통합 장바구니2 의 각각의 가격 노출 부분은 가격이 0이어도 영역을 없애지 않는다.
                        change_html(ti + i, tv, false);

                        // 필드 변화 되는 값을 저장하기 위한 초기 셋팅 값
                        if (pvd_chg_txt_chk === false) {
                            pvd_price_txt[ti] = true;
                        }
                    });
                    txt_chk_idx = true;
                });
                pvd_chg_txt_chk = true;

                // pvd_code 가 남아있는 경우 
                // 가격이 0인 경우 이므로 초기화 처리를 해준다? 
                jQuery.each(chk_pvd_code, function(i, v) {
                    jQuery.each(pvd_price_txt, function (pt,pv) {
                       change_html(pt + i, 0, false);
                    });
                });
            }
            jQuery('.MK_basket_price_check_loading').hide();
            is_basket_price_process = false;
        }, error : function() {
            alert('잠시 후 시도해주시기 바랍니다');
        }
    });
}
