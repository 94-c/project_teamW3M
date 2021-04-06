<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/page/include/admin_header.jsp"%>

<title>매출통계</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script type="text/javascript">
	var date1 = new Date();
	var date2 = new Date();
	var date3 = new Date(date1.setMonth(date1.getMonth()-1));
	console.log(date1);
	$(document).ready(function(){
		
		$("#datepicker1").val(getFormatDate(date3));
		$("#datepicker2").val(getFormatDate(date2));
		
	});
	
	function getFormatDate(date){
	    var year = date.getFullYear();              //yyyy
	    var month = (1 + date.getMonth());          //M
	    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
	    var day = date.getDate();                   //d
	    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
	    return  year + '-' + month + '-' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
	}

$(document).ready(function(){
		$("#Seach").click(function(){
			console.log("들어옴");
			var start =$("#datepicker1").val();
			var end = $("#datepicker2").val();
			console.log($("#datepicker1").val());
			console.log($("#datepicker2").val());
			var alldata={
					StartDate : start,
					EndDate : end
			};
			$.ajax({
				async : true,
				url : "/seach.do",
				type:"POST",
				data: JSON.stringify(alldata),
				dataType:"json",
				contentType:"application/json; charset=UTF-8",
				success:function(aa){
					alert(aa+ "갔다옴");
				
				}
			});
		});
		
	});
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Month', '월 매출 '],
          ['1월', 12312],
          ['2월', 1170],
          ['3월', 6600],
          ['4월', 12314],
          ['5월', 87687],
          ['6월', 1030],
          ['7월', 1030],
          ['8월', 1030],
          ['9월', 1030],
          ['10월', 1030],
          ['11월', 1030],
          ['12월', 1030]
        ]);

        var options = {
          chart: {
            title: '월 매출 현황',
          }
        };

        var chart = new google.charts.Bar(document.getElementById('chart1'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
</script>
<script>
    $.datepicker.setDefaults({
        dateFormat: 'yymmdd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년'
    });

    $(function() {
        $("#datepicker1, #datepicker2").datepicker({
            dateFormat: 'yy-mm-dd'
        });
    });
   
</script>
<div class="container-fluid">
		<h1 class="mt-4">매출 통계</h1>
		<ol class="breadcrumb mb-4">
			<li></li>
		</ol>
		
		<div class="card mb-4">
           <div class="card-header">
                                        매출 통계
             </div>
          <div class="card-body">
          	
          	<div class="date">
          	<Strong>기간 설정</Strong>&nbsp;&nbsp;
          		<input type="text" id="datepicker1" value="" >
          	<Strong>-</Strong>
          		<input type="text" id="datepicker2" value="">
			</div>
			<br>
			<div class="product" >
	<!-- 		<Strong>카테 고리</Strong>&nbsp;&nbsp;
			<select name="product_1" id="product_1">
				<option value="2017">2017</option>
				<option value="2018">2018</option>
				<option value="2019">2019</option>
			</select>
			<select name="product_2" id="product_2">
				<option value="2017">2017</option>
				<option value="2018">2018</option>
				<option value="2019">2019</option>
			</select>
			<select name="product_3" id="product_3">
				<option value="2017">2017</option>
				<option value="2018">2018</option>
				<option value="2019">2019</option>
			</select>
			 -->
			<input type="button" class="" value="조회" id = "Seach">
			</div>		 
			
		   <br>
		   <br>
           <div id="chart1" style="width: auto; height: 600px;"></div>
			</div>
		</div><!-- body end -->
</div> <!-- Main end -->
<%@include file="/WEB-INF/views/admin/page/include/admin_footer.jsp"%>


