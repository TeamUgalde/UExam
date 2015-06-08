
var ready = function() {

    $('body').on('click', '.enter-link', function(e) {
        var href = $(this).attr('href');
        $.ajax({
            method: "get",
            url: href,
            async: true,
            success: function(html){
                $('#nav-modal-body').html(html);
            }
        });
    });
}

$(document).on('page:load', ready);
$(document).ready(ready);