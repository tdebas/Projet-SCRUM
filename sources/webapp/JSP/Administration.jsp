<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
	
<s:include value="/JSP/layout/header.jsp" />
	
<s:if test="userEstConnecte & estAdmin">
	<div class="row">
		<s:include value="/JSP/layout/leftMenu.jsp" />
		<div class="col-md-9 content">
			<h2>Add User</h2>  			
  			 	<s:form theme="simple" cssClass="form-horizontal" role="form" action="administration_addUser" method="POST">
  			 		<div class="form-group">
	  			 		<label class="col-sm-2 control-label">Surname</label>
	  			 		<div class="col-sm-10">
	  			 			<s:textfield cssClass="form-control" id="nom" name="utilisateur.nom" />
	  			 		</div>
	  			 	</div>
  			 		<div class="form-group">
	  			 		<label class="col-sm-2 control-label">Firstname</label>
	  			 		<div class="col-sm-10">
	  			 			<s:textfield cssClass="form-control" id="nom" name="utilisateur.prenom" />
	  			 		</div>
  			 		</div>
  			 	</s:form>
		  	<h2>Manage User</h2>  	
		  		<p><!-- Contenu ..... --></p>
		</div>
	</div>
</s:if>
<s:else>
	<s:include value="/JSP/layout/authentification.jsp" />
</s:else>

<s:include value="/JSP/layout/footer.jsp" />