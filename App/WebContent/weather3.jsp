<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@ page import="java.util.ArrayList" %>
      <%@ page import="com.example.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>City Detail</title>
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
	#b3{
		position:relative;
		top:5px;
	}
	#temp
	{
		margin-top:10px;
		font-size:54px;
		margin-left:15px;
	}
	#temp span{
		position:relative;
		left:6px;
	}
	p{
		padding:0px;
		margin:0px;
		font-size:30px;
	}
	
	.des{
		width:200px;
		height:70px;
		text-align:center;
		margin:auto auto;
	}
	
	.c1{
		width:200px;
		height:200px;
		
		text-align:center;
		overflow: scroll;
		flex-shrink: 0;
	}
	.c1 p{
		position:relative;
		top:80px;
	}
	.c2{
		width:200px;
		height:200px;
		margin-left:auto;
		margin-right:auto;
		margin-top:auto;
		margin-bottom:auto;
		flex-shrink: 0;
	}
	.c2 img{
		margin-left:30px;
		margin-top:30px;
		width: 140px;
		height: 140px;
	}
	td{
		width: 200px;
		height:270px;
		overflow: scroll;
	}
	table, th, td{
	
		border-collapse:collapse;
		overflow: scroll;
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
	#c
	{
		padding-top:40px;
		margin-left:20%;
	}
	.in3{
		border:1px solid white;
		width:150px;
		height:25px;
		background-color: white;
		margin:0px;
		padding:0px;
		color: black;
		
	}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="search.js"></script>
 <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB7H1I5HUNcYtQSWopeEkIZrN_0w2dO9GI&callback=initMap"
        async defer></script>
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
	    $(document).ready(function(){
			$('.c1').hide();
			$('.c1').click(function(){
				 $(this).siblings('.c2').show();
				 $(this).hide();
				
			})
			
			$('.c2').click(function(){
				 $(this).siblings('.c1').toggle();
				 $(this).hide();
				
				 
			})
			
	   		
	    })
		</script>
</head>

<%
	util u = new util();
	String cityName = (String)session.getAttribute("cdx");
	int choice = Integer.parseInt(cityName);
	ArrayList<Example> data = (ArrayList<Example>)session.getAttribute("data");
	int cityIndex = -1;
	for (int i=0; i<data.size(); i++)
	{
		if (data.get(i).id == choice)
		{
			cityIndex = i;
			break;
		}
	}
	
	Example w = data.get(cityIndex);
	double tempM = u.toF(w.main.tempMin);
	double tempH = u.toF(w.main.tempMax);
	double currTemp = u.toF(w.main.temp);
	String sunR = u.toTime(w.sys.sunrise);
	String sunS = u.toTime(w.sys.sunset);
	
	
%>
<body>
<div id="map"></div>
			<div class="top-bar">
		
		<div class="top1">
		<a style="font-family: Savoye; margin: 0px; position: relative; bottom:11px;" href="index.jsp">WeatherMeister</a>
		</div>
		

		
		<div class="top2">
		<div class="cityName">
			
			<div id="cityName">
					<input type="text" name="cityName" value="" placeholder="Los Angeles" class="in3"/>
					<button value="Submit" value="Validate Me" onclick="processName()"id="b11"><img class="decimg" src="Assets/va.png"></button>
				
				
			</div>
			
		</div>
		
		<div class="location">
			
			
			<div id="location">
				<input type="text" name="Latitude" value="" placeholder="Latitude" class="in3"/>
				<input type="text" name="Longitude" value="" placeholder="longitude" class="in3"/>
				<button value="Submit" onclick="processLoc()" value="Validate Me" id="b12"><img class="decimg" src="Assets/va.png"></button>
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
		
		<div id="temp"><span><%=data.get(cityIndex).name %></span></div>
		<div id="wrapper">
		<div id="c">
		<table>
			<tr>
				<td>
					<div class="c1">
					<p><%= w.sys.country%></p>
					</div>
					
					<div class="c2">
						<img src="Assets/LocationIcon.png">
					</div>
					
					
					<div class="des">
						<p>Location</p>
					</div>
					
				</td>
				
				<td>
					<div class="c1">
					<p><%= tempM %>°F</p>
					</div>
					
					<div class="c2">
						<img src="Assets/snowflake.png">
					</div>
					
					<div class="des">
						<p>Temp Low</p>
					</div>
					
				</td>
				
				<td><div class="c1">
					<p><%= tempH %>°F</p>
					</div>
					
					<div class="c2">
						<img src="Assets/sun.png">
					</div>
					
					<div class="des">
						<p>Temp High</p>
					</div>
				</td>
					
				<td>
				
					<div class="c1">
					<p><%=w.wind.speed %> miles/h</p>
					</div>
					
					<div class="c2">
						<img src="Assets/wind.png">
					</div>
					
					<div class="des">
						<p>Wind</p>
					</div>
				</td>
			</tr>
			
			<tr>
				<td>
				
					<div class="c1">
					<p><%=w.main.humidity %>%</p>
					</div>
					
					<div class="c2">
						<img src="Assets/drop.png">
					</div>
					
					<div class="des">
						<p>Humidity</p>
					</div>
				</td>
				
				<td>
					<div class="c1">
					<p><%=w.coord.lat %></p>
					<p><%=w.coord.lon%></p>
					</div>
					
					<div class="c2">
						<img src="Assets/LocationIcon.png">
					</div>
					
					<div class="des">
						<p>Coornidates</p>
					</div>
				</td>
				
				<td>
					<div class="c1">
					<p><%=currTemp %>°F</p>
					</div>
					
					<div class="c2">
						<img src="Assets/thermometer.png">
					</div>
					
					<div class="des">
						<p>Current Temp</p>
					</div>
				</td>
				
				<td>
					<div class="c1">
					<p><%=sunR %></p>
					<p><%=sunS %></p>
					</div>
					
					<div class="c2">
						<img src="Assets/sunrise-icon.png">
					</div>
					
					<div class="des">
						<p>Sunrise/Set</p>
					</div>
				</td>
					
					
			</tr>
				
		</table>
		</div>
		</div>
</body>
</html>