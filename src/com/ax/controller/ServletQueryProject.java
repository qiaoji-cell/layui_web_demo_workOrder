package com.ax.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.ax.entity.Project;
import com.ax.service.ProjectService;
import com.ax.service.impl.ProjectServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Joe on 2021-07-30 0030
 */
@WebServlet(name = "ServletQueryProject", urlPatterns = "/ServletQueryProject")
public class ServletQueryProject extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();


        ProjectService projectService = new ProjectServiceImpl();
        List<Project> projects = projectService.queryAllProject();
        //数据集合
        String jsons = JSON.toJSONString(projects);

        out.print(jsons);
        out.flush();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
