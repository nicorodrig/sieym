
<%@ page import="sieym.Paquete" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="config">
		<g:set var="entityName" value="${message(code: 'paquete.label', default: 'Paquete')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-paquete" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list paquete">
			
				<g:if test="${paqueteInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="paquete.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${paqueteInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${paqueteInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="paquete.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${paqueteInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${paqueteInstance?.capacidad}">
				<li class="fieldcontain">
					<span id="capacidad-label" class="property-label"><g:message code="paquete.capacidad.label" default="Capacidad" /></span>
					
						<span class="property-value" aria-labelledby="capacidad-label"><g:fieldValue bean="${paqueteInstance}" field="capacidad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${paqueteInstance?.tiempoArmado}">
				<li class="fieldcontain">
					<span id="tiempoArmado-label" class="property-label"><g:message code="paquete.tiempoArmado.label" default="Tiempo de Armado" /></span>
					
						<span class="property-value" aria-labelledby="tiempoArmado-label"><g:fieldValue bean="${paqueteInstance}" field="tiempoArmado"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${paqueteInstance?.id}" />
					<g:link class="edit" action="edit" id="${paqueteInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
