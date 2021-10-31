<%@ page import="java.util.List" %>
<%@ page import="com.codeup.adlister.models.Ad" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.codeup.adlister.models.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- writing java that takes the userFavoriteAds and puts only the ones that match the session user into a new array to use--%>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>

<body>
<div class="container">
    <%--        <img src="${pageContext.servletContext.contextPath}/img/animeGirl-1.jpg" alt="animeGirl" width="240" height="150">--%>
    <h3>Username: ${sessionScope.user.username}!</h3>
    <h3>Email: ${sessionScope.user.email}!</h3>
    <h3>Phone Number: ${sessionScope.user.phoneNumber}!</h3>
    <h3>User ID: ${sessionScope.user.id}!</h3>
    <form action="/edit_info">
        <button class="btn btn-block btn-primary">Edit account info</button>
    </form>
</div>

<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<br>
<%-- Here we'll have a tab for viewing the user's ads and one for viewing their favorites --%>
<div class="container">

<%--    <ul class="nav nav-pills">--%>
<%--        <li id="adsButton" role="presentation" class="active">--%>
<%--            <a href="#">My Ads</a>--%>
<%--        </li>--%>
<%--        <li id="favoritesButton" role="presentation">--%>
<%--            <a href="#">My Favorites</a>--%>
<%--        </li>--%>
<%--    </ul>--%>

    <ul class="nav nav-pills">
        <li role="presentation" class="nav-item">
            <a id="adsButton" class="nav-link active" aria-current="page" href="#">My Ads</a>
        </li>
        <li role="presentation" class="nav-item">
            <a id="favoritesButton" class="nav-link" href="#">My Favorites</a>
        </li>
    </ul>

    <div id="myAdsContainer">
        <c:forEach var="ad" items="${userAds}">
            <div class="col-md-6">
                <h2>${ad.title}</h2>
                <p>${ad.description}</p>
                <p>Condition: ${ad.condition}</p>
                <p>Post Date: ${ad.postDate}</p>
                <p>Price In Cents${ad.priceInCents}</p>
                <p>Location: ${ad.location}</p>
                <p>Category: ${ad.category}</p>
            </div>
        </c:forEach>
    </div>
    <div id="myFavoriteAdsContainer" style="display: none;">
        <c:forEach var="ad" items="${userFavoriteAds}">
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<script>
    <%--        script that handles activating and deactivating the above buttons and switching the display --%>
    $(document).ready(function(){
        function tabSwitch(clickedButtonID){
            //should switch the active tab to btn-secondary and the other to btn-primary
            if(clickedButtonID == "adsButton" && !($("#adsButton").hasClass("active"))){
                $("#adsButton").toggleClass("active");
                $("#favoritesButton").toggleClass("active");
                $("#myFavoriteAdsContainer").toggle(false);
                $("#myAdsContainer").toggle(true);
            }
            if(clickedButtonID == "favoritesButton" && !($("#favoritesButton").hasClass("active"))){
                $("#favoritesButton").toggleClass("active");
                $("#adsButton").toggleClass("active");
                $("#myAdsContainer").toggle(false);
                $("#myFavoriteAdsContainer").toggle(true);
            }
        }
        $("#adsButton").on("click", function(){
            tabSwitch("adsButton");
        });
        $("#favoritesButton").on("click", function(){
            tabSwitch("favoritesButton");
        });
    });
</script>

<jsp:include page="/WEB-INF/partials/bootstrap.jsp"/>

</body>
</html>
