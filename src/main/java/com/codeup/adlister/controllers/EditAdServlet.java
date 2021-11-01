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

        long adID = Long.parseLong(request.getParameter("adID"));
        System.out.println("doGet method: "+ adID);

        request.getSession().setAttribute("adID", adID);

        request.getRequestDispatcher("/WEB-INF/ads/edit.jsp")
                .forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{


        long sessionAdID = (long) request.getSession().getAttribute("adID");
        System.out.println(sessionAdID);

        String newTitle = request.getParameter("new_title");
        String newDescription = request.getParameter("new_description");
        String newItemCondition = request.getParameter("new_condition");
        int newPriceInCents = Integer.parseInt(request.getParameter("new_price_in_cents"));
        String newLocation = request.getParameter("new_location");
        String newCategory = request.getParameter("new_category");

        Ad newAdInfo = new Ad(newTitle, newDescription, newItemCondition, newPriceInCents, newLocation, newCategory);

        DaoFactory.getAdsDao().update(sessionAdID, newAdInfo);

        System.out.println("Testing from EditAdServlet");

        response.sendRedirect("/ads");
    }
}


