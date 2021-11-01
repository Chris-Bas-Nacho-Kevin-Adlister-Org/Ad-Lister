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
        <div>
            <div>
                <div class="card mb-3 row no-gutters">
                    <div class="row g-0">
                        <div class="col-md-4">
                            <div class=" border-0 d-flex flex-row-reverse">
                                <button class="favorite border-0 bg-transparent">
                                    <span style="font-size:200%;color:red; margin-right: 1rem; background:none;">&hearts;</span>
                                </button>
                            </div>
                            <div>
                                picture right herrrr
<%--                                    <jsp:include page="/WEB-INF/partials/image1.jsp"></jsp:include>--%>
                            </div>
                        </div>
                    </div>

                    <div>
<%--                            right side of card--%>
                        <div class="col-md-8">
                            <div class="title-body">
                                <div>
                                    <h5 class="card-title fw-bold fs-1 mb-2rem">${ad.title}</h5>
                                </div>
                                <div>
                                    <form action="/ads/edit" method="GET">
                                        <input type="hidden" name="adID" id="adID" value="${ad.id}"/>
                                        <input class="btn btn-primary" type="submit" value="Edit" id="editAdButton">
                                    </form>
                                </div>


                                </div>
                                <div>
                                    <p class="p-2 mt-5 fs-5">About this item </p>
                                </div>
                                <div>
                                    <p class="p-2">${ad.description}</p>
                                </div>
                            </div>
                            <hr>
                            <table class="table table-borderless">
                                <tbody>
                                <tr>
                                    <td>
                                        <p class="fs-2 fw-bold">Price: </p>
                                    </td>
                                    <td>
                                        <p class="fs-3">${ad.priceInCents}</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p class="fs-2 fw-bold">Condition: </p>
                                    </td>
                                    <td>
                                        <p class="fs-3">${ad.condition}</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p class="fs-2 fw-bold">Category: </p>
                                    </td>
                                    <td>
                                        <p class="fs-3">${ad.category}</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p class="fs-2 fw-bold">Location: </p>
                                    </td>
                                    <td>
                                        <p class="fs-3">${ad.location}</p>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <hr>
                            <div class="d-flex flex-row-reverse bd-highlight">
                                <table>
                                    <tr>
                                        <td>
                                            <p class="card-text"><small class="text-muted">Post Date: ${ad.postDate}</small>
                                            </p>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
    </c:forEach>
</div>

<%--<form action="/ads/edit" method="GET">--%>
<%--    <input type="hidden" name="adID" id="adID" value="${ad.id}"/>--%>
<%--    <input class="btn btn-primary" type="submit" value="Edit" id="editAdButton">--%>
<%--</form>--%>




    <div id="myFavoriteAdsContainer" style="display: none;">
        <c:forEach var="ad" items="${userFavoriteAds}">
            <div>
                    <div class="card mb-3 row no-gutters">
                        <div class="row g-0">
                            <div class="col-md-4">
                                <div class=" border-0 d-flex flex-row-reverse">
                                    <button class="favorite border-0 bg-transparent">
                                        <span style="font-size:200%;color:red; margin-right: 1rem; background:none;">&hearts;</span>
                                    </button>
                                </div>
                                <div>
<%--                                    <jsp:include page="/WEB-INF/partials/image1.jsp"></jsp:include>--%>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="title-body">
                                    <div>
                                        <h5 class="card-title fw-bold fs-1 mb-2rem">${ad.title}</h5>
                                    </div>
                                    <div>
                                        <p class="p-2 mt-5 fs-5">About this item </p>
                                    </div>
                                    <div>
                                        <p class="p-2">${ad.description}</p>
                                    </div>
                                </div>
                                <hr>
                                <table class="table table-borderless">
                                    <tbody>
                                    <tr>
                                        <td>
                                            <p class="fs-2 fw-bold">Price: </p>
                                        </td>
                                        <td>
                                            <p class="fs-3">${ad.priceInCents}</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p class="fs-2 fw-bold">Condition: </p>
                                        </td>
                                        <td>
                                            <p class="fs-3">${ad.condition}</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p class="fs-2 fw-bold">Category: </p>
                                        </td>
                                        <td>
                                            <p class="fs-3">${ad.category}</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p class="fs-2 fw-bold">Location: </p>
                                        </td>
                                        <td>
                                            <p class="fs-3">${ad.location}</p>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <hr>
                                <div class="d-flex flex-row-reverse bd-highlight">
                                    <table>
                                        <tr>
                                            <td>
                                                <p class="card-text"><small class="text-muted">Post Date: ${ad.postDate}</small>
                                                </p>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
<%--                </c:forEach>--%>
            </div>
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

        // $("#editAdButton").on("click", function() {
        //    // let adID = $(this).attr("ad-id")
        //    //  console.log(adID);
        //
        // });

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
