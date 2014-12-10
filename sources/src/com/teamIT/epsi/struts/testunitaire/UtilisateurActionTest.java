package com.teamIT.epsi.struts.testunitaire;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.teamIT.epsi.struts.actions.UtilisateurAction;

public class UtilisateurActionTest {
	protected UtilisateurAction util;

	@Before
	public void setUp() throws Exception {
		util = new UtilisateurAction();
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testProfil() {
		
		util.model.setSexe("Man");
		assertEquals("Man",util.model.getSexe());
		
		util.model.setSexe("Woman");
		assertEquals("Woman",util.model.getSexe());
		
		util.model.setAlternant("No");
		assertEquals("No",util.model.getAlternant());
		
		util.model.setAlternant("Yes");
		assertEquals("Yes",util.model.getAlternant());
	}
	@Test
	public void testeditProfil() {
		
		util.model.setIdUser(5);
		assertEquals((int)5,(int)util.model.getIdUser());
			
	}

}
