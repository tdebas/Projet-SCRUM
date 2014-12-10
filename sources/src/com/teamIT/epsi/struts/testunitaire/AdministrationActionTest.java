package com.teamIT.epsi.struts.testunitaire;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.teamIT.epsi.hibernate.tables.Droit;
import com.teamIT.epsi.hibernate.tables.Medias;
import com.teamIT.epsi.hibernate.tables.Utilisateur;
import com.teamIT.epsi.struts.actions.AdministrationAction;

public class AdministrationActionTest {
protected AdministrationAction admin;
public Utilisateur utilisateur;
public Droit droit;
public Medias media;

	@Before
	public void setUp() throws Exception {
	
		admin = new AdministrationAction();
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testAlternant() {
		
		admin.model.setAlternant("Oui");
		assertEquals("Oui",admin.model.getAlternant());
	}
	@Test
	public void testSexe() {
		
		admin.model.setSexe("Masculin");
		assertEquals("Masculin",admin.model.getSexe());
	}
	@Test
	public void testRole() {
		
		admin.model.setRole(15);
		assertEquals(15,admin.model.getRole());
	}
	@Test
	public void testaddUser() {
		
		admin.model.setSexe("M");
		assertNotNull(admin.model.sexe.isEmpty());
		
		admin.model.setAlternant("Oui");
		assertNotNull(admin.model.alternant.isEmpty());
		
	}
	/*@Test
	public void testloadUserEdit() {
		
		admin.model.setAlternant("1");
		assertEquals("Yes",admin.model.getAlternant());
		
		
		
	}
*/
}
