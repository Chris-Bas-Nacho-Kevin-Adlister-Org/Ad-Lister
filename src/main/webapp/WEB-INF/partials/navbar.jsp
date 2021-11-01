<%@ page import="com.codeup.adlister.models.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% User user = (User) request.getSession().getAttribute("user"); %>

<c:choose>
    <%--    If user is NOT logged in, show the following navbar--%>
    <c:when test="${user != null}">
        <nav class="navbar navbar-expand-sm p-3 fs-3 navbar-light" style="background-color: #e3f2fd;">
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav">
                    <a class="nav-link" aria-current="page" href="/">Home</a>
                    <a class="nav-link" href="/ads/create">Create Ad</a>
                    <a class="nav-link" href="/profile">My Ads</a>
                    <a class="nav-link" href="/logout">Log out</a>
                </div>
            </div>
        </div>
    </c:when>

    <%--    Otherwise, if user is logged in show this navbar instead--%>
    <c:otherwise>


        <nav class="navbar navbar-expand-sm p-3 fs-3 navbar-light"
             style="background-color: #e3f2fd;">
            <div class="container-fluid">
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <div class="navbar-nav">
                        <a class="nav-link" aria-current="page" href="/">Home</a>
                        <a class="nav-link" href="/ads/create">Create Ad</a>
                        <a class="nav-link" href="/login">Login</a>
                        <a class="nav-link" href="/register">Register</a>
                    </div>
                </div>
            </div>
        </nav>
    </c:otherwise>
</c:choose>