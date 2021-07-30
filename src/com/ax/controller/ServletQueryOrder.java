package com.ax.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.ax.entity.Project;
import com.ax.entity.Workorder;
import com.ax.service.ProjectService;
import com.ax.service.WorkorderService;
import com.ax.service.impl.ProjectServiceImpl;
import com.ax.service.impl.WorkorderServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by Joe on 2021-07-30 0030
 */
@WebServlet(name = "ServletQueryOrder", urlPatterns = "/ServletQueryOrder")
public class ServletQueryOrder extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        String proId = request.getParameter("projectId");
        String page = request.getParameter("page");
        String limit = request.getParameter("limit");
        WorkorderService workorderService = new WorkorderServiceImpl();
        List<Workorder> orders = workorderService.queryAllOrder(
                Integer.valueOf(proId)
                ,Integer.valueOf(page)
                ,Integer.valueOf(limit)
        );
        //查条数
        List<Workorder> allOrder = workorderService.queryAllOrder(
                Integer.valueOf(proId)
                ,0
                ,0
        );

        JSONObject object = new JSONObject();
        String jsons = JSON.toJSONString(orders, SerializerFeature.PrettyFormat);
        object.put("code",0);
        object.put("msg","获得数据");
        object.put("count",allOrder.size());
        object.put("data",orders);
        System.out.println(object);

        out.print(object);
        out.flush();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
