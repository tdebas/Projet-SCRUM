package com.teamIT.epsi.hibernate.dao;

import java.util.List;

import org.hibernate.criterion.Restrictions;

import com.teamIT.epsi.hibernate.tables.Medias;
import com.teamIT.epsi.hibernate.tables.Utilisateur;

public class MediasDAO extends CoreDAO<Medias>{

	public MediasDAO() {
		super(Medias.class);
	}
	
	@SuppressWarnings("unchecked")
	public List<Medias> getAll(){
		 List<Medias> mediaList = session.createCriteria(Medias.class).list();
		 return mediaList;
	}
	
	@SuppressWarnings("unchecked")
	public List<Medias> getAllByUserId(Utilisateur user){
		 List<Medias> mediaList = session.createCriteria(Medias.class)
				 .add( Restrictions.eq("utilisateur", user) ).list();
		 return mediaList;
	}
	
	public Medias getMedia(String chemin,Utilisateur utilisateur){
	     Medias media = (Medias) session.createCriteria(Medias.class)
	    		 .add( Restrictions.eq("chemin", chemin) )
	    		 .add( Restrictions.eq("utilisateur", utilisateur))
	    		 .uniqueResult();
	     return media;
	 }
	
}