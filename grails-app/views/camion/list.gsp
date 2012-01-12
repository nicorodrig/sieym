
<%@ page import="sieym.Camion" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'camion.label', default: 'Camion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
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
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-camion" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="patente" title="${message(code: 'camion.patente.label', default: 'Patente')}" />
					
						<g:sortableColumn property="marca" title="${message(code: 'camion.marca.label', default: 'Marca')}" />
					
						<g:sortableColumn property="modelo" title="${message(code: 'camion.modelo.label', default: 'Modelo')}" />
					
						<g:sortableColumn property="chofer" title="${message(code: 'camion.chofer.label', default: 'Chofer')}" />
					
						<g:sortableColumn property="disponible" title="${message(code: 'camion.disponible.label', default: 'Disponible')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${camionInstanceList}" status="i" var="camionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${camionInstance.id}">${fieldValue(bean: camionInstance, field: "patente")}</g:link></td>
					
						<td>${fieldValue(bean: camionInstance, field: "marca")}</td>
					
						<td>${fieldValue(bean: camionInstance, field: "modelo")}</td>
					
						<td>${fieldValue(bean: camionInstance, field: "chofer")}</td>
					
						<td><g:formatBoolean boolean="${camionInstance.disponible}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${camionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
