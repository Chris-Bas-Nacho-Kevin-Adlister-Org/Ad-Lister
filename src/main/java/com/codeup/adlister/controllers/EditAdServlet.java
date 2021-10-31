package com.codeup.adlister.controllers;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;



@WebServlet(name = "controllers.EditAdServlet", urlPatterns = "/ads/edit")

public class EditAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/ads/edit.jsp")
                .forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
        Ad currentAd = ((Ad) request.getSession().getAttribute("ad"));
        String newTitle = request.getParameter("new_title");
        String newDescription = request.getParameter("new_description");
        String newItemCondition = request.getParameter("new_item_condition");
        int newPriceInCents = Integer.parseInt(request.getParameter("new_price_in_cents"));
        String newLocation = request.getParameter("new_location");
        String newCategory = request.getParameter("new_category");
        Ad newAdInfo = new Ad(currentAd.getId(), newTitle, newDescription, newItemCondition, newPriceInCents, newLocation, newCategory);           DaoFactory.getAdsDao().update(currentAd, newAdInfo);

        response.sendRedirect("/ads");
    }
}


