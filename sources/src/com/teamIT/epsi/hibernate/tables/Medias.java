package com.teamIT.epsi.hibernate.tables;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "medias")
public class Medias {

	public int idMedia;
	public String chemin;
	public Utilisateur utilisateur;
	
	public Medias(){}

	public Medias(int idMedia, String chemin,
			com.teamIT.epsi.hibernate.tables.Utilisateur utilisateur) {
		super();
		this.idMedia = idMedia;
		this.chemin = chemin;
		this.utilisateur = utilisateur;
	}



	@Id
	@GeneratedValue
	@Column(name = "id", unique = true, nullable = false)
	public int getIdMedia() {
		return idMedia;
	}

	public void setIdMedia(int idMedia) {
		this.idMedia = idMedia;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idUtil", nullable = false)
	public Utilisateur getUtilisateur() {
		return utilisateur;
	}

	public void setUtilisateur(Utilisateur utilisateur) {
		this.utilisateur = utilisateur;
	}

	@Column(name = "chemin", nullable = false)
	public String getChemin() {
		return chemin;
	}

	public void setChemin(String chemin) {
		this.chemin = chemin;
	}
	
	
}