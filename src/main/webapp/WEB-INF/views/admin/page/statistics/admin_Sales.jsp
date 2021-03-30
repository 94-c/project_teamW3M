<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/page/include/admin_header.jsp"%>

<title>매출통계</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Month', '월 매출 '],
          ['1월', 3231],
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
           <div id="chart1" style="width: auto; height: 600px;"></div>
			</div>
		</div><!-- body end -->
</div> <!-- Main end -->
<%@include file="/WEB-INF/views/admin/page/include/admin_footer.jsp"%>


