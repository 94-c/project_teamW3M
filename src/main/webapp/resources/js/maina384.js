jQuery(document).ready(function() {
	/* 메인 슬라이드 */
	jQuery(".contentslider-main").sliderkit({
		auto:1, /* 0 : 클릭하면 동작, 1 : 자동 동작 */
		circular:1,
		navitemshover:false,
		panelfx:"fading", // fading , sliding, none 사용가능
		panelfxfirst:"none",
		panelfxeasing:"easeInOutExpo",
		keyboard:1,
		autospeed: 6000
	});

    /* 룩북배너 */
    jQuery(".contentslider-look").sliderkit({
        auto:1, /* 0 : 클릭하면 동작, 1 : 자동 동작 */
        tabs:1,
        circular:1,
        panelfx:"sliding", // fading , sliding, none 사용가능
        panelfxfirst:"none",
        panelfxeasing:"easeInCubic",
        fastchange:0,
        keyboard:1,
        autospeed:6000
    });

    /* 동영상영역 */
        jQuery(".contentslider-tab").sliderkit({
        auto:0, /* 0 : 클릭하면 동작, 1 : 자동 동작 */
        autospeed:6000, // 변환속도
        tabs:3,
        navitemshover:true, // true:마우스 오버시 동작. false:마우스 클릭시 동작
        circular:1,
        panelfx:"fading", // fading , sliding, none 사용가능
        panelfxfirst:"none",
        panelfxeasing:"easeInCubic",
        panelfxspeed:200, //변환효과속도
        fastchange:1,
        keyboard:1
    });

	/* morenvy.com 마우스오버상품 레이어 */
	$('.fade').mosaic();
});


jQuery(".tab01").mouseover(function() {
	stopYoutube1();
});
jQuery(".tab02").mouseover(function() {
	stopYoutube1();
});
jQuery(".tab03").mouseover(function() {
	stopYoutube1();
});

/* morenvy.com 유튜브 탭재생 */
var tag = document.createElement('script');
tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

var player1;
var player2;
var player3;
function onYouTubeIframeAPIReady() {
	player1 = new YT.Player('video1', {
		height: '400',            // 세로크기
		width: '710',             // 가로크기
		videoId: 'KmCJCZHE1eY',   // 동영상1 아이디값
		origin : 'welkeeps.com',
		playerVars: {             
		controls: '2'
		}
	});

	player2 = new YT.Player('video2', {
		height: '400',            
		width: '710',             
		videoId: 'yVIwI8Iosto',   // 동영상2 아이디값
		origin : 'welkeeps.com',
		playerVars: {             
		controls: '2'
		}
	});
}

function onPlayerReady(event) {
	event.target.playVideo();	
}

function stopYoutube1() {
	player1.seekTo(0, true);     
	player1.stopVideo();
	player2.seekTo(0, true);     
	player2.stopVideo();
	player3.seekTo(0, true);     
	player3.stopVideo();
}


var bannerFunc = function(){
    $('.promoBanner .btnClose').bind("click", function(){
        $('.promoBanner').animate({height: 0}, 500);
    });
};
$(function($){
    bannerFunc();
});
