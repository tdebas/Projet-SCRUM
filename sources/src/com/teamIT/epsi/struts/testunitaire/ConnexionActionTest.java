package com.teamIT.epsi.struts.testunitaire;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.teamIT.epsi.hibernate.dao.UtilisateurDAO;
import com.teamIT.epsi.hibernate.tables.Utilisateur;
import com.teamIT.epsi.struts.actions.ConnexionAction;
import com.teamIT.epsi.struts.actions.ConnexionAction.ConnexionModel;

public class ConnexionActionTest {
	protected ConnexionAction connect;
	protected Utilisateur utilisateur;
	
	protected ConnexionModel model;
	protected UtilisateurDAO uDAO;
	
	@Before
	public void setUp() throws Exception {
		connect = new ConnexionAction();
		//model = new ConnexionModel();
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testConnexion() {
		assertNotNull(connect);
	}
	@Test
	public void testutilisateur() {
		try{
			
			assertNotNull(connect.utilisateur());
	
		} catch(Exception e) {
			fail();
		}
	}
	

}
