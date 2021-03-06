package com.teamIT.epsi.struts.actions;

import java.io.File;
import java.net.URI;
import java.util.List;

import org.apache.commons.io.FileUtils;

import com.opensymphony.xwork2.ModelDriven;
import com.teamIT.epsi.hibernate.dao.DroitDAO;
import com.teamIT.epsi.hibernate.dao.MediasDAO;
import com.teamIT.epsi.hibernate.dao.UtilisateurDAO;
import com.teamIT.epsi.hibernate.tables.Droit;
import com.teamIT.epsi.hibernate.tables.Medias;
import com.teamIT.epsi.hibernate.tables.Utilisateur;
import com.teamIT.epsi.struts.method.DiversMethod;
public class AdministrationAction extends BaseAction implements ModelDriven<AdministrationAction.AdministrationModel>{

	private static final long serialVersionUID = -450315913459654085L;
	
	public class AdministrationModel {
		public List<Utilisateur> userList;
		public List<Medias> mediaList;
		public Utilisateur utilisateur;
		public Droit droit;
		public Medias media;
		private File file;
		@SuppressWarnings("unused")
		private String contentType;
	    private String filename;
	    private String destPath;
	    public String sexe;
	    public String alternant;
	    public int role;
	   
	    public void setUpload(File file) {
	        this.file = file;
	    }

	    public void setUploadContentType(String contentType) {
	        this.contentType = contentType;
	    }

	     public void setUploadFileName(String filename) {
	        this.filename = filename;
	     }
	     
		public Droit getDroit() {
			return droit;
		}

		public void setDroit(Droit droit) {
			this.droit = droit;
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

		public int getRole() {
			return role;
		}

		public void setRole(int role) {
			this.role = role;
		}
		
	}
	
	public AdministrationModel model = new AdministrationModel();
	public UtilisateurDAO uDAO = new UtilisateurDAO();
	public MediasDAO mDAO = new MediasDAO();
	public DroitDAO dDAO = new DroitDAO();
	public DiversMethod dm = new DiversMethod();
	
	public String execute() throws Exception{
		return SUCCESS;
	}
	public String executeAdd(){
		return "add";
	}
	
	public String executeUpdate(){
		model.userList = uDAO.getAllUserExceptSuperAdmin();
		return "update";
	}
	
	public String executeDelete(){
		model.userList = uDAO.getAllUserExceptSuperAdmin();
		return "delete";
	}
	
	public String executeRole(){
		model.userList = uDAO.getAllUserExceptSuperAdmin();
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
			File inputFile = new File(new URI(this.getClass().getClassLoader().getResource("").toString()));
			String[] chemin = inputFile.toString().split("WEB-INF");
			model.destPath = chemin[0] + "IMG\\";
			File destFile  = new File(model.destPath, model.filename);
	    	FileUtils.copyFile(model.file, destFile);
			model.utilisateur.setChemin("/IMG/" + model.filename);
		}
		
		model.utilisateur.setPassword(dm.crypt(model.utilisateur));
		model.utilisateur.setDroit(dDAO.getDroitById(1));
		model.utilisateur.setNote(0);
		model.utilisateur.setNbVote(0);
		
		model.userList = uDAO.getAllUser();
		
		uDAO.saveOrUpdate(model.utilisateur);
		
		addActionMessage("You just added the user " + model.utilisateur.nom + " " + model.utilisateur.prenom +".");
		
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
		if(empty == true){
			return executeUpdate();
		}
	
		model.utilisateur.setPassword(dm.crypt(model.utilisateur));
		
		model.utilisateur.setDroit(dDAO.getDroitById(uDAO.getIdDroitUser(model.utilisateur.idUtilisateur)));
		
		uDAO.update(model.utilisateur);
		
		addActionMessage("You just updated the user " + model.utilisateur.nom + " " + model.utilisateur.prenom +".");
		
		return SUCCESS;
	}
	
	public String changePicture() throws Exception{
		
		model.utilisateur = uDAO.getUserById(model.utilisateur.idUtilisateur);
		String chemin = model.utilisateur.chemin;
		
		if(model.file == null){
			addActionError("File is empty"); 
			return executeUpdate();
		}
		
		model.filename = model.utilisateur.nom + "_" + model.utilisateur.prenom + "_" + dm.date() + "_" + dm.random() + ".jpg";
		File inputFile = new File(new URI(this.getClass().getClassLoader().getResource("").toString()));
		String[] chemin2 = inputFile.toString().split("WEB-INF");
		model.destPath = chemin2[0] + "IMG\\";
		File destFile  = new File(model.destPath, model.filename);
    	FileUtils.copyFile(model.file, destFile);
    	model.utilisateur.setChemin("/IMG/" + model.filename);
		
		Medias media = new Medias(chemin, model.utilisateur);
		
		mDAO.save(media);
		uDAO.update(model.utilisateur);
		
		addActionMessage("You juste change the picture of "+ model.utilisateur.nom + " " + model.utilisateur.prenom +".");
		
		return SUCCESS;
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
		
		addActionMessage("You just deleted the user " + model.utilisateur.nom + " " + model.utilisateur.prenom +".");
		
		return SUCCESS;
	}

	public String changingRoles(){
		model.utilisateur = uDAO.getUserName(model.utilisateur.nom);
		model.droit = dDAO.getDroitById(model.role);
		model.utilisateur.setDroit(model.droit);
		uDAO.saveOrUpdate(model.utilisateur);
		addActionMessage("You just changing roles of " + model.utilisateur.nom + " " + model.utilisateur.prenom +".");
		return SUCCESS;
	}
	
	public AdministrationModel getModel() {
		return model;
	}
	
	public void setModel(AdministrationModel model) {
		this.model = model;
	}
		
}
