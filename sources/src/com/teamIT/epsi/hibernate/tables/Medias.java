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

	public int idMedia, nbVote,  note;
	public String chemin;
	public Utilisateur utilisateur;
	
	public Medias(){}

	public Medias(String chemin,
			com.teamIT.epsi.hibernate.tables.Utilisateur utilisateur) {
		super();
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
	
	@Column(name = "note", nullable = false)
	public int getNote() {
		return note;
	}

	public void setNote(int note) {
		this.note = note;
	}
	
	@Column(name = "nbVote", nullable = false)
	public int getNbVote() {
		return nbVote;
	}

	public void setNbVote(int nbVote) {
		this.nbVote = nbVote;
	}
	
	
}
