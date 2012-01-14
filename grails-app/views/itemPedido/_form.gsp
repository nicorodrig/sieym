<%@ page import="sieym.ItemPedido"%>

<div
	class="fieldcontain ${hasErrors(bean: itemPedidoInstance, field: 'producto', 'error')} required">
	<label for="producto"> <g:message
			code="itemPedido.producto.label" default="Producto" /> <span
		class="required-indicator">*</span>
	</label>
	<g:select id="producto" name="producto.id"
		from="${sieym.Producto.list()}" optionKey="id" optionValue="nombre"
		required="" class="many-to-one" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: itemPedidoInstance, field: 'paquete', 'error')} required">
	<label for="paquete"> <g:message
			code="itemPedido.paquete.label" default="Paquete" /> <span
		class="required-indicator">*</span>
	</label>
	<g:select id="paquete" name="paquete.id" from="${sieym.Paquete.list()}"
		optionKey="id" required="" value="${itemPedidoInstance?.paquete?.id}"
		class="many-to-one" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: itemPedidoInstance, field: 'cantidad', 'error')} required">
	<label for="cantidad"> <g:message
			code="itemPedido.cantidad.label" default="Cantidad" /> <span
		class="required-indicator">*</span>
	</label>
	<g:field type="number" name="cantidad" required=""
		value="${fieldValue(bean: itemPedidoInstance, field: 'cantidad')}" />
</div>
