<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container">
    <h1>Welcome to the Site!!</h1>


<div>
    <h2>Click here to enter the site!</h2>
</div>

<form action="http://localhost:8080/ads">
    <input type="submit" value="Go to home page"/>
</form>

</div>
</body>
</html>