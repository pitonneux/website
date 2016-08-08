$(document).ready(function() {
    $(".close-flash").click(function() {
        $(this).parent().fadeOut();
    });

    setTimeout(function() {
      $('#flash').fadeOut();
    }, 5000);
});
