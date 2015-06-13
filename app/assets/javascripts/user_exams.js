
var ready = function() {

    $.ajax({
        method: "get",
        url: '/solved_exams',
        async: true,
        data: {state: "True"},
        success: function(html){
            if(html != "") $("#completed-exams").html(html);
            else $("#completed-exams").html(printEmptyResultMessage("#completed-exams"));
        }
    });

    $('.nav-tabs').on('click', '.exam-tab', function() {
        var path = $(this).attr('path');
        var divId = $(this).attr('div');
        var state = $(this).attr('state');
        $.ajax({
            method: "get",
            url: path,
            async: true,
            data: {state: state},
            success: function(html){
                if(html != "") $(divId).html(html);
                else $(divId).html(printEmptyResultMessage(divId));
            }
        });
    });

    function printEmptyResultMessage(id) {
        var res;
        if(id == "#created_exams") res = "Usted no ha creado examenes.";
        else if(id == "#pending-exams") res = "No  tiene examenes pendientes";
        else res = "No ha resuelto ningun examen";
        res = "<h4>"+res+"</h4";
        return res;
    }
}

$(document).on('page:load', ready);
$(document).ready(ready);