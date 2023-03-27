
function addToCart(id)
	{
		$.ajax({
			type: "GET",		
			url: "http://localhost:8080/laptopshop/api/gio-hang/addSanPham?id="+id,
			success: function(result){
				if(result.status == "false")
				{
					window.alert("Sản phẩm đang hết hàng, quý khách vui lòng quay lại sau");	
				}else
				{
					window.alert("Đã thêm sản phẩm vào giỏ hàng");
				}		
			},
			error : function(e){
				alert("Error: ",e);
				console.log("Error" , e );
			}
		});

		
	}


$(document).ready(function(){
	ajaxGet();

	function ajaxGet(){
		$.ajax({
			type: "GET",		
			url: "http://localhost:8080/laptopshop/api/san-pham/latest",
			success: function(result){
				let content;
				let product;
				$.each(result, function(i, sanpham){
				if(i<8){
                  content ='<div class="swiper-slide">' +
                  		          '<div class="movie-box">' + '<a target="_self" href="/laptopshop/sp?id=' + sanpham.id + '">' +
                  		             '<img src="/laptopshop/img/'+sanpham.id+'.png" class="movie-box-img" />' + '</a>'  +
                  		             '<div class="box-text">' +
                  		             	'<h2 class="movie-title">' + '<a target="_self" href="/laptopshop/sp?id=' + sanpham.id + '">' + sanpham.tenSanPham +  '</a>'+ '</h2>' + 
                  		             	'<span class="movie-type">' + accounting.formatMoney(sanpham.donGia) + ' đ</span>' +
                  		                '<a href="#!" class="watch-btn play-btn" onClick="addToCart(' +
                                sanpham.id +
                                ')">' +
                                            '<i class="bx bx-cart-add"></i>' + '</a>'+
                  		             '</div>'+
                  		            '</div>'+
                  		            '</div>'
                 $('.popular-swiper-wrapper').append(content); 		            
                  		  }
                  		 product = '<div class="movie-box">' + 
                  		             '<img src="/laptopshop/img/'+sanpham.id+'.png" class="movie-box-img" />' +
                  		             '<div class="box-text">' +
                  		             	'<h2 class="movie-title">' + '<a target="_self" href="/laptopshop/sp?id=' + sanpham.id + '">'+ sanpham.tenSanPham + '</a>' + '</h2>' + 
                  		             	'<span class="movie-type">' + accounting.formatMoney(sanpham.donGia) + ' đ</span>' +
                  		                '<a href="#!" class="watch-btn play-btn" onClick="addToCart(' +
                                				sanpham.id + ')">' +
                                            '<i class="bx bx-cart-add"></i>' + '</a>'+
                  		             '</div>'+
                  		            '</div>'
                  		       $('.movies-content').append(product);      
		        });
			},
			error : function(e){
				alert("Error: ",e);
				console.log("Error" , e );
			}
		});
	}
	
})



