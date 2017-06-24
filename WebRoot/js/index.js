$(document).ready(function(){
    $.post("/hotBook.action",[],function(result){
            $(".hotBook ul").empty();
        $.each(result.hotList,function(index,book){
            $(".hotBook ul").append("<li>"+book.title+"");
        });
    });
});