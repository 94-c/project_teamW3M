<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/page/include/admin_header.jsp"%>

<title>상품통계</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart1);

    function drawChart1() {
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
        title: '성별에 따른 매출현황',
      	  is3D: true,
      	  width: 700,
            height: 500
      };

      var chart = new google.visualization.PieChart(document.getElementById('product_chart_gender'));

      chart.draw(data, options);
    }
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart2);

    function drawChart2() {
     
		var data = new google.visualization.DataTable();
		
		data.addColumn('string','회원 등급');
		data.addColumn('number','회원 수');
      
		data.addRows([
			<c:forEach var="salesByLevel" items="${salesByLevel}" varStatus="state">
	        ['${salesByLevel.user_level}',${salesByLevel.join_count} ],
		  	</c:forEach>
			]);

      var options = {
        title: '회원 등급 분포',
      	  is3D: true,
      	  width: 700,
          height: 500,
          slices: {
              0: { color: 'brown' },
              1: { color: 'gray' },
              2: { color: 'aqua'},
              3: { color: 'yellow'},
              4: { color: 'Lightgrey'}
            }
      };

      var chart = new google.visualization.PieChart(document.getElementById('product_chart_level'));

      chart.draw(data, options);
    }
      
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart4);

      function drawChart4() {

       
		var data = new google.visualization.DataTable();
		
		data.addColumn('string','제품 이름');
		data.addColumn('number','매출');
        
		data.addRows([
			<c:forEach var="salesByTOP" items="${salesByTOP}" varStatus="state">
	        ['${salesByTOP.prod_title}',${salesByTOP.total_sum} ],
		  	</c:forEach>

			]);

        var options = {
          title: '제품 별 판매 순 상위 5개',
        	  is3D: true,
        	  width: 700,
              height: 500
        };

        var chart = new google.visualization.BarChart(document.getElementById('product_chart_top5'));

        chart.draw(data, options);
      }
      
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart3);

      function drawChart3() {
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
			<c:forEach var="salesByBOTTOM" items="${salesByBOTTOM}" varStatus="state">
	        ['${salesByBOTTOM.prod_title}',${salesByBOTTOM.total_sum} ],
		  	</c:forEach>

			]);

        var options = {
          title: '제품 별 판매 순 하위 5개',
        	  is3D: true,
        	  width: 700,
              height: 500
        };

        var chart = new google.visualization.BarChart(document.getElementById('product_chart_bottom5'));

        chart.draw(data, options);
      }
    </script>
<div class="container-fluid">
		<h1 class="mt-4">상품 통계</h1>
		<ol class="breadcrumb mb-4">
		
	
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
         	 <div id="product_chart_gender" style="width: auto; height: 500px; display:inline-block;"></div>
         	 <div id="product_chart_level" style="width: auto; height: 500px; display: inline-block;"></div>
         	 <div id="product_chart_top5" style="width: auto; height: 500px; display: inline-block;"></div>
         	 <div id="product_chart_bottom5" style="width: auto; height: 500px; display: inline-block;"></div>
         	 
		</div>
		</div><!-- body end -->
</div> <!-- Main end -->
<%@include file="/WEB-INF/views/admin/page/include/admin_footer.jsp"%>


