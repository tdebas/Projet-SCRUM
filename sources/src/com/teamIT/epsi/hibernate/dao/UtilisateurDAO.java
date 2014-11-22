package com.teamIT.epsi.hibernate.dao;

import java.security.MessageDigest;

import org.hibernate.criterion.Restrictions;

import com.teamIT.epsi.hibernate.tables.Utilisateur;

public class UtilisateurDAO extends CoreDAO<Utilisateur> {

	public UtilisateurDAO() {
		super(Utilisateur.class);
	}
	
	public Utilisateur get(Utilisateur utilisateur) throws Exception{
		/* MJ : Crypt password of MD5 */
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(utilisateur.getPassword().getBytes());
		byte[] digest = md.digest();
		StringBuffer sb = new StringBuffer();
		for (byte b : digest) {
			sb.append(String.format("%02x", b & 0xff));
		}

        session.beginTransaction();
		/* MJ : check login and password in database */
	     Utilisateur user = (Utilisateur) session.createCriteria(Utilisateur.class)
	    		 .add( Restrictions.eq("mail", utilisateur.getMail()) )
	    		 .add( Restrictions.eq("password", sb.toString()) )
	    		 .uniqueResult();
	     
	     return user;
	 }
	
	public Utilisateur getUserWithPassCrypted(Utilisateur utilisateur) throws Exception{
		/* MJ : check login and password in database */
	     Utilisateur user = (Utilisateur) session.createCriteria(Utilisateur.class)
	    		 .add( Restrictions.eq("mail", utilisateur.getMail()) )
	    		 .add( Restrictions.eq("password", utilisateur.getPassword()) )
	    		 .uniqueResult();
	     
	     return user;
	 }
}