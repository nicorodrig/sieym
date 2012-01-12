
<%@ page import="sieym.Camion" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'camion.label', default: 'Camion')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav side" role="navigation">
			<ul>
				<li><a href="${createLink(uri: '/logistica')}"><g:message code="default.config.logistica.label"/></a></li>
				<li><a href="${createLink(uri: '/logistica')}"><g:message code="default.config.materiaprima.label"/></a></li>
				<li><a href="${createLink(uri: '/logistica')}"><g:message code="default.config.maquinas.label"/></a></li>
				<li><a href="${createLink(uri: '/logistica')}"><g:message code="default.config.fases.label"/></a></li>
			</ul>
		</div>
		<div id="show-camion" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list camion">
			
				<g:if test="${camionInstance?.patente}">
				<li class="fieldcontain">
					<span id="patente-label" class="property-label"><g:message code="camion.patente.label" default="Patente" /></span>
					
						<span class="property-value" aria-labelledby="patente-label"><g:fieldValue bean="${camionInstance}" field="patente"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${camionInstance?.marca}">
				<li class="fieldcontain">
					<span id="marca-label" class="property-label"><g:message code="camion.marca.label" default="Marca" /></span>
					
						<span class="property-value" aria-labelledby="marca-label"><g:fieldValue bean="${camionInstance}" field="marca"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${camionInstance?.modelo}">
				<li class="fieldcontain">
					<span id="modelo-label" class="property-label"><g:message code="camion.modelo.label" default="Modelo" /></span>
					
						<span class="property-value" aria-labelledby="modelo-label"><g:fieldValue bean="${camionInstance}" field="modelo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${camionInstance?.chofer}">
				<li class="fieldcontain">
					<span id="chofer-label" class="property-label"><g:message code="camion.chofer.label" default="Chofer" /></span>
					
						<span class="property-value" aria-labelledby="chofer-label"><g:fieldValue bean="${camionInstance}" field="chofer"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${camionInstance?.disponible}">
				<li class="fieldcontain">
					<span id="disponible-label" class="property-label"><g:message code="camion.disponible.label" default="Disponible" /></span>
					
						<span class="property-value" aria-labelledby="disponible-label"><g:formatBoolean boolean="${camionInstance?.disponible}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${camionInstance?.id}" />
					<g:link class="edit" action="edit" id="${camionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					<g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
