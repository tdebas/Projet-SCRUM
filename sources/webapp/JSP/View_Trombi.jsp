<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>

<s:if test="userEstConnecte">
	<s:include value="/JSP/layout/header.jsp" />
	
	

<div class="row">
	<s:iterator value="ListUtilisateur">
	  <div class="col-sm-6 col-md-4">
	    <div class="thumbnail">
	      <img data-src="${ CheminMedia }" alt="PhotoTrombi">
	      <div class="caption">
	        <h3><s:property value="nom"/></h3>
	        <br>
	        <h3><s:property value="prenom"/></h3>
	        <p></p>
	        <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
	      </div>
	    </div>
	  </div>
	</s:iterator>
</div>
        
        <s:include value="/JSP/layout/footer.jsp" />
</s:if>
<s:else>
	<s:include value="/JSP/layout/authentification.jsp" />
</s:else>