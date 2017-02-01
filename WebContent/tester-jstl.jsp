
<%@ page session="false" autoFlush="true" isELIgnored="false"
	contentType="text/html; charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
// ok, so this is not really JSTl... but what the heck.
request.getServletContext().setAttribute("systemProperties", System.getProperties());
%>
<c:if test="${pageContext.request.method eq 'POST' && param['submit'] eq 'submit'}">
<c:url value="${param['target']}" var="targeturl"/>
	<c:if test="${ empty param['ctx'] }">
		<c:redirect url="${empty targeturl?'/':targeturl}"/>
	</c:if>
	<c:if test="${ not empty param['ctx'] }">
		<c:redirect url="${empty targeturl?'/':targeturl}" context="${param['ctx']}"/>
	</c:if>
	
</c:if>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Server Tester JSTL</title>
</head>
<body>
	<h1>Server Tester JSTL</h1>
	<h2>Forward Test</h2>
	<form method="post">
	Target: <input type="text" name="target"/> Context: <input type="text" name="ctx"/>
	<input type="submit" name="submit" value="submit"/>
	</form>
	<h2>Request Information</h2>
	<ul>
		<li>CharacterEncoding: ${pageContext.request.characterEncoding }</li>
		<li>Protocol: ${pageContext.request.protocol }</li>
		<li>Scheme: ${pageContext.request.scheme }</li>
		<li>Method: ${pageContext.request.method }</li>
		<li>LocalAddr: ${pageContext.request.localAddr }</li>
		<li>LocalName: ${pageContext.request.localName }</li>
		<li>LocalPort: ${pageContext.request.localPort }</li>
		<li>RemoteAddr: ${pageContext.request.remoteAddr }</li>
		<li>RemoteHost: ${pageContext.request.remoteHost }</li>
		<li>RemotePort: ${pageContext.request.remotePort }</li>
		<li>PathInfo: ${pageContext.request.pathInfo }</li>
		<li>PathTranslated: ${pageContext.request.pathTranslated }</li>
		<li>ContextPath: ${pageContext.request.contextPath}</li>
		<li>RequestURI: ${pageContext.request.requestURI }</li>
		<li>RequestURL: ${pageContext.request.requestURL }</li>
	</ul>
	<h2>Request Headers</h2>
	<ul>
		<c:forEach var="req" items="${header}">
		<li>${req.key}: <c:out value="${req.value}"/></li>
		</c:forEach>
	</ul>
	<h2>Request Attributes</h2>
	<ul>
		<c:forEach var="req" items="${requestScope}">
		<li>${req.key}: <c:out value="${req.value}"/></li>
		</c:forEach>
	</ul>
	<h2>Request Parameters</h2>
	<ul>
		<c:forEach var="req" items="${pageContext.request.parameterMap}">
		<li>${req.key}: <c:forEach var="value" items="${req.value}"><c:out value="${value}"/></c:forEach></li>
		</c:forEach>
	</ul>
	<h2>Java System Properties</h2>
	<ul>
		<c:forEach var="req" items="${systemProperties}">
		<li>${req.key}: <c:out value="${req.value}"/></li>
		</c:forEach>
	</ul>
</body>
</html>