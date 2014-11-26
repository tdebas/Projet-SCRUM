<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<s:include value="/JSP/layout/header.jsp" />

<s:if test="userEstConnecte">
	<s:include value="/JSP/layout/leftMenu.jsp" />
	<div class="row">
		<s:iterator value="ListUtilisateur">
		  <div class="col-sm-6 col-md-2">
		    <div class="thumbnail">
		      <img data-src="${ CheminMedia }" alt="PhotoTrombi">
		      <div class="caption">
		        <h4 style="text-align:center;"><s:property value="nom"/> <s:property value="prenom"/></h4>
		        <p style="text-align:center;"><a href="#" class="btn btn-default" role="button">See profil</a></p>
		      </div>
		    </div>
		  </div>
		</s:iterator>
	</div>
</s:if>
<s:else>
	<s:include value="/JSP/layout/authentification.jsp" />
</s:else>

<s:include value="/JSP/layout/footer.jsp" />