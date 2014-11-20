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
@Table(name = "utilisateur")
public class Utilisateur {

	public int idUtilisateur, note;
	public String nom, prenom, mail, password, sexe, estAlternant;
	public Droit droit;
	
	/* Constructor empty */
	public Utilisateur(){}

	/* Constructor */
	public Utilisateur(int idUtilisateur, int note, String nom, String prenom,
			String mail, String password, String sexe, String estAlternant,
			com.teamIT.epsi.hibernate.tables.Droit droit) {
		super();
		this.idUtilisateur = idUtilisateur;
		this.note = note;
		this.nom = nom;
		this.prenom = prenom;
		this.mail = mail;
		this.password = password;
		this.sexe = sexe;
		this.estAlternant = estAlternant;
		this.droit = droit;
	}
	/* Getters & Setters */
	
	@Id
	@GeneratedValue
	@Column(name = "id", unique = true, nullable = false)
	public int getIdUtilisateur() {
		return idUtilisateur;
	}

	public void setIdUtilisateur(int idUtilisateur) {
		this.idUtilisateur = idUtilisateur;
	}

	@Column(name = "note", nullable = false)
	public int getNote() {
		return note;
	}

	public void setNote(int note) {
		this.note = note;
	}

	@Column(name = "nom", nullable = false)
	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	@Column(name = "prenom", nullable = false)
	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	@Column(name = "mail", nullable = false)
	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	@Column(name = "mdp", nullable = false)
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "sexe", nullable = false)
	public String getSexe() {
		return sexe;
	}

	public void setSexe(String sexe) {
		this.sexe = sexe;
	}

	@Column(name = "estAlternant", nullable = false)
	public String getEstAlternant() {
		return estAlternant;
	}

	public void setEstAlternant(String estAlternant) {
		this.estAlternant = estAlternant;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idDroit", nullable = false)
	public Droit getDroit() {
		return droit;
	}

	public void setDroit(Droit droit) {
		this.droit = droit;
	}
	
}
