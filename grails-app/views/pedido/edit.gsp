<%@ page import="sieym.Pedido" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="pedidos">
		<g:set var="entityName" value="${message(code: 'pedido.label', default: 'Pedido')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="edit-pedido" class="content scaffold-edit" role="main">
			<div class="nav" role="navigation">
				<ul>
					<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				</ul>
			</div>
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${pedidoInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${pedidoInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${pedidoInstance?.id}" />
				<g:hiddenField name="version" value="${pedidoInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
					
					<div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'estado', 'error')} required">
						<label for="estado">
							<g:message code="pedido.estado.label" default="Estado" />
							<span class="required-indicator">*</span>
						</label>
						<g:select name="estado" from="${sieym.EstadoPedido?.values()}" keys="${sieym.EstadoPedido.values()*.name()}" required="" value="${pedidoInstance?.estado?.name()}"/>
					</div>
					
					<div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'fechaEntrega', 'error')} required">
						<label for="fechaEntrega">
							<g:message code="pedido.fechaEntrega.label" default="Fecha Entrega" />
							<span class="required-indicator">*</span>
						</label>
						<g:datePicker name="fechaEntrega" precision="day"  value="${pedidoInstance?.fechaEntrega}"  />
					</div>
					
					<div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'seña', 'error')} required">
						<label for="seña">
							<g:message code="pedido.seña.label" default="Seña" />
						</label>
						<g:field type="number" name="seña" value="${fieldValue(bean: pedidoInstance, field: 'seña')}"/>
					</div>

				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
