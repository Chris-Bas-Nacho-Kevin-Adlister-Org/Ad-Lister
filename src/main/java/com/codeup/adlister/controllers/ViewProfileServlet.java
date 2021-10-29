package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.beans.beancontext.BeanContextChild;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "controllers.ViewProfileServlet", urlPatterns = "/profile")
public class ViewProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        request.setAttribute("ads", DaoFactory.getAdsDao().all());
        List<Ad> allAds = DaoFactory.getAdsDao().all();
        List<Ad> userAds = new ArrayList<Ad>();
        User currentUser = ((User) request.getSession().getAttribute("user"));
        for(Ad ad : allAds){
            if(ad.getUserId() == currentUser.getId()){
                userAds.add(ad);
                System.out.println("Found an ad by this user");
            }
        }
        request.setAttribute("userAds", userAds);
        request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
    }
}