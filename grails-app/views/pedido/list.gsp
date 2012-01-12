
<%@ page import="sieym.Pedido"%>
<%@ page import="sieym.EstadoPedido"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="pedidos">
<g:set var="entityName"
	value="${message(code: 'pedido.label', default: 'Pedido')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div id="list-pedido" class="content scaffold-list" role="main">
		<div class="nav" role="navigation">

			<g:form action="show" method="GET"
				style="display: inline; margin-right: 15px;">
				<span> <g:message code="pedido.id.label"
						default="ID de Pedido" />
				</span>
				<input type="text" id="id" />
				<button
					onclick="this.form.action = this.form.action + '/' + this.form.elements['id'].value; this.form.submit();">Seleccionar</button>
			</g:form>

			<g:if test="${params.chooseEstado}">
				<g:form action="list" method="GET" style="display: inline;">
					<span> <g:message code="pedido.id.label" default="Estado" />
					</span>
					<g:select name="estado" from="${EstadoPedido?.values()}"
						keys="${EstadoPedido.values()*.name()}" value="${params.estado}"
						onchange="this.form.submit();" noSelection="${['':'Todo...']}"/>
						<g:hiddenField name="chooseEstado" value="1"/>
				</g:form>
			</g:if>

		</div>
		<h1>
			<g:message code="default.list.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<table>
			<thead>
				<tr>

					<th><g:message code="pedido.id.label" default="ID Pedido" /></th>

					<th><g:message code="pedido.cliente.id.label"
							default="ID Cliente" /></th>

					<th><g:message code="pedido.producto.label" default="Nombre" /></th>

					<g:sortableColumn property="estado"
						title="${message(code: 'pedido.estado.label', default: 'Estado')}" />

					<g:sortableColumn property="fechaPedido"
						title="${message(code: 'pedido.fechaPedido.label', default: 'Fecha Pedido')}" />

					<g:if test="${estado}">
						<g:sortableColumn property="fechaEntrega"
							title="${message(code: 'pedido.fechaEntrega.label', default: 'Fecha Entrega')}" />
					</g:if>

				</tr>
			</thead>
			<tbody>
				<g:each in="${pedidoInstanceList}" status="i" var="pedidoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="show" id="${pedidoInstance.id}">
								${fieldValue(bean: pedidoInstance, field: "id")}
							</g:link></td>

						<td>
							${fieldValue(bean: pedidoInstance, field: "cliente.id")}
						</td>

						<td>
							${fieldValue(bean: pedidoInstance, field: "cliente.name")}
						</td>

						<td>
							${pedidoInstance.estado.name()}&nbsp;
							<g:if test="${params.chooseEstado
								&& pedidoInstance.estado != EstadoPedido.Rechazado
								&& pedidoInstance.estado != EstadoPedido.Entregado}">
								<g:link action="cambiarEstado" id="${pedidoInstance.id}">[cambiar]</g:link>
							</g:if>
							
						</td>

						<td><g:formatDate date="${pedidoInstance.fechaPedido}"
								format="dd/MM/yyyy" /></td>

						<g:if test="${estado}">
							<td><g:formatDate date="${pedidoInstance.fechaEntrega}"
									format="dd/MM/yyyy" /></td>
						</g:if>

					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${pedidoInstanceTotal}" />
		</div>
	</div>
</body>
</html>
