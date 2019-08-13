<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.util.ArrayList" %>
      <%@ page import="com.example.*" %>
<!DOCTYPE html>
<html>
<head>
	 <link rel="stylesheet" type="text/css" href="style.css" />
	<style>
	 #map{
	    position:absolute;
        height: 80%;    
        width: 80%; 
        top: 10%;
        left: 10%;
        z-index: 2;
        display: none;         
          
}
select#xyz {
   border:0px;
   outline:0px;
}
	#b3{
		position:relative;
		top:5px;
	}
	h2{
		font-weight:normal;
	}
	
	table {
	  border-collapse: collapse;
	}
	td,th{
		width:270px;
		height:30px;
		border-bottom: 1px solid white;
		text-align:center;
	}
	#diang{
		position:relative;
		left:25px;
		font-size:20px;
	}
	#cities{
		width: 60%;
		float: left;
		text-align:center;
	}
	#drowdown{
		float: left;
		text-align:center;
		margin-left:10%;
	}
	select{
		text-align:center;
	}
	option{
		text-align:center;
	}
	#b11{
	position:relative;
	top:5px;
	right:9px;
	}
	#b12{
	position:relative;
	top:5px;
	right:9px;
	}
	#outercontainer{
		width: 100%;
	}
	input[type=text]{
	background-color:white;
	}
	.clear{
		clear: both;
	}
	#tB
	{
		border-radius:10px;
		border:1px solid white;
		margin-right: 100px;
		background-color:rgba(128,128,128,0.8);
		overflow-y:scroll;
		width:810px;
		height:380px;
		float:left;
	}
	
	</style>
	<meta charset="UTF-8">
	<title>ve</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<script src="search.js"></script>
	 <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB7H1I5HUNcYtQSWopeEkIZrN_0w2dO9GI&callback=initMap"
        async defer></script>

</head>
	<%
		util u = new util();
		session = request.getSession();
		ArrayList<Example> data = (ArrayList<Example>)session.getAttribute("data");
		ArrayList<ArrayList<Example>> sortedData = (ArrayList<ArrayList<Example>>)session.getAttribute("sortedData");
		//int index = Integer.parseInt((String)session.getAttribute("cName"));
	%>

		
		
<body>
<div id="map"></div>
	<script>
	    $(document).ready(function(){
	    	
			$('.location').hide();
			$('#Cname_').click(function(){
				$('.cityName').show();
				$('.location').hide();
			})
			
			$('#location_').click(function(){
				$('.location').show();
				$('.cityName').hide();
			})
			
	   		
	    })
	    
	    $(document).ready(function(){
	    	$('select').selectpicker();
	    
	    })
	</script>
	
	<script>
		function changeSort(){
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function(){
				document.getElementById("tB").innerHTML = this.responseText;
				
			}
			xhttp.open("POST","validation3?choice="+document.myform.dropmenu.value,true);
			console.log(document.myform.dropmenu.value);
			xhttp.send();
	
		}
		
		function loadCity(ve)
		{
			console.log(ve);
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function(){
				window.location.href = 'weather3.jsp';
			}

			xhttp.open("GET","validation4?choice="+ve,true);
			xhttp.send();
		}
	</script>

		<div class="top-bar">
		
		<div class="top1">
		<a style="font-family: Savoye; margin: 0px; position: relative; bottom:11px;" href="index.jsp">WeatherMeister</a>
		</div>
		

		
		<div class="top2">
		<div class="cityName">
			
			<div id="cityName">
					<input type="text" name="cityName" value="" placeholder="Los Angeles" class="in2"/>
					<button value="Submit" value="Validate Me" onclick="processName()" id="b11"><img class="decimg" src="Assets/va.png"></button>
				
				
			</div>
			
		</div>
		
		<div class="location">
			
			
			<div id="location">
				<input type="text" name="Latitude" value="" placeholder="Latitude" class="in2"/>
				<input type="text" name="Longitude" value="" placeholder="longitude" class="in2"/>
				<button value="Submit" value="Validate Me" onclick="processLoc()" id="b12"><img class="decimg" src="Assets/va.png"></button>
				<button onclick="getMap()" id="b3"><img class="decimg" src="Assets/map.png"></button>
				
			</div>
			
		</div>
		</div>
		
		<div class="top3">
		
			<input id="Cname_" type="radio" name="choice" value="n" checked/><span class="option">City</span>
			<input id="location_" type="radio" name="choice" value="l"/><span class="option">Location(Lat./Long.)</span>
	
		</div>
		
		
		
		<div class="clear"></div>
		</div>

		<div class="marg">

		<h2>All Cities</h2>
		
		<div id="tB">
		<% 
		out.println("<table>");
		out.println("<tr>");
		out.println("<th>City Name</th>");
		out.println("<th>Temp.low</th>");
		out.println("<th>Temp.High</th>");
		out.println("</tr>");
		ArrayList<Example> temp1 = sortedData.get(0);
		for (int i=0; i<temp1.size(); i++)
		{
			String displayName = temp1.get(i).name;
			displayName +=" ";
			displayName +=temp1.get(i).sys.country;
			out.println("<tr>");
			out.println("<td><button class='DIANG' id='"+Integer.toString(temp1.get(i).id)+"' onclick='loadCity(this.id)' name='city' type='submit' value='"+temp1.get(i).name+"'>"+displayName+"</button></td>");
			out.println("<td>"+u.toF(temp1.get(i).main.tempMin)+"</td>");
			out.println("<td>"+u.toF(temp1.get(i).main.tempMax)+"</td>");
			out.println("</tr>");
			
		}
		int left = 16 - (int)temp1.size();
		for (int i=0; i<left; i++)
		{
			out.println("<tr>");
			out.println("<td></td>");
			out.println("<td></td>");
			out.println("<td></td>");
			out.println("</tr>");
		}
		out.println("</table>");
		%>
		</div>
		
		
		<div id="dropdown">
		<div id="diang">Sort by</div>
		<form action="SubmitServlet" method="post" name="myform">
			<select id ="va" name="dropmenu" onchange="changeSort()" class="selectpicker">
				<option value="v0">City Name A-Z</option>
				<option value="v1">City Name Z-A</option>
				<option value="v2">Temp.Low ASC</option>
				<option value="v3">Temp.Low DESC</option>
				<option value="v4">Temp.High ASC</option>
				<option value="v5">Temp.High DESC</option>
			
			</select>
		</form>
		</div>
		
		<div id="clear"></div>
		
		</div>
</body>
</html>