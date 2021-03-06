package com.teamIT.epsi.hibernate.dao;

import java.util.List;

import org.hibernate.criterion.Order;
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
	
	public int getIdDroitUser(int idUtilisateur){
		int i = (int) session.createSQLQuery("SELECT droit.id FROM droit, utilisateur WHERE utilisateur.idDroit = droit.id AND utilisateur.id = " + idUtilisateur).uniqueResult();
		return i;
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
	
	@SuppressWarnings("unchecked")
	public List<Utilisateur> getAllUserExceptSuperAdmin() {
		List<Utilisateur> user = (List<Utilisateur>) session.createSQLQuery("SELECT nom FROM utilisateur WHERE idDroit != 3").list();
		return user;
	}
	
	public Utilisateur getUserName(String nom) {
		Utilisateur user = (Utilisateur) session.createCriteria(Utilisateur.class)
				 .add( Restrictions.eq("nom", nom)).uniqueResult();
		return user;
	}
	
	@SuppressWarnings("unchecked")
	public List<Utilisateur> getAll(){
		 List<Utilisateur> userList = session.createCriteria(Utilisateur.class).list();
		 return userList;
	}
	
	@SuppressWarnings("unchecked")
	public List<Utilisateur> getAllByOrder(int tri){
		List<Utilisateur> userList = null;
		if(tri == 1){
			userList = session.createCriteria(Utilisateur.class).addOrder(Order.asc("nom")).list();
		}else if (tri == 2){
			userList = session.createCriteria(Utilisateur.class).addOrder(Order.desc("nom")).list();
		}else if (tri == 3){
			userList = session.createCriteria(Utilisateur.class).add(Restrictions.eq("sexe", "1")).addOrder(Order.asc("nom")).addOrder(Order.asc("prenom")).list();
		}else if (tri == 4){
			userList = session.createCriteria(Utilisateur.class).add(Restrictions.eq("sexe", "2")).addOrder(Order.asc("nom")).addOrder(Order.asc("prenom")).list();
		}else if (tri == 5){
			userList = session.createCriteria(Utilisateur.class).add(Restrictions.eq("estAlternant", "1")).addOrder(Order.asc("nom")).addOrder(Order.asc("prenom")).list();
		}else if (tri == 6){
			userList = session.createCriteria(Utilisateur.class).add(Restrictions.eq("estAlternant", "2")).addOrder(Order.asc("nom")).addOrder(Order.asc("prenom")).list();
		}else if (tri == 7){
			userList = session.createCriteria(Utilisateur.class).addOrder(Order.desc("note")).addOrder(Order.asc("nom")).addOrder(Order.asc("prenom")).list();
		}else{
			userList = session.createCriteria(Utilisateur.class).list();
		}
		return userList;
	}
	
	public Integer getMax(){
		 Integer i = (Integer) session.createSQLQuery("SELECT MAX(id) FROM utilisateur").uniqueResult();
		 return i;
	}
}
