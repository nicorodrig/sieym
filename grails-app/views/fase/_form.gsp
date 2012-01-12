<%@ page import="sieym.TipoFase"%>
<%@ page import="sieym.Fase" %>



<div class="fieldcontain ${hasErrors(bean: faseInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="fase.nombre.label" default="Nombre" />
		
	</label>
	<g:select name="nombre" from="${TipoFase.values()*.name()}" value="${faseInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: faseInstance, field: 'duracion', 'error')} required">
	<label for="duracion">
		<g:message code="fase.duracion.label" default="Duracion" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="duracion" required="" value="${fieldValue(bean: faseInstance, field: 'duracion')}"/>
</div>

