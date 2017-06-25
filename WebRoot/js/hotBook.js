$(document).ready(function(){
	loadHotBookInfo();
});
function loadHotBookInfo() {
    $.post("/hotBook.action", {}, function (result) {
        $(".hotBook ol").empty();
        $.each(result.hotList, function (index, book) {
            $(".hotBook ol").append("<li><a href='/bookDetail.do?id=" + book.id + "'>" + book.title + "</a></li>");
        });
    });

}