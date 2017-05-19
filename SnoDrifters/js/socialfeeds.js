(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.9";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

//var tag = document.createElement('script');
//tag.src = "https://www.youtube.com/player_api";
//var firstScriptTag = document.getElementsByTagName('script')[0];
//firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

//// Replace the 'ytplayer' element with an <iframe> and
//// YouTube player after the API code downloads.
//var player;
//function onYouTubePlayerAPIReady() {
//    player = new YT.Player('ytplayer', {
//        height: '400px',
//        width: '100%',
//        videoId: 'pR1pH5wLfY8'
//    });
//}