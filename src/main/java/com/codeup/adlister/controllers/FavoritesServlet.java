package com.codeup.adlister.controllers;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Favorite;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet(name = "controllers.FavoritesServlet", urlPatterns = "/favorites")
public class FavoritesServlet extends HttpServlet{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
//        System.out.println(request.getParameter("adID"));
//        System.out.println(request.getParameter("userID"));
        Favorite favorite = new Favorite(Long.parseLong(request.getParameter("userID")), Long.parseLong(request.getParameter("adID")));
        DaoFactory.getFavoritesDao().insert(favorite);
    }
}
