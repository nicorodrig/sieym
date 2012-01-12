
<%@ page import="sieym.Producto" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="config">
		<g:set var="entityName" value="${message(code: 'producto.label', default: 'Producto')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-producto" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list producto" style="width: 90%;">
			
				<g:if test="${productoInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="producto.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${productoInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<li class="fieldcontain">
					<span id="composicion-label" class="property-label"><g:message code="producto.composicion.label" default="Composicion" /> </span>
						<span style="margin-left: 5px;" class="buttons"><g:link class="save" controller="componenteProducto" action="create" params="[productoId: productoInstance.id]"> Agregar</g:link></span>
					
							<g:render template="/componenteProducto/list"/>
					
				</li>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${productoInstance?.id}" />
					<g:link class="edit" action="edit" id="${productoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					<g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
