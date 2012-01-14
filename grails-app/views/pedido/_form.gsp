<%@ page import="sieym.Pedido" %>
<%@ page import="sieym.Paquete" %>
<%@ page import="sieym.User" %>



<div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'cliente', 'error')} required">
	<label for="cliente">
		<g:message code="pedido.cliente.label" default="Cliente" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="cliente.id" from="${User.list()}" required="" value="${pedidoInstance?.cliente?.id}" optionKey="id" optionValue="name"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'direccionEntrega', 'error')} ">
	<label for="direccionEntrega">
		<g:message code="pedido.direccionEntrega.label" default="Direccion Entrega" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="direccionEntrega" required="" value="${pedidoInstance?.direccionEntrega}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'recibirAvisos', 'error')} ">
	<label for="recibirAvisos">
		<g:message code="pedido.recibirAvisos.label" default="Recibir Avisos" />
		
	</label>
	<g:checkBox name="recibirAvisos" value="${pedidoInstance?.recibirAvisos}" />
</div>



