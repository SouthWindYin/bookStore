$(document).ready(function () {
    loadAllBookInfo();
    getBookInfoByBookType();

});

function loadAllBookInfo(page){
	if(page==null){
		page=1;
	}
    $.post("/allBook.action",{page:page},function(result){
        if(result.bookList!=null){
        	$(".bookInfoList").empty();
        	$.each(result.bookList,function(index,book){
        		if(index<4){
                    $(".bookInfoList").append("<div class='col-md-3'><div class='book'><a href='/bookDetail.do?id=" + book.id + "'><img class='img-thumbnail bookPic' src='"+book.pictureUrl+"'><div class='btn btn-link'>"+book.title+"</div></a></div></div>");
                } else{
                    $(".bookInfoList").append("<div class='col-md-3'><div class='book'><a href='/bookDetail.do?id=" + book.id + "' class='btn btn-link'>"+book.title+"</a></div></div>");
                }
        	});
        	//添加页码
        	$(".pageNum").remove();
        	for(var i=1;i<=result.pageSum;i++){
        		$("nav .pagination li:last").before("<li class='active pageNum' data-page="+i+"><a href='#'>"+i+"</a></li>");
        	}
        	$("nav .pagination li").removeClass("active");
        	$("nav .pagination li[data-page='"+result.page+"']").addClass("active");
        	$("nav .pagination li").click(function(e){
        		loadAllBookInfo($(e.currentTarget).attr("data-page"));
        	});
        }
    });
}

function getBookInfoByBookType(page){
	if(page==null){
		page=1;
	}
	$(".bookInfo>a").click(function(e){
		$(".bookInfo>a").removeClass("active");
		$(e.currentTarget).addClass("active");
		//加载数据
		var bookType = $(e.currentTarget).html();
		if(bookType=="全部"){
			loadAllBookInfo(page);
			return;
		}
		var params = {page:page,bookType:bookType};
		$.post("/getBookByBookType.action",params,function(result){
			if(result.bookList!=null){
	        	$(".bookInfoList").empty();
	        	$.each(result.bookList,function(index,book){
	        		if(index<4){
	                    $(".bookInfoList").append("<div class='col-md-3'><div class='book'><a href='/bookDetail.do?id=" + book.id + "' ><img class='img-thumbnail bookPic' src='"+book.pictureUrl+"'><div class='btn btn-link'>"+book.title+"</div></a></div></div>");
	                } else{
	                    $(".bookInfoList").append("<div class='col-md-3'><div class='book'><a href='/bookDetail.do?id=" + book.id + "' class='btn btn-link'>"+book.title+"</a></div></div>");
	                }
	        	});
	        	//添加页码
	        	$(".pageNum").remove();
	        	for(var i=1;i<=result.pageSum;i++){
	        		$("nav .pagination li:last").before("<li class='active pageNum' data-page="+i+"><a href='#'>"+i+"</a></li>");
	        	}
	        	$("nav .pagination li").removeClass("active");
	        	$("nav .pagination li[data-page='"+result.page+"']").addClass("active");
	        	$("nav .pagination li").click(function(e){
	        		getBookInfoByBookType($(e).attr("data-page"));
	        	});
	        }
		});
	});
}