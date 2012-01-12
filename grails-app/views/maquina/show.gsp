
<%@ page import="sieym.Maquina" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="config">
		<g:set var="entityName" value="${message(code: 'maquina.label', default: 'Maquina')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-maquina" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list maquina">
			
				<g:if test="${maquinaInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="maquina.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${maquinaInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${maquinaInstance?.fase}">
				<li class="fieldcontain">
					<span id="fase-label" class="property-label"><g:message code="maquina.fase.label" default="Fase" /></span>
					
						<span class="property-value" aria-labelledby="fase-label"><g:fieldValue bean="${maquinaInstance}" field="fase.nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${maquinaInstance?.capacidad}">
				<li class="fieldcontain">
					<span id="capacidad-label" class="property-label"><g:message code="maquina.capacidad.label" default="Capacidad" /></span>
					
						<span class="property-value" aria-labelledby="capacidad-label"><g:fieldValue bean="${maquinaInstance}" field="capacidad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${maquinaInstance?.rendimiento}">
				<li class="fieldcontain">
					<span id="rendimiento-label" class="property-label"><g:message code="maquina.rendimiento.label" default="Rendimiento" /></span>
					
						<span class="property-value" aria-labelledby="rendimiento-label"><g:fieldValue bean="${maquinaInstance}" field="rendimiento"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${maquinaInstance?.temperatura}">
				<li class="fieldcontain">
					<span id="temperatura-label" class="property-label"><g:message code="maquina.temperatura.label" default="Temperatura" /></span>
					
						<span class="property-value" aria-labelledby="temperatura-label"><g:fieldValue bean="${maquinaInstance}" field="temperatura"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${maquinaInstance?.id}" />
					<g:link class="edit" action="edit" id="${maquinaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
