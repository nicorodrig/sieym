<%@ page import="sieym.ComponenteProducto" %>



<div class="fieldcontain ${hasErrors(bean: componenteProductoInstance, field: 'materiaPrima', 'error')} required">
	<label for="materiaPrima">
		<g:message code="componenteProducto.materiaPrima.label" default="Materia Prima" />
	</label>
	<g:select id="materiaPrima" name="materiaPrima.id" from="${sieym.MateriaPrima.list()}" optionKey="id" required="" value="${componenteProductoInstance?.materiaPrima?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: componenteProductoInstance, field: 'porcentaje', 'error')} required">
	<label for="porcentaje">
		<g:message code="componenteProducto.porcentaje.label" default="Porcentaje" />
	</label>
	<g:field type="number" name="porcentaje" required="" value="${fieldValue(bean: componenteProductoInstance, field: 'porcentaje')}"/>
</div>

<g:hiddenField name="productoId" value="${productoId}"/>

