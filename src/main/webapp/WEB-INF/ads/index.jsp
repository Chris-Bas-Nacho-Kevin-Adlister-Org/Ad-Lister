<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>



<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<body>


<div class="card mb-3" style="max-width: 540px;">
    <div class="row g-0">
        <div class="col-md-4">
            <img src="tools.png" class="img-fluid rounded-start" alt="...">
        </div>
        <div class="col-md-8">
            <div class="card-body">
                <h5 class="card-title">${ad.title}</h5>
                <div>
                    <p class="card-text">${ad.description}</p>
                    <p class="card-text"><small class="text-muted">${ad.postDate}</small>
                        <small class="text-muted">${ad.location}</small>
                    </p>
                </div>
                <div>
                    <p class="card-text">${ad.condition}</p>
                    <p class="card-text">${ad.priceInCents}</p>
                    <p class="card-text">${ad.category}</p>
                </div>


            </div>
        </div>
    </div>
</div>

<%--<c:forEach var="ad" items="${ads}">--%>
<%--        <h2>${ad.title}</h2>--%>
<%--        <p>${ad.description}</p>--%>
<%--        <p>${ad.condition}</p>--%>
<%--        <p>${ad.postDate}</p>--%>
<%--        <p>${ad.priceInCents}</p>--%>
<%--        <p>${ad.location}</p>--%>
<%--        <p>${ad.category}</p>--%>
<%--</c:forEach>--%>




<jsp:include page="/WEB-INF/partials/bootstrap.jsp" />

</body>
</div>
</html>
