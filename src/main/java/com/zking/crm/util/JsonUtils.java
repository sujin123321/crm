package com.zking.crm.util;

import java.io.IOException;
import java.io.OutputStream;

import com.fasterxml.jackson.core.JsonEncoding;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.ObjectMapper;
//import org.codehaus.jackson.JsonEncoding;
//import org.codehaus.jackson.JsonGenerator;
//import org.codehaus.jackson.JsonParseException;
//import org.codehaus.jackson.map.JsonMappingException;
//import org.codehaus.jackson.map.ObjectMapper;

/**
 *json
 * @author Administrator
 *
 */
public class JsonUtils {
	
	//1.ObjectMapper、
	private static ObjectMapper objectMapper = new ObjectMapper();

	static{
		
	}
	
	/**
	 * java-->json
	 * @param os
	 * @param value
	 */
	public static void writeValue(OutputStream os, Object value){
		try {
			//Generator:
			JsonGenerator jsonGenerator =objectMapper.getJsonFactory()
				.createJsonGenerator(os,JsonEncoding.UTF8);
			jsonGenerator.writeObject(value);
			if(jsonGenerator != null){
				jsonGenerator.flush();
			}
			if(!jsonGenerator.isClosed()){
				jsonGenerator.close();
			}
		} catch (IOException e) {
			throw new RuntimeException(e);
		} 
	}
	
	
	/**
	 * json --> java
	 * @param json
	 * @param type
	 * @return
	 */
	public static Object readValue (String json, Class<?> type){
		try {
			return objectMapper.readValue(json, type);
		} catch (Exception e) {
			throw new RuntimeException(e);
		} 
	}

}
