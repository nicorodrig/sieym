<%@ page import="sieym.Paquete" %>



<div class="fieldcontain ${hasErrors(bean: paqueteInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="paquete.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${paqueteInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: paqueteInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="paquete.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${paqueteInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: paqueteInstance, field: 'capacidad', 'error')} required">
	<label for="capacidad">
		<g:message code="paquete.capacidad.label" default="Capacidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="capacidad" required="" value="${fieldValue(bean: paqueteInstance, field: 'capacidad')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: paqueteInstance, field: 'tiempoArmado', 'error')} required">
	<label for="tiempoArmado">
		<g:message code="paquete.tiempoArmado.label" default="Tiempo de Armado" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="tiempoArmado" required="" value="${fieldValue(bean: paqueteInstance, field: 'tiempoArmado')}"/>
</div>

