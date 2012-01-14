
<%@ page import="sieym.ItemPedido" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="pedidos">
		<g:set var="entityName" value="${message(code: 'itemPedido.label', default: 'Item')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-itemPedido" class="content scaffold-show" role="main">
			<div class="nav" role="navigation">
				<ul class="main">
					<li><g:link class="list" action="list" id="${params.pedidoId}"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
					<li><g:link class="create" action="create" id="${params.pedidoId}"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				</ul>
			</div>
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list itemPedido">
			
				<g:if test="${itemPedidoInstance?.producto}">
				<li class="fieldcontain">
					<span id="producto-label" class="property-label"><g:message code="itemPedido.producto.label" default="Producto" /></span>
					
						<span class="property-value" aria-labelledby="producto-label"><g:link controller="producto" action="show" id="${itemPedidoInstance?.producto?.id}">${itemPedidoInstance?.producto?.nombre}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${itemPedidoInstance?.paquete}">
				<li class="fieldcontain">
					<span id="paquete-label" class="property-label"><g:message code="itemPedido.paquete.label" default="Paquete" /></span>
					
						<span class="property-value" aria-labelledby="paquete-label"><g:link controller="paquete" action="show" id="${itemPedidoInstance?.paquete?.id}">${itemPedidoInstance?.paquete?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${itemPedidoInstance?.cantidad}">
				<li class="fieldcontain">
					<span id="cantidad-label" class="property-label"><g:message code="itemPedido.cantidad.label" default="Cantidad" /></span>
					
						<span class="property-value" aria-labelledby="cantidad-label"><g:fieldValue bean="${itemPedidoInstance}" field="cantidad"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${itemPedidoInstance?.id}" />
					<g:hiddenField name="pedidoId" value="${params.pedidoId}" />
					<g:link class="edit" action="edit" id="${itemPedidoInstance?.id}" params="${[pedidoId :params.pedidoId]}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
