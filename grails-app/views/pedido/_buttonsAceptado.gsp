
<g:form>
	<fieldset class="buttons">
		<g:hiddenField name="id" value="${pedidoInstance?.id}" />
		<g:actionSubmit id="señar" class="edit" value="Señar" />
		<g:actionSubmit class="delete" action="delete"
			value="${message(code: 'default.button.delete.label', default: 'Delete')}"
			onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
		<g:link class="cancel" onclick="history.back();">
			<g:message code="default.button.back.label" />
		</g:link>
	</fieldset>
</g:form>

<div id="señaDlg" style="display: none;" title="Monte de la Seña">
	<g:form>
		<g:hiddenField name="id" value="${pedidoInstance?.id}" />
		<g:hiddenField id="estado" name="estado" value="Señado" />
		<g:field type="number" name="seña" value="${fieldValue(bean: pedidoInstance, field: 'seña')}"/>
		<g:actionSubmit class="edit" action="update" value="Señar" />
	</g:form>
</div>
<g:javascript>
$(document).ready(function() {
	$('#señar').click(function() {
	    $('#señaDlg').dialog({modal:true});
	    return false;
	});
});
</g:javascript>