
<%@ page import="sieym.Paquete" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="config">
		<g:set var="entityName" value="${message(code: 'paquete.label', default: 'Paquete')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-paquete" class="content scaffold-list" role="main">
			<div class="nav" role="navigation">
				<ul>
					<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				</ul>
			</div>
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'paquete.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'paquete.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="capacidad" title="${message(code: 'paquete.capacidad.label', default: 'Capacidad (Tn)')}" />
					
						<g:sortableColumn property="tiempoArmado" title="${message(code: 'paquete.tiempoArmado.label', default: 'Tiempo de Armado (min)')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${paqueteInstanceList}" status="i" var="paqueteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${paqueteInstance.id}">${fieldValue(bean: paqueteInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: paqueteInstance, field: "descripcion")}</td>
					
						<td>${fieldValue(bean: paqueteInstance, field: "capacidad")}</td>
					
						<td>${fieldValue(bean: paqueteInstance, field: "tiempoArmado")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${paqueteInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
