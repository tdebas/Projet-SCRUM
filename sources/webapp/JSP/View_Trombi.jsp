<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<s:include value="/JSP/layout/header.jsp" />

<s:if test="userEstConnecte">
	<s:include value="/JSP/layout/leftMenu.jsp" />
	<div class="col-md-10 content">
		<h2>Trombinoscope</h2>  		
		<div class="row">
			<s:iterator value="ListUtilisateur">
			<s:url action="utilisateur_profil" var="Utilisateur"><s:param name="idUser"><s:property value="idUtilisateur"/></s:param></s:url>
			  <div class="col-sm-6 col-md-3">
			    <div class="thumbnail">
			      <img src='<s:property value="chemin"/>' class="img-rounded">
			      <div class="caption">
			        <h4><s:property value="nom"/> <s:property value="prenom"/></h4>
			        <s:if test="sexe == 1">
			        	<p><a href="${Utilisateur}" class="btn btn-primary">See profil</a></p>
			        </s:if>
			        <s:else>
			        	<p><a href="${Utilisateur}" class="btn btn-warning">See profil</a></p>
			        </s:else>
			      </div>
			    </div>
			  </div>
			</s:iterator>
		</div>
	</div>
</s:if>
<s:else>
	<s:include value="/JSP/layout/authentification.jsp" />
</s:else>

<s:include value="/JSP/layout/footer.jsp" />