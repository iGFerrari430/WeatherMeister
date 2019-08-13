package com.example;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;

public class util {
	public util()
	{
		
	}
	
	public Double toF(Double kelvin)
	{
		double d1 = kelvin*9/5 - 459.67;
		BigDecimal   b   =   new   BigDecimal(d1);  
		double   f1   =   b.setScale(1,   BigDecimal.ROUND_HALF_UP).doubleValue();  
		return f1;
	}
	
	public String toTime(int unix)
	{
		long unixSeconds = (long)unix;
		// convert seconds to milliseconds
		Date date = new java.util.Date(unixSeconds*1000L); 
		// the format of your date
		SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss z"); 
		// give a timezone reference for formatting (see comment at the bottom)
		sdf.setTimeZone(java.util.TimeZone.getTimeZone("GMT-4")); 
		String formattedDate = sdf.format(date);
		
		return formattedDate;
	}
}
