package com.teamIT.epsi.hibernate.dao;

import java.util.List;

import org.hibernate.criterion.Restrictions;

import com.teamIT.epsi.hibernate.tables.Medias;

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
	public List<Medias> getAllByUserId(int id){
		 List<Medias> mediaList = session.createCriteria(Medias.class)
				 .add( Restrictions.eq("idUtil", id) ).list();
		 return mediaList;
	}
	
}
