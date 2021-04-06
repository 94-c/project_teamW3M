<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/page/include/admin_header.jsp"%>

<title>상품통계</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
		var data1_1 = $("#user_gender1").val();
		var data1_2 = parseInt($("#total_sum1").val());
		var data2_1 = $("#user_gender2").val();
		var data2_2 = parseInt($("#total_sum2").val());
		console.log(data1_1 + data1_2 );
		console.log(data2_1 + data2_2 );
       
		var data = new google.visualization.DataTable();
		
		data.addColumn('string','성별');
		data.addColumn('number','수치');
        
		data.addRows([
        	[String(data1_1),data1_2],
        	[String(data2_1),data2_2],

			]);

        var options = {
          title: '성별에 따른 매출현황'
        };

        var chart = new google.visualization.PieChart(document.getElementById('product_chart'));

        chart.draw(data, options);
      }
    </script>
<div class="container-fluid">
		<h1 class="mt-4">상품 통계</h1>
		<ol class="breadcrumb mb-4">
		
			<li>
			<input type="button" value="성별에 따른 매출현황" id="gender" onclick="drawChart();">
			
			</li>
		</ol>
		<c:forEach var="Gender_Money" items="${Gender_Money}" varStatus="state">
			<input type="hidden" value="${Gender_Money.user_gender}" id="user_gender${state.count}"  >
			<input type="hidden" value="${Gender_Money.user_count}" id="user_count${state.count}"  >
			<input type="hidden" value="${Gender_Money.total_sum}" id="total_sum${state.count}"  >
			<input type="hidden" value="${state.count}" id="count"  >
		</c:forEach>
		<div class="card mb-4">
           <div class="card-header">
                                        통계
             </div>
          <div class="card-body">
         	 <div id="product_chart" style="width: auto; height: 500px;"></div>
		</div>
		</div><!-- body end -->
</div> <!-- Main end -->
<%@include file="/WEB-INF/views/admin/page/include/admin_footer.jsp"%>


