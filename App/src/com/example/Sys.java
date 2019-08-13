
package com.example;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Sys {

@SerializedName("country")
@Expose
public String country;
@SerializedName("sunrise")
@Expose
public Integer sunrise;
@SerializedName("sunset")
@Expose
public Integer sunset;

/**
* No args constructor for use in serialization
* 
*/
public Sys() {
}

/**
* 
* @param sunset
* @param sunrise
* @param country
*/
public Sys(String country, Integer sunrise, Integer sunset) {
super();
this.country = country;
this.sunrise = sunrise;
this.sunset = sunset;
}

}