<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.example.*" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="javax.servlet.http.*" %>
    <%@page import="java.io.File"%>
    <%@page import="java.io.InputStreamReader"%>
    
<!DOCTYPE html>
<%
	String currentUser = (String)(session.getAttribute("currentUser"));
	String cNameError = (String)request.getAttribute("cNameError");
	String LocError = (String)request.getAttribute("LocError");
	if (cNameError == null)
	{
		cNameError ="";
	}
	if (LocError == null)
	{
		LocError ="";
	}

%>

<html>
<head>
<script src="search.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB7H1I5HUNcYtQSWopeEkIZrN_0w2dO9GI&callback=initMap"
        async defer></script>
<meta charset="UTF-8">
<title>Insert title here</title>
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
 	#imgbox1{
 		width: 300px;
 		height: 250px;
 		margin:0 auto;
 		
 	}
 	#wrap{
 		margin-left:auto;
 		margin-right:auto;
 		margin-top:15%;
 	}
 	#imgbox1 img{
		width:300px;
		height:250px;
 	}
	#formBody{
		text-align:center;
		margin:0 auto;
	}
	#location
	{
	
	}
	#b1
	{
		position:relative;
		top:5px;
		right:6px;
	}
	#b2
	{
		position:relative;
		top:5px;
		right:7px;
	}
	#b3{
		position:relative;
		top:5px;
	}
	#in{
	
		width:150px;
		height:25px;
		opacity: 0.6;
		margin:0px;
	}
	.decimg{
		opacity: 1;
		width: 23px;
		height:23px;
	}
	
	#but01{
	margin-top: 10px;
	display: inline-block;
	padding: 7px 25px;
	color: #FFF;
	border: 1px solid #FFF;
	text-decoration: none;
	font-size: 14px;
	line-height: 120%;
	background-color: rgba(128,128,128,0.5);
	border-radius:4px;
	-webkit-border-radius: 4px;
	
	  
	  }

	
 </style>
</head>
<body>
<div class="top-bar"><a style="font-family: Savoye; margin: 0px; position: relative; bottom:11px;" href="index.jsp">WeatherMeister</a>
<% if (currentUser == null) {%>
	<div class="login"><a href="login.jsp">login</a></div>
	<div class="register"><a href="register.jsp">register</a></div>
<% }else{%>
	<div class="register"><a href="HandleSignout.jsp">Sign Out</a></div>
	<div class="register"><a href="getHistory.jsp">View Profile</a></div>
<%}%>
	<div class="clear"></div>
</div>

<div id="map"></div>
		<br/>
		<script>
	    $(document).ready(function(){
			$('.location').hide();
			$('#Cname_').click(function(){
			//	console.log(1);
				$('.cityName').show();
				$('.location').hide();
			})
			
			$('#location_').click(function(){
			//	console.log(1);
				$('.location').show();
				$('.cityName').hide();
			})
			
	   		
	    })
		</script>
		<div id="wrap">
		<div id="imgbox1">
			<img src="Assets/logo.png">
		</div>

		<div id="formBody">
		
		
		<div class="cityName">
			
			<div id="cityName">
					<input type="text" name="cityName" value="" placeholder="Los Angeles" class="in">
					<button id="b1" onclick="processName()"><img class="decimg" src="Assets/va.png"></button>
				
				
			</div>
			
		</div>
		
		<div class="location">

			<div id="location">
				<input type="text" name="Latitude" value="1" placeholder="latitude" class="in">
				<input type="text" name="Longitude" value="2" placeholder="longitude" class="in" />
				<button value="Validate Me" id="b2" onclick="processLoc()"><img class="decimg" src="Assets/va.png"></button>
				<button onclick="getMap()" id="b3"><img class="decimg" src="Assets/map.png"></button>		
			</div>
			
		</div>
		
		
			<input id="Cname_" type="radio" name="choice" value="n" checked/><span class="option">City</span>
			<input id="location_" type="radio" name="choice" value="l"/><span class="option">Location(Lat./Long.)</span>
	
			<h4><%=cNameError %></h4>
			<h4><%= LocError %></h4>
		</div>
		</div>

	
	
</body>
</html>