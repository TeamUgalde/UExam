/**
 * Created by luis on 6/12/15.
 */

$.ajax({
    method: "get",
    url: '/exams',
    async: true,
    success: function(html){
        $("#exam-list").html(html);
    }
});
