calculateOrder()
function changeQuanity(id,value,price)
	{
		$.ajax({
			type: "GET",		
			url: "http://localhost:8080/laptopshop/api/gio-hang/changSanPhamQuanity?id="+id+"&value="+value,
			success: function(result){
				calculatePrice(id,value,price);
				calculateOrder();
			},
			error : function(e){
				alert("Error: ",e);
				console.log("Error" , e );
			}
		});
	}

function deleteFromCart(id)
{
	$.ajax({
		type: "GET",		
		url: "http://localhost:8080/laptopshop/api/gio-hang/deleteFromCart?id="+id,
		success: function(result){
		    var element = document.getElementById("item"+id);
			element.parentNode.removeChild(element);
			calculateOrder();
		},
		error : function(e){
			alert("Error: ",e);
			console.log("Error" , e );
		}
	});
}

function calculatePrice(id,value,price)
{
	var element = document.getElementById("item"+id+"_total");
	element.innerHTML = accounting.formatMoney(value * price);
}

function calculateOrder()
{
	var element = document.getElementsByClassName("total");
	var res = 0;
	for (i = 0; i < element.length; i++) {
		let text = element[i].textContent.replaceAll(/\./g,"");
		res = res + parseInt(text);
	}
	var element2 = document.getElementById("ordertotal");
	resConvert = accounting.formatMoney(res);
	element2.innerHTML = resConvert + ' VND';
}

