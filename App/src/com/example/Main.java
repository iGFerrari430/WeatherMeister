
package com.example;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Main {

@SerializedName("temp")
@Expose
public Double temp;
@SerializedName("humidity")
@Expose
public Double humidity;
@SerializedName("pressure")
@Expose
public Double pressure;
@SerializedName("temp_min")
@Expose
public Double tempMin;
@SerializedName("temp_max")
@Expose
public Double tempMax;

/**
* No args constructor for use in serialization
* 
*/
public Main() {
}

/**
* 
* @param humidity
* @param pressure
* @param tempMax
* @param temp
* @param tempMin
*/
public Main(Double temp, Double humidity, Double pressure, Double tempMin, Double tempMax) {
super();
this.temp = temp;
this.humidity = humidity;
this.pressure = pressure;
this.tempMin = tempMin;
this.tempMax = tempMax;
}

}