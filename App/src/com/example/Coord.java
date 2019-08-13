package com.example;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Coord {

@SerializedName("lon")
@Expose
public double lon;
@SerializedName("lat")
@Expose
public double lat;

/**
* No args constructor for use in serialization
* 
*/
public Coord() {
}

/**
* 
* @param lon
* @param lat
*/
public Coord(double lon, double lat) {
super();
this.lon = lon;
this.lat = lat;
}

}
