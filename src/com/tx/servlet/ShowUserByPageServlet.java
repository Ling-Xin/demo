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

@WebServlet(urlPatterns = "/ShowUserByPageServlet")
public class ShowUserByPageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserService userService = new UserService();


        String userName = request.getParameter("userName");
        int pageSize = Integer.parseInt(request.getParameter("pageSize"));
        int currPage = Integer.parseInt(request.getParameter("currPage"));

        int totalUser = userService.getTotalUser(userName);
        int totalPage = (totalUser % pageSize) == 0 ? totalUser / pageSize : totalUser / pageSize + 1;

        List<User> users = userService.searchAll(currPage,pageSize,userName);
        Map<String,Object> map = new HashMap<>(4);

        map.put("totalPage",totalPage);
        map.put("userList",users);
        map.put("currPage",currPage);
        map.put("totalUser",totalUser);
        JSONServlet.getJson(request,response,map);
    }
}
