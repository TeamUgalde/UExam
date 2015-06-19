
var ready = function() {


    $(function () {
        $('#new-exam-expiration-date').datetimepicker( {
            format: 'YYYY-MM-DD',
            icons:{
                time: 'fa fa-clock-o',
                date: 'fa fa-calendar',
                up: 'fa fa-chevron-up',
                down: 'fa fa-chevron-down',
                previous: 'fa fa-chevron-left',
                next: 'fa fa-chevron-right',
                clear: 'fa fa-trash-o'}
        });
    });

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