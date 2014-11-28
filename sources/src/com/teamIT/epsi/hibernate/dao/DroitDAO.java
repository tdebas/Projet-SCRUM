package com.teamIT.epsi.hibernate.dao;

import org.hibernate.criterion.Restrictions;
import com.teamIT.epsi.hibernate.tables.Droit;

public class DroitDAO extends CoreDAO<Droit>{

	public DroitDAO() {
		super(Droit.class);
	}
	
	public Droit getDroitById(int idDroit){		
		Droit droit = (Droit) session.createCriteria(Droit.class)
	    		 .add( Restrictions.eq("id", idDroit))
	    		 .uniqueResult();
		
		return droit;
	}
}
