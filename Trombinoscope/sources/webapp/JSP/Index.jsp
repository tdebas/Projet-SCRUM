<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
				
		<link rel="stylesheet" href="../CSS/bootstrap.css" type="text/css" />
		<link rel="stylesheet" href="../CSS/bootstrap-theme.css" type="text/css" />
		<link rel="stylesheet" href="../CSS/style.css" type="text/css" />
		
		<script type="text/javascript" src="../JS/bootstrap.js"></script>
		<script type="text/javascript" src="../JS/bootstrap.min.js"></script>
		<script type="text/javascript" src="../JS/jquery-1.9.min.js"></script>
		<script type="text/javascript" src="../JS/jquery.easing.min.js"></script>
		
		<title>Trombinoscope</title>
	</head>

	<body class="body">
		<nav class="navbar navbar-default navbar-static-top" role="navigation">
			<div class="container">
				<p class="navbar-text navbar-right"><h3>TEAM IT : <small>Authentification</small></h3></p>
			</div>
		</nav>

		<div class="jumbotron">
		  <div class="panel panel-primary">
			<div class="panel-heading"><h2>Authentification</h2></div>
				<div class="panel-body">
				  
				  <s:form theme="simple" cssClass="form-horizontal" role="form" action="connexion_utilisateur" method="POST">
						<div class="form-group">
					    	<label for="Email" class="col-sm-2 control-label">Email</label>
				    		<div class="col-sm-6">
				      			<s:textfield cssClass="form-control" id="login" name="Utilisateur.mail" placeholder="Email" />
				      		</div>
				      	</div>
			  			<div class="form-group">
			    			<label for="Password" class="col-sm-2 control-label">Password</label>
			    			<div class="col-sm-6">
			      				<s:password cssClass="form-control" id="mdp" name="Utilisateur.password" placeholder="Password" />
			    			</div>
			  			</div>
			  			<div class="form-group">
			    			<div class="col-sm-offset-2 col-sm-6">
			      				<s:submit cssClass="btn btn-default" value="Connexion" />
			    			</div>
			  			</div>
					</s:form>
				 </div>
			</div>
		</div>
	</body>
</html>