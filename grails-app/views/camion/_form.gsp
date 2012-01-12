<%@ page import="sieym.Camion" %>



<div class="fieldcontain ${hasErrors(bean: camionInstance, field: 'patente', 'error')} ">
	<label for="patente">
		<g:message code="camion.patente.label" default="Patente" />
		
	</label>
	<g:textField name="patente" value="${camionInstance?.patente}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: camionInstance, field: 'marca', 'error')} ">
	<label for="marca">
		<g:message code="camion.marca.label" default="Marca" />
		
	</label>
	<g:textField name="marca" value="${camionInstance?.marca}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: camionInstance, field: 'modelo', 'error')} ">
	<label for="modelo">
		<g:message code="camion.modelo.label" default="Modelo" />
		
	</label>
	<g:textField name="modelo" value="${camionInstance?.modelo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: camionInstance, field: 'chofer', 'error')} ">
	<label for="chofer">
		<g:message code="camion.chofer.label" default="Chofer" />
		
	</label>
	<g:textField name="chofer" value="${camionInstance?.chofer}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: camionInstance, field: 'disponible', 'error')} ">
	<label for="disponible">
		<g:message code="camion.disponible.label" default="Disponible" />
		
	</label>
	<g:checkBox name="disponible" value="${camionInstance?.disponible}" />
</div>

