package com.teamIT.epsi.hibernate.tables;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "droit")
public class Droit {
	public int idDroit;
	public String libelle;
	
	public Droit(){}

	public Droit(int idDroit, String libelle) {
		super();
		this.idDroit = idDroit;
		this.libelle = libelle;
	}
	@Id
	@GeneratedValue
	@Column(name = "id", unique = true, nullable = false)
	public int getIdDroit() {
		return idDroit;
	}

	public void setIdDroit(int idDroit) {
		this.idDroit = idDroit;
	}

	@Column(name = "libelle", nullable = false)
	public String getLibelle() {
		return libelle;
	}

	public void setLibelle(String libelle) {
		this.libelle = libelle;
	}

}
