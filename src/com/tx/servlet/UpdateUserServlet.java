package com.tx.servlet;

import com.alibaba.fastjson.JSONObject;
import com.tx.entity.User;
import com.tx.service.UserService;
import com.tx.util.JSONServlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        UserService userService = new UserService();
        String data = request.getParameter("data");
        User user = JSONObject.parseObject(data, User.class);

        boolean result;
        result = userService.updateUser(user.getUser_id(),user);

        JSONServlet.getJson(request,response,result);
    }
}
