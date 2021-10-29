package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.EditUserInfoServlet", urlPatterns = "/edit_info")
public class EditUserInfoServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        User user = DaoFactory.getUsersDao().findByUsername(username);

        request.getRequestDispatcher("/WEB-INF/editUserInfo.jsp").forward(request, response);




    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User currentUser = ((User) request.getSession().getAttribute("user"));

        String newUsername = request.getParameter("new_username");
        String newEmail = request.getParameter("new_email");
        String newPassword = request.getParameter("new_password");
        String newHash = Password.hash(newPassword);
        String newPasswordConfirmation = request.getParameter("confirm_new_password");
        String newPhoneNumber = request.getParameter("new_phone_number");



        // validate input
        boolean inputHasErrors = newUsername.isEmpty()
                || newEmail.isEmpty()
                || newPassword.isEmpty()
                || (! newPassword.equals(newPasswordConfirmation));

        if (inputHasErrors) {
            response.sendRedirect("/register");
            return;
        }

        // Update user info
        User newUserInfo = new User(newUsername, newEmail, newPhoneNumber, newHash);
        DaoFactory.getUsersDao().update(currentUser, newUserInfo);
        User user = DaoFactory.getUsersDao().findByUsername(newUsername);
        request.getSession().setAttribute("user", user);
        response.sendRedirect("/profile");

        }

}
