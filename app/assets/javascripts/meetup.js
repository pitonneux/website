
$(document).ready(function() {
    function addScript(src) {
        console.log(src);
        var s = document.createElement( 'script' );
        s.setAttribute( 'src', src );
        document.body.appendChild( s );
    }

    window.gotIt = function(data) {
        alert(data.data[0].created);
        $('#results').append('Got... something');
    }

    addScript('https://api.meetup.com/pitonneux/events?photo-host=public&page=10&sig_id=195641644&sig=3c9a7b49b18362a2e7f49adb63e161d4f6da4ec3&callback=gotIt');

});

