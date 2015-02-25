package com.rmuti.db;

import java.io.UnsupportedEncodingException;
import java.io.*;
import javax.mail.*;

public class Utility {
	public static String convertThai (String text) {
		try{
			return new String(text.getBytes("ISO8859_1"), "UTF-8");
		}
		catch (UnsupportedEncodingException ex){
			return null;
			
		}
		
	}
}
