<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Edit Your Ad" />
    </jsp:include>
</head>
<body>
<div class="container">
    <h1>Edit Your Ad</h1>
    <form action="/ads/edit" method="post">
        <div class="form-group">
            <label for="title">Title</label>
            <input id="title" name="title" class="form-control" type="text">
        </div>
        <div class="form-group">
            <label for="location">Location</label>
            <input id="location" name="location" class="form-control" type="text">
        </div>
        <div class="form-group">
            <label for="condition">Condition</label>
            <select id="condition" name="condition" class="form-control">
                <option value="new">New</option>
                <option value="mint">Mint</option>
                <option value="great">Great</option>
                <option value="good">Good</option>
                <option value="fair">Fair</option>
                <option value="poor">Poor</option>
            </select>
        </div>
        <div class="form-group">
            <label for="priceInCents">Asking Price</label>
            <input id="priceInCents" name="priceInCents" class="form-control" type="text">
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <textarea id="description" name="description" class="form-control" type="text"></textarea>
        </div>
        <div class="form-group">
            <label for="category">Category</label>
            <select id="category" name="category" class="form-control">
                <option value="Event">Event</option>
                <option value="Electronics">Electronics</option>
                <option value="Furniture">Furniture</option>
                <option value="Books">Books</option>
                <option value="Tools">Tools</option>
                <option value="Musical Instruments">Musical Instruments</option>
                <option value="Vehicles">Vehicles</option>
                <option value="Collectibles">Collectibles</option>
                <option value="Clothing">Clothing</option>
                <option value="Sporting Equipment">Sporting Equipment</option>
                <option value="Services">Services</option>
                <option value="Electronic Media">Electronic Media</option>
                <option value="Computers">Computers</option>
                <option value="Real Estate">Real Estate</option>
                <option value="Misc">Misc</option>
            </select>
        </div>
        <input type="submit" id="form-submit" class="btn btn-block btn-primary">
    </form>

    <form action="http://localhost:8080/ads">
        <input type="submit" value="Cancel" class="btn btn-block btn-danger"/>
    </form>
    <%--



        </div>
    <%--    <script>--%>
    <%--        //Got regex for currency validation Here--%>
    <%--        //https://stackoverflow.com/questions/2227370/currency-validation--%>
    <%--        function validatePrice(){--%>
    <%--            let regex  = /^\d+(?:\.\d{0,2})$/;--%>
    <%--            if(! regex.test(priceField.value)){--%>
    <%--                submitButton.disabled = true;--%>
    <%--            } else{--%>
    <%--                submitButton.disabled = false;--%>
    <%--            }--%>
    <%--        }--%>
    <%--        var submitButton = document.getElementById("form-submit");--%>
    <%--        var priceField = document.getElementById('priceInCents');--%>
    <%--        priceField.addEventListener("keyup", validatePrice())--%>
    <%--    </script>--%>
</body>
</html>
