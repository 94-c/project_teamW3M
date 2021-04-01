/**
 * bxSlider 관련 스크립트입니다.
 */

    $(document).ready(function(){
      $('.sliderkit-panel1').bxSlider({
    	  auto: true,
    	  speed: 500,
    	  pause: 3000,
    	  mode:'horizontal',
    	  pager:false,
      });
      
      $('.sliderkit-panel2').bxSlider({
    	  auto: true,
    	  speed: 500,
    	  pause: 6000,
    	  mode:'vertical',
    	  pager:false,
      });
      
      $('.sliderkit-panel3').bxSlider({
    	  auto: true,
    	  speed: 1000,
    	  pause: 6000,
    	  mode:'fade',
    	  pager:false,
      });
    });