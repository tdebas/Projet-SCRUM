<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="col-md-2">
	<p class="userOnline"><s:property value="#session.utilisateur.nom" /> <s:property value="#session.utilisateur.prenom" /></p>
	<h5><span class="glyphicon glyphicon-user"></span> Main menu</h5>
	<ul class="nav nav-pills nav-stacked">
	    <li><a href='<s:url action="connexion_execute"/>'>Accueil <span class="glyphicon glyphicon-home"></span></a></li>
	    <li><a href='<s:url action="utilisateur_executeProfil"/>'>Edit profil <span class="glyphicon glyphicon-pencil"></span></a></li>
	    <li><a href='<s:url action="trombinoscope_execute"/>'>Trombinoscope <span class="glyphicon glyphicon-pencil"></span></a></li>
	    <li><a href='<s:url action="connexion_deconnexion"/>'>Logout <span class="glyphicon glyphicon-off"></span></a></li>
	</ul>
<s:if test="estAdmin">
	<h5><span class="glyphicon glyphicon-wrench"></span> Administration</h5>
	<ul class="nav nav-pills nav-stacked">
		<li><a href='<s:url action="administration_execute"/>'>Manage <span class="glyphicon glyphicon-cog"></span></a></li>
	</ul>
</s:if>
</div>