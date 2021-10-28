<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1>you are on the ads/index page</h1>

<div>
<%--    <jsp:include page="/WEB-INF/ads/index.jsp"></jsp:include>--%>

    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <h2>${ad.title}</h2>
            <p>${ad.description}</p>
            <p>${ad.condition}</p>
            <p>${ad.postDate}</p>
            <p>${ad.priceInCents}</p>
            <p>${ad.location}</p>
            <p>${ad.category}</p>
        </div>
    </c:forEach>

</div>

</div>

</body>
</html>
