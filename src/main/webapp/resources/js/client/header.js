$(document).ready(function(){
	ajaxGet2();
	function ajaxGet2(){
		$.ajax({
			type: "GET",		
			url: "http://localhost:8080/laptopshop/api/danh-muc/allForReal",
			success: function(result){
				$.each(result, function(i, danhmuc){
					var content = '<li><a href="/laptopshop/store?brand='+danhmuc.tenDanhMuc+'">'+danhmuc.tenDanhMuc+'</a></li>';
					$('.category-render').append(content);		
				})					
			}	
		});
			
	}
})
