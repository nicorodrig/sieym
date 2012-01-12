
<g:form>
	<fieldset class="buttons">
		<g:hiddenField name="id" value="${pedidoInstance?.id}" />
		<g:hiddenField id="estado" name="estado" value="Aceptado" />
		<g:actionSubmit class="edit" action="update" value="Aceptar" />
		<g:actionSubmit id="rechazar" class="edit" value="Rechazar" />
		<g:actionSubmit class="delete" action="delete"
			value="${message(code: 'default.button.delete.label', default: 'Delete')}"
			onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
		<g:link class="cancel" onclick="history.back();">
			<g:message code="default.button.back.label" />
		</g:link>
	</fieldset>
</g:form>

<div id="rechazo" style="display: none;" title="Motivo">
	<g:form>
		<g:hiddenField name="id" value="${pedidoInstance?.id}" />
		<g:hiddenField id="estado2" name="estado" value="Rechazado" />
		<g:textArea name="motivoRechazo"></g:textArea>
		<g:actionSubmit class="edit" action="update" value="Rechazar" />
	</g:form>
</div>
<g:javascript>
$(document).ready(function() {
	$('#rechazar').click(function() {
	    $('#rechazo').dialog({modal:true});
	    return false;
	});
});
</g:javascript>