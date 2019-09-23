package com.tx.servlet;

import com.tx.entity.User;
import com.tx.service.UserService;
import com.tx.util.JSONServlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(urlPatterns = "/ShowAllUserServlet")
public class ShowAllUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserService userService = new UserService();

        List<User> users = userService.searchAll();
        Map<String,Object> map = new HashMap<>(2);

        map.put("count",5);
        map.put("data",users);
        JSONServlet.getJson(request,response,map);
    }
}
