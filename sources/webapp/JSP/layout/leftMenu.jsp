<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="col-md-2">
	<p class="userOnline"><s:property value="#session.utilisateur.nom" /> <s:property value="#session.utilisateur.prenom" /></p>
	<h5><span class="glyphicon glyphicon-user"></span> Titre</h5>
	<ul class="nav nav-pills nav-stacked">
	    <li><a href="#" >Menu <span class="glyphicon glyphicon-list-alt"></span></a></li>
	    <li><a href="#" >Menu <span class="glyphicon glyphicon-pencil"></span></a></li>
	</ul>
	<h5><span class="glyphicon glyphicon-road"></span> Titre</h5>
	<ul class="nav nav-pills nav-stacked">
		<li><a href="#" >Menu <span class="glyphicon glyphicon-list-alt"></span></a></li>
	    <li><a href="#" >Menu <span class="glyphicon glyphicon-pencil"></span></a></li>
	</ul>
	<h5><span class="glyphicon glyphicon-wrench"></span> Titre</h5>
	<ul class="nav nav-pills nav-stacked">
		<li><a href="#" >Menu <span class="glyphicon glyphicon-home"></span></a></li>
	    <li><a href="#" >Menu <span class="glyphicon glyphicon-cog"></span></a></li>
	    <li><a href='<s:url action="connexion_deconnexion"/>'>Deconnexion <span class="glyphicon glyphicon-off"></span></a></li>
	</ul>
</div>