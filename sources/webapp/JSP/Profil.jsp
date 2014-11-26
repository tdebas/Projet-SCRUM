<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<s:include value="/JSP/layout/header.jsp" />

<s:if test="userEstConnecte">
	<s:include value="/JSP/layout/leftMenu.jsp" />
	<div class="col-md-10 content">
		<h2><s:property value="utilisateur.nom"/> <s:property value="utilisateur.prenom"/></h2>  		
		
		
		<blockquote>
			<div class="jumbotron">
			<div class="row">
				<div class="form-group"><br/>
					<div class="col-sm-4">
						<img src='<s:property value="utilisateur.chemin"/>' class="img-circle" width="70%">
					</div>
			 		<div class="form-group">
			 			<div class="col-sm-6" style="margin-top: 30px;">
			 				<div class="form-group"><label style="width: 30%;">Surname</label><label> : <s:property value="utilisateur.nom"/></label></div>
						</div>
						<div class="col-sm-6">
							<div class="form-group"><label style="width: 30%;">Firstname</label><label>: <s:property value="utilisateur.prenom"/></label></div>
						</div>
			 			<div class="col-sm-6">
			 				<div class="form-group"><label style="width: 30%;">Mail</label><label> : <s:property value="utilisateur.mail"/></label></div>
						</div>
						<div class="col-sm-6">
			 				<div class="form-group"><label style="width: 30%;">Gender</label><label> : <s:property value="utilisateur.sexe" /></label></div>
						</div>
						<div class="col-sm-6">
			 				<div class="form-group"><label style="width: 30%;">Alternate</label><label>: <s:property value="utilisateur.estAlternant"/></label></div>
						</div>
						<div class="col-sm-6">
			 				<div class="form-group"><label style="width: 30%;">Moyenne des notes</label><label> : <s:property value="utilisateur.note"/></label></div>
						</div>
					</div>
				</div>
			</div>
			</div>
		</blockquote>
		
		<br/><br/>
		
		<h2>Others pictures of <s:property value="utilisateur.nom"/> <s:property value="utilisateur.prenom"/></h2>
		<blockquote>
			<div class="jumbotron">
				<div class="row">
					<s:iterator value="mediasList">
					  <div class="col-sm-6 col-md-3">
					    <div class="thumbnail">
					      
					      <s:if test="mediasList.size() == 0"><h2>No media found></h2></s:if>
					      
					      <img src='<s:property value="chemin"/>' class="img-rounded">
					      <div class="caption">
					        <!--  note -->
					      </div>
					    </div>
					  </div>
					</s:iterator>
				</div>
			</div>
		</blockquote>
	</div>
</s:if>
<s:else>
	<s:include value="/JSP/layout/authentification.jsp" />
</s:else>

<s:include value="/JSP/layout/footer.jsp" />