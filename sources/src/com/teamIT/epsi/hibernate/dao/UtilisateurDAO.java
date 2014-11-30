package com.teamIT.epsi.hibernate.dao;

import java.util.List;

import org.hibernate.criterion.Restrictions;

import com.teamIT.epsi.hibernate.tables.Utilisateur;
import com.teamIT.epsi.struts.method.DiversMethod;

public class UtilisateurDAO extends CoreDAO<Utilisateur> {
	
	public UtilisateurDAO() {
		super(Utilisateur.class);
	}
	
	public DiversMethod dm = new DiversMethod();
	
	public Utilisateur get(Utilisateur utilisateur) throws Exception{
	     Utilisateur user = (Utilisateur) session.createCriteria(Utilisateur.class)
	    		 .add( Restrictions.eq("mail", utilisateur.getMail()) )
	    		 .add( Restrictions.eq("password", dm.crypt(utilisateur)) )
	    		 .uniqueResult();
	     return user;
	 }
	
	public void saveOrUpdateUser(Utilisateur utilisateur) throws Exception{
		session.saveOrUpdate(utilisateur);
		session.getTransaction().commit();
	}
	
	public void removeUser(Utilisateur utilisateur){
		session.delete(utilisateur);
		session.getTransaction().commit();
	}
	
	public Utilisateur getUserById(int id){
		 Utilisateur user = (Utilisateur) session.createCriteria(Utilisateur.class)
				 .add( Restrictions.eq("idUtilisateur", id)).uniqueResult();
		 return user;
	}
	
	@SuppressWarnings("unchecked")
	public List<Utilisateur> getAllUser() {
		List<Utilisateur> user = (List<Utilisateur>) session.createSQLQuery("SELECT nom FROM utilisateur").list();
		return user;
	}
	
	public Utilisateur getUserName(String nom) {
//		Utilisateur user = (Utilisateur) session.createSQLQuery("SELECT * FROM utilisateur WHERE nom='"+nom+"'").uniqueResult();
		Utilisateur user = (Utilisateur) session.createCriteria(Utilisateur.class)
				 .add( Restrictions.eq("nom", nom)).uniqueResult();
		return user;
	}
	
	@SuppressWarnings("unchecked")
	public List<Utilisateur> getAll(){
		 List<Utilisateur> userList = session.createCriteria(Utilisateur.class).list();
		 return userList;
	}
	
	public Integer getMax(){
		 Integer i = (Integer) session.createSQLQuery("SELECT MAX(id) FROM utilisateur").uniqueResult();
		 return i;
	}
}
