<g:applyLayout name="main">
	<head>
		<meta name="layout" content="main">
		<title><g:layoutTitle default="SIEYM"/></title>
		<g:layoutHead/>
	</head>
	<body>
		<div class="nav side" role="navigation">
			<ul>
				<li><a href="${createLink(uri: '/fase')}"><g:message code="default.config.fases.label"/></a></li>
				<li><a href="${createLink(uri: '/logistica')}"><g:message code="default.config.logistica.label"/></a></li>
				<li><a href="${createLink(uri: '/materiaPrima')}"><g:message code="default.config.materiaprima.label"/></a></li>
				<li><a href="${createLink(uri: '/maquina')}"><g:message code="default.config.maquinas.label"/></a></li>
				<li><a href="${createLink(uri: '/paquete')}"><g:message code="default.config.paquetes.label"/></a></li>
			</ul>
		</div>
		<g:layoutBody/>
	</body>
</g:applyLayout>
