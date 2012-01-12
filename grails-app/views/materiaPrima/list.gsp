
<%@ page import="sieym.MateriaPrima" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="config">
		<g:set var="entityName" value="${message(code: 'materiaPrima.label', default: 'MateriaPrima')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-materiaPrima" class="content scaffold-list" role="main">
			<div class="nav" role="navigation">
				<ul class="main">
					<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
					<li><g:link class="list" controller="producto" action="list"><g:message code="default.list.label" args="['Producto']" /></g:link></li>
				</ul>
			</div>
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'materiaPrima.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'materiaPrima.descripcion.label', default: 'Descripcion')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${materiaPrimaInstanceList}" status="i" var="materiaPrimaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${materiaPrimaInstance.id}">${fieldValue(bean: materiaPrimaInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: materiaPrimaInstance, field: "descripcion")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${materiaPrimaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
