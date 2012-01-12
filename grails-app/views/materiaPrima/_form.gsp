<%@ page import="sieym.MateriaPrima"%>



<div
	class="fieldcontain ${hasErrors(bean: materiaPrimaInstance, field: 'nombre', 'error')} ">
	<label for="nombre"> <g:message
			code="materiaPrima.nombre.label" default="Nombre" />

	</label>
	<g:textField name="nombre" value="${materiaPrimaInstance?.nombre}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: materiaPrimaInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion"> <g:message
			code="materiaPrima.descripcion.label" default="Descripcion" />

	</label>
	<g:textField name="descripcion"
		value="${materiaPrimaInstance?.descripcion}" />
</div>

<h4 style="margin-top: 12px;">
	<g:message code="materiaPrima.coeficienteProduccion.label"
		default="Coeficiente de Produccion" />
</h4>

<g:each in="${sieym.Fase.list()}" var="fase" status="i">
	<div
		class="fieldcontain ${hasErrors(bean: materiaPrimaInstance, field: 'coeficienteProduccion', 'error')} ">
<%--		<g:hiddenField name="coeficienteProduccion[${fase.nombre}].fase.id" value="${fase.id}" />--%>
		<label for="coeficienteProduccion[${fase.nombre}]">
			${fase.nombre}:
		</label>
		<g:field type="number" step="0.1" name="coeficienteProduccion[${fase.nombre}]" required=""
			value="${materiaPrimaInstance.coeficienteProduccion[fase.nombre]}" />
	</div>
</g:each>

