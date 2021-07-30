package com.ax.controller;

import com.alibaba.fastjson.JSONObject;
import com.ax.entity.Project;
import com.ax.entity.Workorder;
import com.ax.service.WorkorderService;
import com.ax.service.impl.WorkorderServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Map;

/**
 * Created by Joe on 2021-07-30 0030
 */
@WebServlet(name = "ServletAddOrder", urlPatterns = "/ServletAddOrder")
public class ServletAddOrder extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        String projectId = request.getParameter("projectId");
        String executor = request.getParameter("executor");
        String description = request.getParameter("description");
        String orderLevel = request.getParameter("orderLevel");

        LocalDate rightDate = null;

        WorkorderService workorderService = new WorkorderServiceImpl();
        Workorder workorder = new Workorder();
        Project project = new Project();

        project.setId(Long.valueOf(projectId));

        workorder.setProject(project);
        workorder.setExecutor(executor);
        workorder.setDescription(description);
        workorder.setOrderLevel(Long.valueOf(orderLevel));
        workorderService.addOrder(workorder);

        boolean res = workorderService.addOrder(workorder);
        out.print(res);
        out.flush();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
