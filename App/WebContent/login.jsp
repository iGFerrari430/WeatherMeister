<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#wrapper{
		background-color:rgba(128,128,128,0.8);
		margin-top:12%;
		margin-bottom:auto;
		margin-left:auto;
		margin-right:auto;
		overflow: scroll;
		width: 40%;
		height: 48%;
		border-radius:15px;
		text-align:left;
	}
	img{
		width:200px;
		height:200px;
	}
	#imgbox{
		width:200px;
		height:200px;
		position:relative;
		bottom: 58%;
		left: 44%;
	}
	input[type=text],input[type=password]{
	  width: 85%;
	  padding-top:8px;
	  padding-bottom:8px;
	  display: inline-block;
	  border: 1px solid #ccc;
	  box-sizing: border-box;
	}
	#nestedWrapper{
		margin-top:16%;
		margin-left:10%;
	}
	#wrapper p{
		margin-top:5px;
		margin-bottom:2px;
		margin-left: 0px;
		font-size: 25px;
	}
	h4{
		margin:1px;
	}
	#but{
		margin-left: 35%;
		margin-top:10%;
	}
	button[type=submit] {
	border:1px solid rgba(128,128,128,0.0);
	  font-size: 20px;
	  border-radius: 50px;
	  width: 100px;
	  height:50px;
	  background-color: green;
	  color: white;
	  cursor: pointer;
	}
</style>
</head>
<%
	String currentUser = (String)session.getAttribute("currentUser");
	String error = (String)request.getAttribute("error");
	if (error == null)
	{
		error ="";
	}
%>

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
<div id="wrapper">
<div id="nestedWrapper">
	<form action="loginserver" method="POST">
		<p>Username:</p>
		<input type="text" name="username" value="Lisa"> <br/>
		<p>Password:</p>
		<input type="password" name="password"> <br/>
		<h4><%=error %></h4>
		<button id="but" type="submit" value="Submit" >login</button>
	</form>
</div>
</div>
<div id="imgbox"><img src="Assets/new.png" /></div>
</body>
</html>