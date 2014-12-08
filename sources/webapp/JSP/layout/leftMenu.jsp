<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="col-md-2 leftMenu">
	<p class="userOnline"><s:property value="#session.utilisateur.nom" /> <s:property value="#session.utilisateur.prenom" /></p>
	<h5><span class="glyphicon glyphicon-user"></span> Main menu</h5>
	<ul class="nav nav-pills nav-stacked">
	    <li id="home_menu"><a href='<s:url action="connexion_execute"/>'>Home <span class="glyphicon glyphicon-home"></span></a></li>
	    <li id="edit_menu"><a href='<s:url action="utilisateur_execute"/>'>Edit profil <span class="glyphicon glyphicon-pencil"></span></a></li>
	    <li id="trombi_menu"><a href='<s:url action="trombinoscope_execute"/>'>Trombinoscope <span class="glyphicon glyphicon-th"></span></a></li>
	    <li><a href='<s:url action="connexion_deconnexion"/>'>Logout <span class="glyphicon glyphicon-off"></span></a></li>
	</ul>
	<s:if test="estAdmin">
		<h5><span class="glyphicon glyphicon-wrench"></span> Administration</h5>
		<ul class="nav nav-pills nav-stacked">
			<li id="admin_menu"><a href='<s:url action="administration_execute"/>'>Administration <span class="glyphicon glyphicon-wrench"></span></a></li>
			<li id="admin_menu_add"><a href='<s:url action="administration_executeAdd"/>'>Add <span class="glyphicon glyphicon-plus"></span></a></li>
			<li id="admin_menu_update"><a href='<s:url action="administration_executeUpdate"/>'>Update <span class="glyphicon glyphicon-pencil"></span></a></li>
			<li id="admin_menu_delete"><a href='<s:url action="administration_executeDelete"/>'>Delete <span class="glyphicon glyphicon-remove"></span></a></li>
			<li id="admin_menu_role"><a href='<s:url action="administration_executeRole"/>'>Changing Roles <span class="glyphicon glyphicon-cog"></span></a></li>
		</ul>
	</s:if>
</div>