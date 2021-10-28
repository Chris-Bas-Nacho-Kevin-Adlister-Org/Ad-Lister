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
        </div>
    </c:forEach>
</div>
