<%@page contentType="text/html; charset=UTF-8"
	trimDirectiveWhitespaces="true" isELIgnored="false"%>
<%@page import="java.util.Properties, java.util.Enumeration"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Language Attributes</title>
</head>
<body>
	[<a href="index.jsp">Home</a>]
	<h1>Language Attributes</h1>
	<ul>
		<li>Locale = ${pageContext.request.locale}</li>
		<li>Locales = <c:forEach items="${pageContext.request.locales}"
				var="loc" varStatus="stat">${loc}<c:if
					test="${! stat.last }">, </c:if>
			</c:forEach></li>
		<li>Accept-Language = '${header['Accept-Language']}'</li>
	</ul>
</body>
</html>