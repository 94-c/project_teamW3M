/**
 * 상품관리 관련 스크립트입니다.
 */
	/*빈칸 체크*/
	function emptyCheck() {

		if (document.writeform.prod_code.value == "") {
			alert("상품코드를 입력하세요");
			document.writeform.prod_code.focus();
			return false;
		}
		if (document.writeform.prod_title.value == "") {
			alert("상품명을 입력하세요");
			document.writeform.prod_title.focus();
			return false;
		}
		if (document.writeform.prod_price.value == "") {
			alert("원가를 입력하세요");
			document.writeform.prod_price.focus();
			return false;
		}
		if (document.writeform.prod_price_sale.value == "") {
			alert("할인가를 입력하세요");
			document.writeform.prod_price_sale.focus();
			return false;
		}
		if (document.writeform.prod_point.value == "") {
			alert("적립금을 입력하세요");
			document.writeform.prod_point.focus();
			return false;
		}
		if (document.writeform.prod_amount.value == "") {
			alert("수량을 입력하세요");
			document.writeform.prod_amount.focus();
			return false;
		}

	};

	/*업로드 취소*/	
	function removeFile() {
		document.writeform.prod_thumb.select();
		document.writeform.prod_thumb.value = "";
	};

	$(document).ready(function() {
			/*할인가,적립금 계산*/
			$(document).ready(function(){
				$("#prod_price_sale").click(function(){
					var discount = (100-$("#prod_discount_rate").val())/100;
					var salePrice = $("#prod_price").val() * discount;
					$("#prod_price_sale").val(salePrice);
				});
				$("#prod_point").click(function(){
					var pointRate = $("#prod_point_rate").val()/100;
					var point = $("#prod_price").val() * pointRate;
					$("#prod_point").val(point); 
				});
			});

			/*파일업로드 추가*/
			$("#addItemBtn").click(function() {
				$("tr:last").show();
				var lastImgNo = $("tr:last").children().children().attr("name").replace("image", "");
				var newImage = $("tr:last").clone();
					
				newImage.children().children().attr("name","image" + (parseInt(lastImgNo) + 1));

				if (lastImgNo == 10) {
					alert("10개 이상의 파일은 추가 하실 수 없습니다.");
				} else {
					$("#example").append(newImage);
				}
			});
			/*파일업로드 삭제*/	
			$("#deleteItemBtn").click(function() {
				if ($("#example tr").length == 2) {
					return;
				}
				$("#example tr:last").remove();
			});			
		});
