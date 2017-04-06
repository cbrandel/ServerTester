<%@ page session="false" autoFlush="true" isELIgnored="false"
	contentType="text/html; charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
	<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Properties"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.TreeMap"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Server Tester</title>
</head>
<body>
<jsp:include page="_header.jsp"/>
	<h1>Server Tester</h1>
	<h2>Request Information</h2>
	<ul>
		<li>CharacterEncoding: <%=request.getCharacterEncoding()%></li>
		<li>ContextPath: <%=request.getContextPath()%></li>
		<li>Method: <%=request.getMethod()%></li>
		<li>Protocol: <%=request.getProtocol()%></li>
		<li>Scheme: <%=request.getScheme()%></li>
		<li>LocalAddr: <%=request.getLocalAddr()%></li>
		<li>LocalName: <%=request.getLocalName()%></li>
		<li>LocalPort: <%=request.getLocalPort()%></li>
		<li>RemoteAddr: <%=request.getRemoteAddr()%></li>
		<li>RemoteHost: <%=request.getRemoteHost()%></li>
		<li>RemotePort: <%=request.getRemotePort()%></li>
	</ul>
	<h2>Request Headers</h2>
	<ul>
		<%
			Enumeration<String> hn = request.getHeaderNames();
			List<String> hLst = Collections.list(hn);
			Collections.sort(hLst);
			for (String headerName : hLst) {
		%><li><%=headerName%>=<%=request.getHeader(headerName)%></li>
		<%
			}
		%>
	</ul>
	<h2>Request Attributes</h2>
	<ul>
		<%
			Enumeration<String> an = request.getAttributeNames();
			List<String> aLst = Collections.list(an);
			Collections.sort(aLst);
			for (String attribName : aLst) {
		%><li><%=attribName%>=<%=request.getAttribute(attribName)%></li>
		<%
			}
		%>
	</ul>
	<h2>Java System Properties</h2>
	<ul>
		<%
			Properties props = System.getProperties();
			Map<Object, Object> map = new TreeMap<Object, Object>(props);
			for (Object key : map.keySet()) {
		%><li><%=key%>=<%=System.getProperty((String) key)%></li>
		<%
			}
		%>
	</ul>
</body>
</html>