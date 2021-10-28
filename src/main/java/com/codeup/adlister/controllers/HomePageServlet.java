package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import org.w3c.dom.ls.LSOutput;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "HomePageServlet", urlPatterns = "/")
public class HomePageServlet extends HttpServlet {

    @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            request.setAttribute("ads", DaoFactory.getAdsDao().all());
            request.getRequestDispatcher("/WEB-INF/ads/index.jsp").forward(request, response);
            System.out.println("whazzz uppppp");
        }
}

