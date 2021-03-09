jQuery(document).ready(function(){
    jQuery(".frm-list label").click(function(){
        jQuery(this).hide();
        jQuery(this).next().focus();
    });
    jQuery(".frm-list input").blur(function(){
        if (jQuery(this).val() == ""){
            jQuery(this).prev().show();
        }
    });
    jQuery(".MS_login_id").focus(function(){
        jQuery(this).siblings("label").hide();
    });
    jQuery(".MS_login_pw").focus(function(){
        jQuery(this).siblings("label").hide();
    });
    
    jQuery(".MS_login_id").val('');
});