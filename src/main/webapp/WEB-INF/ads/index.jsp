<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>



<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <style rel="stylesheet" ></style>
</head>
<body>
    <div class="container-lg">
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

        <h1></h1>
    <div>

        <c:forEach var="ad" items="${ads}">
            <div class="col-md-6">
                <h2>${ad.title}</h2>
                <p>${ad.description}</p>
                <p>${ad.condition}</p>
                <p>${ad.postDate}</p>
                <p>${ad.priceInCents}</p>
                <p>${ad.location}</p>
                <p>${ad.category}</p>
                <button class="favorite">Favorite</button>
                <span class="ad-id" data="${ad.id}"></span>
                <span class="user-id" data="${user.id}"></span>
            </div>
        </c:forEach>

    </div>
    </div>
    <script>
<%-- found initial source for the idea here https://www.java4s.com/jquery-tutorials/submit-form-without-refreshing-page-in-javajsp-with-jquery/ --%>
        $(document).ready(function() {
            $('.favorite').click(function(e) {
                e.preventDefault();
                if($(this).css("background-color") !="red"){
                    $(this).css("background-color", "red");
                } else {
                    $(this).css("background-color", "gray")
                }
                //need to get the id of the ad which I'm trying to include as part of the ad-id span
                //then we can make some sort of ajax request???? Check the commented link above
                let adID = $(this).next().data();
                let userID = $(this).next().next().data();
                console.log(adID);
                console.log(userID);

                // $.ajax({
                //     url: "saveIt", //urlpattern of favorites servlet should go here
                //
                //     //type: "post",
                //     data: value,
                //     cache: false,
                //     success: function(data) {
                //
                //     }
                })
            });
    </script>
</body>





</html>
