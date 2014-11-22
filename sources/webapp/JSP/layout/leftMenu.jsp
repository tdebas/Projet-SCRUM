<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="col-md-2">
	<p class="userOnline"><s:property value="#session.utilisateur.nom" /> <s:property value="#session.utilisateur.prenom" /></p>
	<h5><span class="glyphicon glyphicon-user"></span> Menu principal</h5>
	<ul class="nav nav-pills nav-stacked">
	    <li><a href='<s:url action="index_page"/>'>Menu <span class="glyphicon glyphicon-list-alt"></span></a></li>
	    <li><a href='<s:url action="utilisateur_executeProfil"/>'>Edit profil <span class="glyphicon glyphicon-pencil"></span></a></li>
	    <li><a href='<s:url action="connexion_deconnexion"/>'>Logout <span class="glyphicon glyphicon-off"></span></a></li>
	</ul>
</div>