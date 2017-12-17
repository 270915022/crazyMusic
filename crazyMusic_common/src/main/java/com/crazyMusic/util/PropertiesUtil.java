package com.crazyMusic.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class PropertiesUtil {
	
	
	public static String getValue(String key,InputStream ins) throws IOException{
		Properties props = new Properties();
		props.load(ins);
		return props.getProperty(key);
	}
}
