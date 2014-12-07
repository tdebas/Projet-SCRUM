package com.teamIT.epsi.struts.actions;

import java.io.File;
import java.util.List;

import org.apache.commons.io.FileUtils;

import com.opensymphony.xwork2.ModelDriven;
import com.teamIT.epsi.hibernate.dao.DroitDAO;
import com.teamIT.epsi.hibernate.dao.MediasDAO;
import com.teamIT.epsi.hibernate.dao.UtilisateurDAO;
import com.teamIT.epsi.hibernate.tables.Medias;
import com.teamIT.epsi.hibernate.tables.Utilisateur;
import com.teamIT.epsi.struts.method.DiversMethod;
public class AdministrationAction extends BaseAction implements ModelDriven<AdministrationAction.AdministrationModel>{

	private static final long serialVersionUID = -450315913459654085L;
	
	public class AdministrationModel {
		public List<Utilisateur> userList;
		public List<Medias> mediaList;
		public Utilisateur utilisateur;
		public Medias media;
		private File file;
		@SuppressWarnings("unused")
		private String contentType;
	    private String filename;
	    private String destPath;
	    public String sexe;
	    public String alternant;
	   
	    public void setUpload(File file) {
	        this.file = file;
	    }

	    public void setUploadContentType(String contentType) {
	        this.contentType = contentType;
	    }

	     public void setUploadFileName(String filename) {
	        this.filename = filename;
	     }
		public List<Utilisateur> getUserList() {
			return userList;
		}

		public void setUserList(List<Utilisateur> userList) {
			this.userList = userList;
		}
		
		public Utilisateur getUtilisateur() {
			return utilisateur;
		}

		public void setUtilisateur(Utilisateur utilisateur) {
			this.utilisateur = utilisateur;
		}

		public Medias getMedia() {
			return media;
		}

		public void setMedia(Medias media) {
			this.media = media;
		}

		public String getSexe() {
			return sexe;
		}

		public void setSexe(String sexe) {
			this.sexe = sexe;
		}

		public String getAlternant() {
			return alternant;
		}

		public void setAlternant(String alternant) {
			this.alternant = alternant;
		}

		public List<Medias> getMediaList() {
			return mediaList;
		}

		public void setMediaList(List<Medias> mediaList) {
			this.mediaList = mediaList;
		}
		
	}
	
	public AdministrationModel model = new AdministrationModel();
	public UtilisateurDAO uDAO = new UtilisateurDAO();
	public MediasDAO mDAO = new MediasDAO();
	public DroitDAO dDAO = new DroitDAO();
	public DiversMethod dm = new DiversMethod();
	
	public String execute(){
		return SUCCESS;
	}
	public String executeAdd(){
		return "add";
	}
	
	public String executeUpdate(){
		model.userList = uDAO.getAllUser();
		return "update";
	}
	
	public String executeDelete(){
		model.userList = uDAO.getAllUser();
		return "delete";
	}
	
	public String executeRole(){
		model.userList = uDAO.getAllUser();
		return "role";
	}
	
	public String addUser() throws Exception{
		
		boolean empty = false;
		
		if((model.utilisateur.nom.isEmpty()) || (model.utilisateur.nom == null)){
			addActionError("Surname is empty");
			empty = true;
		}
		if((model.utilisateur.prenom.isEmpty()) || (model.utilisateur.prenom == null)){
			addActionError("Firstname is empty");
			empty = true;
		}
		if((model.utilisateur.mail.isEmpty()) || (model.utilisateur.mail == null)){
			addActionError("Mail is empty");
			empty = true;
		}
		if(model.utilisateur.sexe == null){
			addActionError("Gender is empty");
			empty = true;
		}
		if(model.utilisateur.estAlternant == null){
			addActionError("Alternate is empty");
			empty = true;
		}
		if(model.file == null){
			addActionError("Photo is empty");
			empty = true;
		} 
		if(empty == true){
			return executeAdd();
		}
		
		if(model.file != null) {
			model.filename = model.utilisateur.nom + "_" + model.utilisateur.prenom + "_" + dm.date() + "_" + dm.random() + ".jpg";
			String classPath = AdministrationAction.class.getClassLoader().getResource(AdministrationAction.class.getName().replaceAll("\\.", "/" )+".class").getPath();
			String[] tokens = classPath.split(".metadata");
			model.destPath = tokens[0] + "Trombinoscope/sources/webapp/IMG/";
			File destFile  = new File(model.destPath, model.filename);
	    	FileUtils.copyFile(model.file, destFile);
			model.utilisateur.setChemin("/IMG/" + model.filename);
		}
		
		model.utilisateur.setPassword(dm.crypt(model.utilisateur));
		model.utilisateur.setDroit(dDAO.getDroitById(1));
		model.utilisateur.setNote(0);
		
		model.userList = uDAO.getAllUser();
		
		uDAO.saveOrUpdateUser(model.utilisateur);
		
		addActionMessage("Vous venez d'ajouter l'utilisateur " + model.utilisateur.nom + " " + model.utilisateur.prenom +".");
		
		return execute();
	}

	public String loadUserEdit(){
		model.utilisateur = uDAO.getUserName(model.utilisateur.nom);
		
		if (model.utilisateur.sexe.equals("1")){
			model.setSexe("Man");
		} else if(model.utilisateur.sexe.equals("2")){
			model.setSexe("Woman");
		} else {
			model.setSexe("Not specified");
		}
		
		if(model.utilisateur.estAlternant.equals("1")){
			model.setAlternant("Yes");
		} else if(model.utilisateur.estAlternant.equals("2")){
			model.setAlternant("No");
		} else {
			model.setAlternant("Not specified");
		}
		
		return executeUpdate();
	}
	
	public String updateUser() throws Exception{
		model.utilisateur.setPassword(dm.crypt(model.utilisateur));
		model.utilisateur.setDroit(dDAO.getDroitById(1));
		model.utilisateur.setChemin("/IMG/" + model.filename);
		uDAO.saveOrUpdateUser(model.utilisateur);
		return executeUpdate();
	}
	
	public String loadUserRemove(){
		model.utilisateur = uDAO.getUserName(model.utilisateur.nom);
		
		if (model.utilisateur.sexe.equals("1")){
			model.setSexe("Man");
		} else if(model.utilisateur.sexe.equals("2")){
			model.setSexe("Woman");
		} else {
			model.setSexe("Not specified");
		}
		
		if(model.utilisateur.estAlternant.equals("1")){
			model.setAlternant("Yes");
		} else if(model.utilisateur.estAlternant.equals("2")){
			model.setAlternant("No");
		} else {
			model.setAlternant("Not specified");
		}
		
		return executeDelete();
	}
	
	public String RemoveUser(){
		model.mediaList = mDAO.getAllByUserId(model.utilisateur);
		
		if(model.mediaList.size() != 0){
			for(Medias m : model.mediaList){
				mDAO.delete(m);
			}
		}
		
		model.utilisateur = uDAO.getUserById(model.utilisateur.idUtilisateur);
		
		uDAO.delete(model.utilisateur);
		
		addActionMessage("Vous venez de supprimer l'utilisateur " + model.utilisateur.nom + " " + model.utilisateur.prenom +".");
		
		return SUCCESS;
	}
	
	public void media(Integer i) throws Exception{
		Utilisateur utilisateur = uDAO.getUserById(i);
		model.media = new Medias(utilisateur.getChemin(), utilisateur);
		mDAO.saveOrUpdate(model.media);
	}
	
	public AdministrationModel getModel() {
		return model;
	}
	
	public void setModel(AdministrationModel model) {
		this.model = model;
	}
		
}
