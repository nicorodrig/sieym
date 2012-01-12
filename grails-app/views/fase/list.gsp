
<%@ page import="sieym.Fase" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="config">
		<g:set var="entityName" value="${message(code: 'fase.label', default: 'Fase')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-fase" class="content scaffold-list" role="main">
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
					
						<g:sortableColumn property="nombre" title="${message(code: 'fase.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="duracion" title="${message(code: 'fase.duracion.label', default: 'Duracion (hs)')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${faseInstanceList}" status="i" var="faseInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${faseInstance.id}">${fieldValue(bean: faseInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: faseInstance, field: "duracion")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${faseInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
