<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="SIEYM"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		<g:javascript library="jquery"/>
		<r:require module="jquery-ui"/>
        <r:layoutResources/>
		<g:layoutHead/>
	</head>
	<body>
		<div id="header" role="banner"><h1>Sistema Integral para la Elaboración de la Yerba Mate</h1></div>
		<div class="nav" role="navigation">
			<ul class="main">
				<li><a href="${createLink(uri: '/user')}"><g:message code="navigation.users"/></a></li>
				<li><a href="${createLink(uri: '/logistica')}"><g:message code="navigation.config"/></a></li>
				<li><a href="${createLink(uri: '/pedido')}"><g:message code="navigation.orders"/></a></li>
				<li><a href="#"><g:message code="navigation.delivery"/></a></li>
				<li><a href="#"><g:message code="navigation.contact"/></a></li>
				<li><a href="#"><g:message code="navigation.stats"/></a></li>
				<li><a href="${createLink(controller: 'auth', action: 'dologout')}"><g:message code="navigation.logout"/></a></li>
			</ul>
		</div>
		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<g:javascript library="application"/>
	</body>
</html>