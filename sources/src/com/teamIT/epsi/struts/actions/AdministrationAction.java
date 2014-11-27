package com.teamIT.epsi.struts.actions;

import java.io.File;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.apache.commons.io.FileUtils;

import com.opensymphony.xwork2.ModelDriven;
import com.teamIT.epsi.hibernate.dao.DroitDAO;
import com.teamIT.epsi.hibernate.dao.MediasDAO;
import com.teamIT.epsi.hibernate.dao.UtilisateurDAO;
import com.teamIT.epsi.hibernate.tables.Medias;
import com.teamIT.epsi.hibernate.tables.Utilisateur;
public class AdministrationAction extends BaseAction implements ModelDriven<AdministrationAction.AdministrationModel>{

	private static final long serialVersionUID = -450315913459654085L;
	
	public class AdministrationModel {
		public List<Utilisateur> userList;
		public Utilisateur utilisateur;
		public Medias media;
		private File file;
	    private String contentType;
	    private String filename;
	    private String destPath;

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
		
	}
	
	public AdministrationModel model = new AdministrationModel();
	public UtilisateurDAO uDAO = new UtilisateurDAO();
	public MediasDAO mDAO = new MediasDAO();
	public DroitDAO dDAO = new DroitDAO();

	public String execute(){
		model.userList = uDAO.getAllUser();
		return SUCCESS;
	}

	public String addUser() throws Exception{
		/* MJ : Crypter le password en MD5 */
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(model.utilisateur.getPassword().getBytes());
		byte[] digest = md.digest();
		StringBuffer sb = new StringBuffer();
		for (byte b : digest) {
			sb.append(String.format("%02x", b & 0xff));
		}
		model.filename = model.utilisateur.nom + model.utilisateur.prenom + "_" + date() + "_" + random() + ".jpg";
		String classPath = AdministrationAction.class.getClassLoader().getResource(AdministrationAction.class.getName().replaceAll("\\.", "/" )+".class").getPath();
		String[] tokens = classPath.split(".metadata");
		model.destPath = tokens[0] + "Trombinoscope/sources/webapp/IMG/";
		File destFile  = new File(model.destPath, model.filename);
    	FileUtils.copyFile(model.file, destFile);
		model.utilisateur.setPassword(sb.toString());
		model.utilisateur.setDroit(dDAO.getDroitById(1));
		model.utilisateur.setChemin("http://localhost:8080/trombi/IMG/" + model.filename);
//		media(model.utilisateur);
		model.userList = uDAO.getAllUser();
		uDAO.saveOrUpdateUser(model.utilisateur);
		
		
		return SUCCESS;
	}
	
	public String date(){
		SimpleDateFormat formatter = new SimpleDateFormat ("yyyyMMdd" ); 
		Date currentTime_1 = new Date();  
		String dateString = formatter.format(currentTime_1);
		return dateString;
	}
	
	public int random(){
		Random r = new Random();
		int random = 1111111 + r.nextInt(9999999 - 1111111);
		return random;
	}
	
	public void media(Utilisateur utilisateur) throws Exception{
		model.media = new Medias(utilisateur.getChemin(), utilisateur);
		mDAO.saveOrUpdateMedia(model.media);
	}
	public AdministrationModel getModel() {
		return model;
	}
	public void setModel(AdministrationModel model) {
		this.model = model;
	}
		
}
