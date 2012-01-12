<%@ page import="sieym.Logistica" %>




<div class="fieldcontain ${hasErrors(bean: logisticaInstance, field: 'precioPorKm', 'error')} required">
	<label for="precioPorKm">
		<g:message code="logistica.precioPorKm.label" default="Precio Por Km" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" step="0.1" name="precioPorKm" required="" value="${fieldValue(bean: logisticaInstance, field: 'precioPorKm')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: logisticaInstance, field: 'tiempoPorKm', 'error')} required">
	<label for="tiempoPorKm">
		<g:message code="logistica.tiempoPorKm.label" default="Tiempo Por Km" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" step="0.1" name="tiempoPorKm" required="" value="${fieldValue(bean: logisticaInstance, field: 'tiempoPorKm')}"/>
</div>

<div class="fieldcontain">
	<label for="camiones">
		<g:message code="logistica.camiones.label" default="Camiones" />
		
	</label>
	<g:link controller="camion" action="list">Administrar</g:link>
</div>
