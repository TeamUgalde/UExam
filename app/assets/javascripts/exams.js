// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var ready = function() {

    $("body").on("click","#add-item-btn",function() {
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

    $("body").on("click","#create-exam-btn",function() {
        var exam = {}
        exam["title"] = $("#new-exam-title").val();
        exam["expirationDate"] = $("#expiration-date-input").val();
        exam["timeLimit"] = $("#new-exam-time-limit").val();
        var itemList = [];

        $(".new-exam-container > .new-item-container").each(function() {
            var item = {};
            item["question"]   = $(this).find("input[name='new-item-title']").val();
            item["option1"] = $(this).find("input[name='choice1']").val();
            item["option2"] = $(this).find("input[name='choice2']").val();
            item["option3"] = $(this).find("input[name='choice3']").val();
            item["option4"] = $(this).find("input[name='choice4']").val();
            item["option5"] = $(this).find("input[name='choice5']").val();
            item["correctOption"] = $(this).find("input[name='choice']:checked").attr("value");
            itemList.push(item);
        });

        exam["itemList"] = itemList;
        saveExamAjax(exam);
    });

    function saveExamAjax(exam) {
        $.ajax({
            method: 'post',
            url: '/exams',
            data: {exam: exam},
            async: false,
            statusCode: {
                500: function () {
                    alert("Error en el servidor");
                }
            }
        });
    }

}

$(document).on('page:load', ready);
$(document).ready(ready);