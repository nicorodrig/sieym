
<%@ page import="sieym.Maquina" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="config">
		<g:set var="entityName" value="${message(code: 'maquina.label', default: 'Maquina')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-maquina" class="content scaffold-list" role="main">
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
					
						<g:sortableColumn property="descripcion" title="${message(code: 'maquina.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="fase" title="${message(code: 'maquina.fase.label', default: 'Fase')}" />
					
						<g:sortableColumn property="capacidad" title="${message(code: 'maquina.capacidad.label', default: 'Capacidad')}" />
					
						<g:sortableColumn property="rendimiento" title="${message(code: 'maquina.rendimiento.label', default: 'Rendimiento')}" />
					
						<g:sortableColumn property="temperatura" title="${message(code: 'maquina.temperatura.label', default: 'Temperatura')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${maquinaInstanceList}" status="i" var="maquinaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${maquinaInstance.id}">${fieldValue(bean: maquinaInstance, field: "descripcion")}</g:link></td>
					
						<td>${fieldValue(bean: maquinaInstance, field: "fase.nombre")}</td>
					
						<td>${fieldValue(bean: maquinaInstance, field: "capacidad")}</td>
					
						<td>${fieldValue(bean: maquinaInstance, field: "rendimiento")}</td>
					
						<td>${fieldValue(bean: maquinaInstance, field: "temperatura")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${maquinaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
