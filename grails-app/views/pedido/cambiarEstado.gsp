<%@ page import="sieym.Pedido"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="pedidos">
<g:set var="entityName"
	value="${message(code: 'pedido.label', default: 'Pedido')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
<g:javascript>
$('document').ready(function() {
	$('#estado').change(function() {
		if($('#estado').val() == 'Cancelado') {
			$('#motivoDiv').slideDown();
		} else {
			$('#motivoDiv').slideUp();
		}
	})
})
</g:javascript>
</head>
<body>
	<div id="edit-pedido" class="content scaffold-edit" role="main">
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="list">
						<g:message code="default.list.label" args="[entityName]" />
					</g:link></li>
			</ul>
		</div>
		<h1>Modificar Estado</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${pedidoInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${pedidoInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<g:form method="post">
			<g:hiddenField name="id" value="${pedidoInstance?.id}" />
			<g:hiddenField name="version" value="${pedidoInstance?.version}" />
			<fieldset class="form">

				<div
					class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'estado', 'error')} required">
					<label for="estado"> <g:message code="pedido.estado.label"
							default="Estado" /> <span class="required-indicator">*</span>
					</label>
					<g:set var="values" value="${sieym.EstadoPedido.valuesFor(pedidoInstance?.estado)}" />
					<g:select name="estado" from="${values}"
						keys="${values*.name()}" required=""
						value="${pedidoInstance?.estado?.name()}" />
				</div>

				<div id="motivoDiv" style="display: none;"
					class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'motivoCancelado', 'error')} required">
					<label for="motivoCancelado"> <g:message code="pedido.motivoCancelado.label"
							default="Motivo" /> <span class="required-indicator">*</span>
					</label>
					<g:textArea name="motivoCancelado"></g:textArea>
				</div>

			</fieldset>
			<fieldset class="buttons">
				<g:actionSubmit class="save" action="update"
					value="${message(code: 'default.button.update.label', default: 'Update')}" />
				<g:link class="cancel" onclick="history.back();">
					<g:message code="default.button.back.label" />
				</g:link>
			</fieldset>
		</g:form>
	</div>
</body>
</html>
