<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
				
		<link rel="stylesheet" href="http://localhost:8080/trombi/CSS/bootstrap.css" type="text/css" />
		<link rel="stylesheet" href="http://localhost:8080/trombi/CSS/bootstrap-theme.css" type="text/css" />
		<link rel="stylesheet" href="http://localhost:8080/trombi/CSS/style.css" type="text/css" />
		
		<script type="text/javascript" src="http://localhost:8080/trombi/JS/bootstrap.js"></script>
		<script type="text/javascript" src="http://localhost:8080/trombi/JS/bootstrap.min.js"></script>
		<script type="text/javascript" src="http://localhost:8080/trombi/JS/jquery-1.9.min.js"></script>
		<script type="text/javascript" src="http://localhost:8080/trombi/JS/jquery.easing.min.js"></script>
		
		<title>Trombinoscope</title>
	</head>

	<body>
		<nav class="navbar navbar-default navbar-static-top" role="navigation">
			<div class="container-fluid">
				<p class="navbar-text navbar-right">Hello <s:property value="#session.utilisateur.prenom" /></p>
				<p class="navbar-text navbar-left"><h3>TEAM IT </h3></p>
			</div>
		</nav>