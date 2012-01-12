<%@ page import="sieym.Maquina" %>



<div class="fieldcontain ${hasErrors(bean: maquinaInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="maquina.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${maquinaInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: maquinaInstance, field: 'fase', 'error')} required">
	<label for="tipo">
		<g:message code="maquina.fase.label" default="Fase" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="fase.id" from="${sieym.Fase.list()}" required="" optionKey="id" optionValue="nombre" />
</div>

<div class="fieldcontain ${hasErrors(bean: maquinaInstance, field: 'capacidad', 'error')} required">
	<label for="capacidad">
		<g:message code="maquina.capacidad.label" default="Capacidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="capacidad" required="" value="${fieldValue(bean: maquinaInstance, field: 'capacidad')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: maquinaInstance, field: 'rendimiento', 'error')} required">
	<label for="rendimiento">
		<g:message code="maquina.rendimiento.label" default="Rendimiento" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="rendimiento" required="" value="${fieldValue(bean: maquinaInstance, field: 'rendimiento')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: maquinaInstance, field: 'temperatura', 'error')} required">
	<label for="temperatura">
		<g:message code="maquina.temperatura.label" default="Temperatura" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="temperatura" required="" value="${fieldValue(bean: maquinaInstance, field: 'temperatura')}"/>
</div>

