package com.teamIT.epsi.struts.actions;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class TrombiActionTest {
	
	protected TrombiAction trombi;
	
@Before
	public void setUp() throws Exception {
		
		trombi = new TrombiAction();
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testtri() {
		
		trombi.model.setTri(2);
		assertEquals(2,trombi.model.getTri());
	}

}
