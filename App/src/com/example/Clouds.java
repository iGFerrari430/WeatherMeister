package com.example;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Clouds {

@SerializedName("all")
@Expose
public Integer all;

/**
* No args constructor for use in serialization
* 
*/
public Clouds() {
}

/**
* 
* @param all
*/
public Clouds(Integer all) {
super();
this.all = all;
}

}