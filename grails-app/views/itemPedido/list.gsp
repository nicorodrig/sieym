
<%@ page import="sieym.ItemPedido" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="pedidos">
		<g:set var="entityName" value="${message(code: 'itemPedido.label', default: 'Item')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-itemPedido" class="content scaffold-list" role="main">
			<div class="nav" role="navigation">
				<ul class="main">
					<li><g:link class="create" action="create" id="${params.id}"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
					<li><g:link class="home" controller="pedido" action="show" id="${params.id}">Volver al Pedido</g:link></li>
				</ul>
			</div>
			<h1><g:message code="default.list.label" args="[entityName]" />s del Pedido ${params.id}</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="producto.nombre" title="${message(code: 'itemPedido.producto.nombre.label', default: 'Producto')}" />
					
						<th><g:message code="itemPedido.paquete.label" default="Paquete" /></th>
					
						<g:sortableColumn property="cantidad" title="${message(code: 'itemPedido.cantidad.label', default: 'Cantidad')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${itemPedidoInstanceList}" status="i" var="itemPedidoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${itemPedidoInstance.id}" params="${[pedidoId: params.id]}">${fieldValue(bean: itemPedidoInstance, field: "producto.nombre")}</g:link></td>
					
						<td>${fieldValue(bean: itemPedidoInstance, field: "paquete")}</td>
					
						<td>${fieldValue(bean: itemPedidoInstance, field: "cantidad")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${itemPedidoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
