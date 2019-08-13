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
	#b3{
		position:relative;
		top:5px;
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
input[type=text]{
	background-color:white;
}



</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="search.js"></script>
 <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB7H1I5HUNcYtQSWopeEkIZrN_0w2dO9GI&callback=initMap"
        async defer></script>
</head>
	<%
		util u = new util();
		ArrayList<Example> data = (ArrayList<Example>)session.getAttribute("data");
		int index = 0;
		String displayName = data.get(index).name;
		displayName +=" ";
		displayName += data.get(index).sys.country;
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
	    
	    
		</script>
		
		<script>
		function changeSort(){
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function(){
				document.getElementById("cities").innerHTML = this.responseText;
				
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
				<input type="text" name="Longitude" value="" placeholder="Longitude" class="in2"/>
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

		<h2><%= displayName %></h2>
		
		<div class="tableBox">
		<%
			out.println("<table>");
			for (int i=0; i<16; i++)
			{
				if (i == 0)
				{
					out.println("<tr>");
					out.println("<th>cityName</th>");
					out.println("<th>Temp.low</th>");
					out.println("<th>Temp.high</th>");
					out.println("</tr>");
					//out.println("</table>");
					//out.println("<table>");
				}
				else if (i == 1)
				{
					out.println("<tr>");
					out.println("<td><button class='DIANG' id='"+Integer.toString(data.get(index).id)+"' onclick='loadCity(this.id)' name='city' type='submit' value='"+data.get(index).name+"'>"+displayName+"</button></td>");
					out.println("<td>"+u.toF(data.get(index).main.tempMin)+"</td>");
					out.println("<td>"+u.toF(data.get(index).main.tempMax)+"</td>");
					out.println("</tr>");
				}
				else
				{
					out.println("<tr>");
					out.println("<td></td>");
					out.println("<td></td>");
					out.println("<td></td>");
					out.println("</tr>");
				}
				
			}
			out.println("</table>");
		%>
		
		
		</div>
		
		</div>
		
</body>
</html>