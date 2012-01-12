
<%@ page import="sieym.MateriaPrima"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="config">
<g:set var="entityName"
	value="${message(code: 'materiaPrima.label', default: 'MateriaPrima')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div id="show-materiaPrima" class="content scaffold-show" role="main">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<ol class="property-list materiaPrima">

			<g:if test="${materiaPrimaInstance?.descripcion}">
				<li class="fieldcontain"><span id="descripcion-label"
					class="property-label"><g:message
							code="materiaPrima.descripcion.label" default="Descripcion" /></span> <span
					class="property-value" aria-labelledby="descripcion-label"><g:fieldValue
							bean="${materiaPrimaInstance}" field="descripcion" /></span></li>
			</g:if>

			<g:if test="${materiaPrimaInstance?.nombre}">
				<li class="fieldcontain"><span id="nombre-label"
					class="property-label"><g:message
							code="materiaPrima.nombre.label" default="Nombre" /></span> <span
					class="property-value" aria-labelledby="nombre-label"><g:fieldValue
							bean="${materiaPrimaInstance}" field="nombre" /></span></li>
			</g:if>

			<h4 style="margin-top: 12px;">
				<g:message code="materiaPrima.coeficienteProduccion.label"
					default="Coeficiente de Produccion" />
			</h4>

			<g:each in="${materiaPrimaInstance.coeficienteProduccion}" var="coef" status="i">
				<li class="fieldcontain"><span id="coeficienteProduccion${i}-label"
					class="property-label">${coef.key}:</span> <span
					class="property-value"
					aria-labelledby="coeficienteProduccion${i}-label">${coef.value}
				</span></li>
			</g:each>

		</ol>
		<g:form>
			<fieldset class="buttons">
				<g:hiddenField name="id" value="${materiaPrimaInstance?.id}" />
				<g:link class="edit" action="edit" id="${materiaPrimaInstance?.id}">
					<g:message code="default.button.edit.label" default="Edit" />
				</g:link>
				<g:actionSubmit class="delete" action="delete"
					value="${message(code: 'default.button.delete.label', default: 'Delete')}"
					onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				<g:link class="list" action="list">
					<g:message code="default.list.label" args="[entityName]" />
				</g:link>
			</fieldset>
		</g:form>
	</div>
</body>
</html>
