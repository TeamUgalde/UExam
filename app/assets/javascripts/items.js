// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var ready = function () {
    $('body').on("click", ".item-option", function() {
        var ul = $(this).parent().parent();
        var itemId = $(this).attr('item_id');
        $(this).parent().addClass("incorrect-option");
        var correctOption = getCorrectOption(itemId);
        ul.children().each( function() {
            var $input = $(this).find('input');
            var optionNumber = $input.attr('value');
            if (optionNumber == correctOption) {
                $(this).addClass("correct-option");
            }
            $input.attr('disabled', true);
        })

        var user_answer = $(this).attr('value');
        var solvedExamId = $('#solved-exam-label').attr('solved_exam_id');
        var correctAnswerAmount = getCorrectAnswers(solvedExamId);
        if (correctOption == user_answer) {
            increaseCorrectAnswers(solvedExamId, correctAnswerAmount);
        }
    })

    function increaseCorrectAnswers(solvedExamId, correctAnswerAmount) {
        $.ajax({
            method: 'put',
            url: "/solved_exams/" + solvedExamId,
            async: false,
            data: {
                correct_answers: correctAnswerAmount+1
            }
        })
    }

    function getCorrectAnswers(solvedExamId) {
        var res;
        $.ajax({
            method: 'get',
            url: "/solved_exams/"+solvedExamId+"/correct_answers",
            async: false
        }).done(function(response){
            res = response;
        });
        return res;
    }

    function getCorrectOption(itemId) {
        var res;
        $.ajax({
            method: 'get',
            url: "/items/"+itemId+"/correct_option",
            async: false
        }).done(function(response){
            res = response;
        });
        return res;
    }


}

$(document).on('page:load', ready);
$(document).ready(ready);