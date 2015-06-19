// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var ready = function() {

    $("body").on("click", "#add-item-btn", function () {
        var html = getItemForm();
        $(".new-exam-container").append(html);
    });

    function getItemForm() {
        var html;
        $.ajax({
            method: 'get',
            url: '/items/new',
            async: false
        }).done(function (response) {
            html = response;
        });
        return html;
    }

    $("body").on("click", "#new-solved-exam", function () {
        var userId = $('#user-id-label').attr('user_id');
        var examId = $(this).attr('exam_id');
        console.log(userId)
        console.log(examId)
        $.ajax({
            method: 'post',
            url: '/solved_exams',
            async: false,
            data: {
                solved_exam: {
                    finished: false,
                    score: 0,
                    correct_answers: 0,
                    user_id: userId,
                    exam_id: examId
                }
            }
        })
    });
}

$(document).on('page:load', ready);
$(document).ready(ready);