
package com.example;

import java.util.List;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Example {

@SerializedName("coord")
@Expose
public Coord coord;
@SerializedName("sys")
@Expose
public Sys sys;
@SerializedName("weather")
@Expose
public List<Weather> weather = null;
@SerializedName("main")
@Expose
public Main main;
@SerializedName("wind")
@Expose
public Wind wind;
@SerializedName("rain")
@Expose
public Rain rain;
@SerializedName("clouds")
@Expose
public Clouds clouds;
@SerializedName("dt")
@Expose
public Integer dt;
@SerializedName("id")
@Expose
public Integer id;
@SerializedName("name")
@Expose
public String name;
@SerializedName("cod")
@Expose
public Integer cod;

/**
* No args constructor for use in serialization
* 
*/
public Example() {
}

/**
* 
* @param id
* @param dt
* @param clouds
* @param coord
* @param wind
* @param cod
* @param sys
* @param name
* @param weather
* @param rain
* @param main
*/
public Example(Coord coord, Sys sys, List<Weather> weather, Main main, Wind wind, Rain rain, Clouds clouds, Integer dt, Integer id, String name, Integer cod) {
super();
this.coord = coord;
this.sys = sys;
this.weather = weather;
this.main = main;
this.wind = wind;
this.rain = rain;
this.clouds = clouds;
this.dt = dt;
this.id = id;
this.name = name;
this.cod = cod;
}

}