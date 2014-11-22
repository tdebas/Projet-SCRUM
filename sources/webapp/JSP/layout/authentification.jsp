<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

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