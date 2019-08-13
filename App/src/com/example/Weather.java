package com.example;

import com.google.gson.annotations.Expose;

import com.google.gson.annotations.SerializedName;

public class Weather {

@SerializedName("id")
@Expose
public Integer id;
@SerializedName("main")
@Expose
public String main;
@SerializedName("description")
@Expose
public String description;
@SerializedName("icon")
@Expose
public String icon;

/**
* No args constructor for use in serialization
* 
*/
public Weather() {
}

/**
* 
* @param id
* @param icon
* @param description
* @param main
*/
public Weather(Integer id, String main, String description, String icon) {
super();
this.id = id;
this.main = main;
this.description = description;
this.icon = icon;
}

}