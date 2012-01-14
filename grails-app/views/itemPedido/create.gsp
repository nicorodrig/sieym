<%@ page import="sieym.ItemPedido"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="pedidos">
<g:set var="entityName"
	value="${message(code: 'itemPedido.label', default: 'Item')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
</head>
<body>
	<div id="create-itemPedido" class="content scaffold-create" role="main">
		<h1>
			<g:message code="default.create.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${itemPedidoInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${itemPedidoInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<g:form action="save">
			<g:hiddenField name="pedidoId" value="${params.id}" />

			<fieldset class="form">
				<g:render template="form" />
			</fieldset>
			<fieldset class="buttons">
				<g:submitButton name="create" class="save"
					value="${message(code: 'default.button.create.label', default: 'Create')}" />
				<g:link class="cancel" onclick="history.back();">
					<g:message code="default.button.back.label" />
				</g:link>
			</fieldset>
		</g:form>
	</div>
</body>
</html>
