package com.tx.servlet;

import com.tx.entity.User;
import com.tx.service.UserService;
import com.tx.util.JSONServlet;
import com.tx.util.MD5Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserService userService = new UserService();

        String user_name = request.getParameter("user_name");
        String user_password = request.getParameter("user_password");

        User user = userService.userLogin(user_name, user_password);
        boolean result;

        if(user != null){
            request.getSession().setAttribute("user",user);
            result = true;
        }else{
            result = false;
        }
        JSONServlet.getJson(request,response,result);

    }
}
