<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/page/include/admin_header.jsp"%>

<title>상품통계</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['Work',     11],
          ['Eat',      2],
          ['Commute',  2],
          ['Watch TV', 2],
          ['Sleep',    7]
        ]);

        var options = {
          title: 'My Daily Activities'
        };

        var chart = new google.visualization.PieChart(document.getElementById('product_chart'));

        chart.draw(data, options);
      }
    </script>
<div class="container-fluid">
		<h1 class="mt-4">상품 통계</h1>
		<ol class="breadcrumb mb-4">
			<li></li>
		</ol>
		
		<div class="card mb-4">
           <div class="card-header">
                                        상품 통계
             </div>
          <div class="card-body">
         	 <div id="product_chart" style="width: auto; height: 500px;"></div>
		</div>
		</div><!-- body end -->
</div> <!-- Main end -->
<%@include file="/WEB-INF/views/admin/page/include/admin_footer.jsp"%>


