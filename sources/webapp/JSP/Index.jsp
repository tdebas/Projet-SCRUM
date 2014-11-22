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
				<p class="navbar-text navbar-right"><h3>TEAM IT</h3></p>
			</div>
		</nav>
		<s:if test="userEstConnecte">
		<div class="row">
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
			<div class="col-md-9 content">
				<h2>Bonjour <s:property value="#session.utilisateur.prenom" /></h2>
				<s:actionmessage/>
			</div>
		</div>
		</s:if>
		<s:else>
			<div class="jumbotron connexion">
			  <div class="panel panel-primary">
				<div class="panel-heading"><h2>Authentification</h2></div>
					<div class="panel-body">
					  <s:form theme="simple" cssClass="form-horizontal" role="form" action="connexion_utilisateur" method="POST">
							<div class="form-group">
						    	<label for="Email" class="col-sm-2 control-label">Email</label>
					    		<div class="col-sm-6">
					      			<s:textfield cssClass="form-control" id="login" name="utilisateur.mail" placeholder="Email" />
					      		</div>
					      	</div>
				  			<div class="form-group">
				    			<label for="Password" class="col-sm-2 control-label">Password</label>
				    			<div class="col-sm-6">
				      				<s:password cssClass="form-control" id="mdp" name="utilisateur.password" placeholder="Password" />
				    			</div>
				  			</div>
				  			<div class="form-group">
				    			<div class="col-sm-offset-2 col-sm-6">
				      				<s:submit cssClass="btn btn-default" value="Connexion" />
				    			</div>
				  			</div>
						</s:form>
					 </div>
					 <s:actionerror/>
				</div>
			</div>
		</s:else>
		<div class="row">
			<div class="footer">
				<a>© Copyright - TEAM IT - Trombinoscope - 2014/2015</a>
			</div>
		</div>
	</body>
</html>