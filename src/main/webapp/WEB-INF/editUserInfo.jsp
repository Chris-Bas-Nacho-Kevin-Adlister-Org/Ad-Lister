<%--
  Created by IntelliJ IDEA.
  User: bash
  Date: 10/28/21
  Time: 9:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Account Info</title>
</head>
<body>
<div class="container">

    <h1>Edit Your Info</h1>

    <form action="/edit_info" method="POST">
        <div>
            <label for="new_username">New Username</label>
            <input id="new_username" name="new_username"  type="text">
        </div>

        <div>
            <label for="new_password">New Password</label>
            <input id="new_password" name="new_password" type="password">
        </div>

        <div>
            <label for="confirm_new_password">Confirm Password</label>
            <input id="confirm_new_password" name="confirm_new_password" class="form-control" type="password">
        </div>

        <div>
            <label for="new_email">New Email</label>
            <input id="new_email" name="new_email" type="text">
        </div>

        <div>
            <label for="new_phone_number">New Phone Number</label>
            <input id="new_phone_number" name="new_phone_number" type="text">
        </div>

        <input type="submit" class="btn btn-primary btn-block" value="Save Changes">
    </form>



</div>

</body>
</html>
