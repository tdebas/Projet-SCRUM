package com.teamIT.epsi.struts.method;

import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import com.teamIT.epsi.hibernate.tables.Utilisateur;

public class DiversMethod {

	public String crypt(Utilisateur utilisateur) throws Exception {
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(utilisateur.getPassword().getBytes());
		byte[] digest = md.digest();
		StringBuffer sb = new StringBuffer();
		for (byte b : digest) {
			sb.append(String.format("%02x", b & 0xff));
		}
		return sb.toString();
	}
	
	public String date(){
		SimpleDateFormat formatter = new SimpleDateFormat ("yyyyMMdd" ); 
		Date currentTime_1 = new Date();  
		String dateString = formatter.format(currentTime_1);
		return dateString;
	}
	
	public int random(){
		Random r = new Random();
		int random = 1111111 + r.nextInt(9999999 - 1111111);
		return random;
	}
}
