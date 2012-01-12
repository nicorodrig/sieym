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

<div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'producto', 'error')} required">
	<label for="producto">
		<g:message code="pedido.producto.label" default="Producto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="producto" name="producto.id" from="${sieym.Producto.list()}" optionKey="id" optionValue="nombre" required="" value="${pedidoInstance?.producto?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'paquete', 'error')} required">
	<label for="paquete">
		<g:message code="pedido.paquete.label" default="Paquete" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="paquete.id" from="${Paquete.list()}" required="" value="${pedidoInstance?.paquete?.id}" optionKey="id"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'cantidad', 'error')} required">
	<label for="cantidad">
		<g:message code="pedido.cantidad.label" default="Cantidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" step="0.1" name="cantidad" required="" value="${fieldValue(bean: pedidoInstance, field: 'cantidad')}"/>
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



