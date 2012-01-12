<g:form>
	<fieldset class="buttons">
		<g:hiddenField name="id" value="${pedidoInstance?.id}" />
		<g:actionSubmit class="delete" action="delete"
			value="${message(code: 'default.button.delete.label', default: 'Delete')}"
			onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
		<g:link class="cancel" onclick="history.back();">
			<g:message code="default.button.back.label" />
		</g:link>
	</fieldset>
</g:form>
