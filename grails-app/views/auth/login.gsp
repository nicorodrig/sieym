<%@ page import="sieym.User" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="login.title.label" default="Iniciar Sesion" /></title>
	</head>
	<body>
		<div id="login" class="scaffold-create">
			<h1><g:message code="login.title.label" default="Iniciar Sesion" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${userInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${userInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form name="liginForm" action="dologin">
				<fieldset class="form">
					<div class="fieldcontain">
						<label for="username">
							<g:message code="user.username.label" default="Usuario" />
						</label>
						<g:textField name="username"/>
					</div>
					<div class="fieldcontain">
						<label for="password">
							<g:message code="user.password.label" default="Contraseña" />
						</label>
						<input type="password" name="password"/>
					</div>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="dologin" class="save" value="${message(code: 'default.button.login.label', default: 'Iniciar Sesion')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
