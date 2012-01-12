
<%@ page import="sieym.ComponenteProducto" %>
<div id="list-componenteProducto" class="content scaffold-list" role="main">
	<table>
		<thead>
			<tr>
			
				<th><g:message code="componenteProducto.materiaPrima.label" default="Materia Prima" /></th>
			
				<g:sortableColumn property="porcentaje" title="${message(code: 'componenteProducto.porcentaje.label', default: 'Porcentaje')}" />
			
				<th><g:message code="default.button.delete.label" /></th>
			</tr>
		</thead>
		<tbody>
		<g:each in="${productoInstance.composicion}" status="i" var="componenteProductoInstance">
			<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
			
				<td><g:link controller="componenteProducto" action="edit" id="${componenteProductoInstance.id}" params="[productoId: productoInstance.id]">${fieldValue(bean: componenteProductoInstance, field: "materiaPrima")}</g:link></td>
			
				<td>${fieldValue(bean: componenteProductoInstance, field: "porcentaje")}</td>
			
				<td><g:link controller="componenteProducto" action="delete" id="${componenteProductoInstance.id}" params="[productoId: productoInstance.id]"><img alt="Eliminar" src="${resource(dir: 'images/skin', file:'database_delete.png')}" /></g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
</div>