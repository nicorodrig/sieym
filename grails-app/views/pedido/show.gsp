
<%@page import="sieym.EstadoPedido"%>
<%@ page import="sieym.Pedido"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="pedidos">
<g:set var="entityName"
	value="${message(code: 'pedido.label', default: 'Pedido')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>

</head>
<body>
	<div id="show-pedido" class="content scaffold-show" role="main">
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="list">
						<g:message code="default.list.label" args="[entityName]" />
					</g:link></li>
			</ul>
		</div>
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<ol class="property-list pedido">

			<g:if test="${pedidoInstance?.cliente}">
				<li class="fieldcontain"><span id="cliente-label"
					class="property-label"><g:message
							code="pedido.cliente.label" default="Cliente" /></span> <span
					class="property-value" aria-labelledby="cliente-label"><g:link
							controller="user" action="show"
							id="${pedidoInstance?.cliente?.id}">
							${pedidoInstance?.cliente?.email?.encodeAsHTML()}
						</g:link></span></li>
			</g:if>

			<g:if test="${pedidoInstance?.estado}">
				<li class="fieldcontain"><span id="estado-label"
					class="property-label"><g:message code="pedido.estado.label"
							default="Estado" /></span> <span class="property-value"
					aria-labelledby="estado-label"><g:fieldValue
							bean="${pedidoInstance}" field="estado" /></span></li>
			</g:if>

			<g:if test="${pedidoInstance?.motivoRechazo}">
				<li class="fieldcontain"><span id="motivoRechazo-label"
					class="property-label"><g:message
							code="pedido.motivoRechazo.label" default="Motivo de Rechazo" /></span>
					<span class="property-value" aria-labelledby="estado-label"><g:fieldValue
							bean="${pedidoInstance}" field="motivoRechazo" /></span></li>
			</g:if>

			<g:if test="${pedidoInstance?.motivoCancelado}">
				<li class="fieldcontain"><span id="motivoCancelado-label"
					class="property-label"><g:message
							code="pedido.motivoCancelado.label"
							default="Motivo de Cancelación" /></span> <span class="property-value"
					aria-labelledby="estado-label"><g:fieldValue
							bean="${pedidoInstance}" field="motivoCancelado" /></span></li>
			</g:if>

			<g:if test="${pedidoInstance?.direccionEntrega}">
				<li class="fieldcontain"><span id="direccionEntrega-label"
					class="property-label"><g:message
							code="pedido.direccionEntrega.label" default="Direccion Entrega" /></span>

					<span class="property-value"
					aria-labelledby="direccionEntrega-label"><g:fieldValue
							bean="${pedidoInstance}" field="direccionEntrega" /></span></li>
			</g:if>

			<g:if test="${pedidoInstance?.fechaPedido}">
				<li class="fieldcontain"><span id="fechaPedido-label"
					class="property-label"><g:message
							code="pedido.fechaPedido.label" default="Fecha Pedido" /></span> <span
					class="property-value" aria-labelledby="fechaPedido-label"><g:formatDate
							date="${pedidoInstance?.fechaPedido}" format="dd/MM/yyyy" /></span></li>
			</g:if>

			<g:if test="${pedidoInstance?.fechaEntrega}">
				<li class="fieldcontain"><span id="fechaEntrega-label"
					class="property-label"><g:message
							code="pedido.fechaEntrega.label" default="Fecha Entrega" /></span> <span
					class="property-value" aria-labelledby="fechaEntrega-label"><g:formatDate
							date="${pedidoInstance?.fechaEntrega}" format="dd/MM/yyyy" /></span></li>
			</g:if>

			<g:if test="${pedidoInstance?.seña}">
				<li class="fieldcontain"><span id="seña-label"
					class="property-label"><g:message code="pedido.seña.label"
							default="Seña" /></span> <span class="property-value"
					aria-labelledby="seña-label">$<g:fieldValue
							bean="${pedidoInstance}" field="seña" /></span></li>
			</g:if>

			<li class="fieldcontain"><span id="items-label"
				class="property-label"><g:message code="pedido.items.label"
						default="Items" /></span> <span class="property-value"
				aria-labelledby="items-label"> ${pedidoInstance.items.size()} <g:link
						controller="itemPedido" action="list" id="${pedidoInstance.id}"> [Modificar]</g:link> </span></li>

			<li class="fieldcontain"><span id="recibirAvisos-label"
				class="property-label"><g:message
						code="pedido.recibirAvisos.label" default="Recibir Avisos" /></span> <span
				class="property-value" aria-labelledby="recibirAvisos-label"><g:formatBoolean
						boolean="${pedidoInstance?.recibirAvisos}" /></span></li>

		</ol>
		<g:render template="buttons${pedidoInstance?.estado}" />
	</div>
</body>
</html>
