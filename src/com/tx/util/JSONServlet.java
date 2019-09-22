package com.tx.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.annotation.JSONField;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class JSONServlet {
    /**
     * 将任意类型转换成JSON格式
     *
     * @param request   请求
     * @param response  响应
     * @param object    对象
     */
    public static void getJson(HttpServletRequest request, HttpServletResponse response, Object object) {
        response.setContentType("text/html;charset=UTF-8");

        //禁用缓存
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", -10);

        PrintWriter out = null;

        try {
            out = response.getWriter();
            String jsonStr = JSON.toJSONString(object);
            out.print(jsonStr);
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            out.close();
        }


    }
}
