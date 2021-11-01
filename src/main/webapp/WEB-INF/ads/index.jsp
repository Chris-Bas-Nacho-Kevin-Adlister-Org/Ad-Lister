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
    <div class="p-5 mb-4 bg-light rounded-3">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold">Adlister</h1>
        </div>
    </div>

    <jsp:include page="/WEB-INF/partials/navbar.jsp"/>

    <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
        <input type="search" class="form-control form-control-dark" placeholder="Search..." aria-label="Search">
    </form>
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

                <form action="/favorites" name="sub" id="sub">
                    <input type="checkbox" class="btn-check" id="btn-check-outlined" autocomplete="off" name="favorite_button">
                    <label class="btn btn-outline-primary favorite" for="btn-check-outlined">Favorite</label><br>
                </form>

            </div>
        </c:forEach>



    </div>
</div>

<jsp:include page="/WEB-INF/partials/bootstrap.jsp"/>

<script>
    <%-- found initial source for the idea here https://www.java4s.com/jquery-tutorials/submit-form-without-refreshing-page-in-javajsp-with-jquery/ --%>
    $(document).ready(function() {


        $('.favorite').click(function(e) {
            e.preventDefault();
            let ajaxdata = $("")
            if($(this).css("background-color") !="red"){
                $(this).css("background-color", "red");
            } else {
                $(this).css("background-color", "gray")
            }
            //need to get the id of the ad which I'm trying to include as part of the ad-id span
            //then we can make some sort of ajax request???? Check the commented link above
            let adID = $(this).next().data().value; //this line doesn't work. It's supposed to grab the id of the ad whose favorite button you clicked.
            //let userID = $(this).next().next().data().value;
            //Logging to check we're grabbing it properly. once we have both we can try slapping them in ajax.
            console.log(adID);
            console.log(${user.id});

            // $.ajax({
            //     url: "/favorite", //urlpattern of favorites servlet should go here
            //
            //     type: "post",
            //     data: value, //figure out how to pack id of session user and adId in here?
            //     cache: false,
            //     success: function(data) {
            //
            //     }
        })
    });
</script>
</body>





</html>