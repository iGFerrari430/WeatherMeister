function processName(){
	    	$.ajaxSetup({
	    	    async: false
	    	});
           	var cityName = document.getElementsByName("cityName")[0].value.trim();
           	var search = cityName;
        	var cityList = [];
            $.getJSON('city.list.json', function(data) {

 				console.log(1);
  				for (var i=0; i<data.length; i++)
  				{
  					if (data[i].name.toUpperCase() == cityName.toUpperCase())
  					{
  						console.log(i);
  						cityList.push(data[i].id);
  					}
  				}
  				
  	 			var resultList = [];
				var bound = cityList.length;
				var index = 0;
				console.log("bound is:"+bound);
				while (index < bound) {
 	  					var call = "http://api.openweathermap.org/data/2.5/group?id=";
						var remain = 20;
						while(index < bound && remain != 0)
						{
							remain--;
							call += cityList[index];
							index++;
							if (!(remain == 0 || index == bound))
							{
								call += ",";
							}
						}
	 	  				call += "&APPID=";
	 	  				call += "65b4d360dbe666bf7718ee48e12731f8";
	 	  				
	 	  				$.getJSON(call, function(temp) {
	 	  					var resArray = temp.list;
	 	  					for (var i=0; i<resArray.length; i++)
	 	  					{
	 	  						resultList.push(resArray[i]);
	 	  					}
	 	  				});
	 	  				
	 	  				console.log(call);
					}
 	  			
 	  			for (var i=0; i<resultList.length; i++)
 	  			{
 	  				console.log(resultList[i]);
 	  			}
 	  			
 	  			$.ajax({
 	  			    type: 'post',
 	  			    url: 'parseJSON',
 	  			    dataType: 'text',
 	  			    data: { 
 	  			      history: search,
 	  			      loadProds: 1,
 	  			      info: JSON.stringify(resultList) // look here!
 	  			    },
 	  			    success: function(data) {
 	  			    	if (resultList.length > 1)
 	  			    	{
 	  			    		window.location.href = 'weather2.jsp';
 	  			    	}
 	  			    	else if (resultList.length == 1)
 	  			    	{
 	  			    		window.location.href = "weather1.jsp";
 	  			    	}
 	  			    	else
 	  			    	{
 	  			    		alert("city name cannot be found :(");
 	  			    	}
 	  			    },
 	  			    error: function(data) {
 	  			        alert("ve...");
 	  			    }
 	  			});
  				
  				
             });
	    }
	    function processLoc(){
	    	
	    	$.ajaxSetup({
	    	    async: false
	    	});
	    	var lati = document.getElementsByName("Latitude")[0].value;
	    	var long = document.getElementsByName("Longitude")[0].value;
	    	var search = "(";
	    	search += lati;
	    	search +=" , ";
	    	search += long;
	    	search += ")";
	    	console.log("lati:"+lati);
	    	console.log("long:"+long);
	    	var cityList = [];
	    	
            $.getJSON('city.list.json', function(data) {
					for (var i=0; i<data.length; i++)
					{
						var info = data[i];
						var check1 = (Math.abs(lati-info.coord.lat)<= 0.03);
						var check2 = (Math.abs(long-info.coord.lon)<= 0.03);
						if (i == 0)
						{
							console.log("Actual lat value:"+info.coord.lat);
							console.log("Actual lon value:"+info.coord.lon)
							console.log(Math.abs(lati-info.coord.lat));
							console.log(Math.abs(long-info.coord.lon));
						}
						if (check1 && check2)
						{
							cityList.push(info.id);
						}
					}
					var resultList = [];
					var bound = cityList.length;
					var index = 0;
					console.log("bound is:"+bound);
					while (index < bound) {
	 	  					var call = "http://api.openweathermap.org/data/2.5/group?id=";
							var remain = 20;
							while(index < bound && remain != 0)
							{
								remain--;
								call += cityList[index];
								index++;
								if (!(remain == 0 || index == bound))
								{
									call += ",";
								}
							}
		 	  				call += "&APPID=";
		 	  				call += "65b4d360dbe666bf7718ee48e12731f8";
		 	  				
		 	  				$.getJSON(call, function(temp) {
		 	  					var resArray = temp.list;
		 	  					for (var i=0; i<resArray.length; i++)
		 	  					{
		 	  						resultList.push(resArray[i]);
		 	  					}
		 	  				});
		 	  				
		 	  				console.log(call);
						}
	 	  			$.ajax({
	 	  			    type: 'post',
	 	  			    url: 'parseJSON',
	 	  			    dataType: 'text',
	 	  			    data: { 
	 	  			      history: search,
	 	  			      loadProds: 1,
	 	  			      info: JSON.stringify(resultList) // look here!
	 	  			    },
	 	  			    success: function(data) {
	 	  			    	if (resultList.length > 1)
	 	  			    	{
	 	  			    		window.location.href = 'weather2.jsp';
	 	  			    	}
	 	  			    	else if (resultList.length == 1)
	 	  			    	{
	 	  			    		window.location.href = "weather1.jsp";
	 	  			    	}
	 	  			    	else
	 	  			    	{
	 	  			    		alert("location cannot be found :(");
	 	  			    	}
	 	  			    },
	 	  			    error: function(data) {
	 	  			        alert("ve...");
	 	  			    }
	 	  			});	
             });
	    	
	    }
	    function getMap(){
	    	console.log("vee..");
	    	 var a = document.getElementById('map');
             a.style.display = "block";
             var x = document.getElementsByTagName("body")[0];
             x.style.backgroundColor = "rgba(0, 0, 0,0.5)";
	    }
        function initMap() {                            
            var latitude = 34.02235998929801; // YOUR LATITUDE VALUE
            var longitude = -118.28511714935303; // YOUR LONGITUDE VALUE
            
            var myLatLng = {lat: latitude, lng: longitude};
            
            map = new google.maps.Map(document.getElementById("map"), {
              center: myLatLng,
              zoom: 14,
              disableDoubleClickZoom: true, // disable the default map zoom on double click
            });
            
            // Update lat/long value of div when anywhere in the map is clicked    
            google.maps.event.addListener(map,'click',function(event) {                
                document.getElementsByName("Latitude")[0].value = Math.round(event.latLng.lat() * 100) / 100;
                document.getElementsByName("Longitude")[0].value = Math.round(event.latLng.lng() * 100) / 100;
                var a = document.getElementById("map");
                a.style.display = "none";
                 var x = document.getElementsByTagName("body")[0];
                 x.style.backgroundColor = "rgba(0, 0, 0,0)";
            });
        }