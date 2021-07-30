<%--
  Created by IntelliJ IDEA.
  User: Joe
  Date: 2021-07-30 0030
  Time: 上午 8:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
  <head>
    <title>企业工单管理系统</title>
    <%@ include file="_layouts/home.jsp"%>
  </head>
  <body>
      <div class="layui-container">
        <div class="layui-main">
          <div class="layui-header">
            <h1 style="text-align:center" class="layui-bg-green">企业工单管理系统</h1>
          </div>
          <form class="layui-form layui-inline">
            <div class="layui-form-item layui-inline " >
              <label class="layui-form-label layui-bg-green ">选择项目</label>
              <div class="layui-input-inline">
                  <%@ include file="_partials/projectDrop.jsp"%>
              </div>
            </div>
            <div class="layui-form-item layui-inline">
              <div class="layui-input-inline">
                <button lay-submit class="layui-btn" lay-filter="query">确定</button>
              </div>
            </div>
          </form>
          <table id="orderTable" lay-filter="orderTable"></table>
        </div>
      </div>
  </body>
  <script type="text/html" id="toolbar">
        <button class="layui-btn layui-btn-sm" lay-event="add">添加</button>
 </script>
  <script>
      layui.use(function () {
          let table = layui.table
        ,form = layui.form
        ,$ = layui.$
        ,layer = layui.layer
        ,dropdown = layui.dropdown;
          let orderTable;
          //加载数据
          function loadData(){
              //渲染表格
              orderTable = table.render({
                  toolbar:"#toolbar",
                  id:'orderReload',//表格重载实例
                  elem:"#orderTable", //渲染的元素
                  height:400,//表格高度
                  minWidth:80,//自适应宽度 最小宽度
                  page:true, //开启分页
                  even:true,//隔行变色
                  limit:5,//每页显示5条
                  limits:[5,6,9],//每页显示多少条的选项
                  url:"/contract/ServletQueryOrder",
                  cols:[[
                      {field:"id",title:"工单编号"},
                      {field: "project",title:"项目名称",templet:function (d) {
                              return d.project.projectName
                          }
                      },
                      {field:"executor",title:"执行人"},
                      {field:"description",title:"任务描述"},
                      {field:"orderLevel",title:"级别",templet:function (d) { //d代表整条数据
                              switch (d.orderLevel) {
                                  case 1:
                                      return '1级'
                                      break;
                                  case 2:
                                      return "2级"
                                      break;
                                  case 3:
                                      return "3级"
                                      break;
                              }
                          }},
                      {field:"executor",title:"创建时间"}
                  ]]
                  ,where:{
                      projectId:0
                  }
              })
          }
          loadData();


        // 下拉校验提示
        form.verify({
          project:function(value){
            if(value===""){
              layer.msg('请选择项目',{
                icon:6
              })
              return true
            }
          }
        })

        //条件查询
        form.on('submit(query)',function (data) {
          data = data.field.projectId;
            orderTable = table.reload('orderReload',{
                page:{
                    curr:1 //回到第一页
                },
                where:{
                  projectId: data
                }
            })
            return false;
        })

        //添加工单
        function addOrder(){
          layer.open({
            type:2,
            title:"添加工单",
            shadeClose:true,
            maxmin:true,
            area:["800px","500px"],
            content:'add.jsp'
            ,end:function () {
              //重载表格
                  alert(orderTable.config.page.pages)
                 orderTable = table.reload('orderReload',{
                      page:{
                          curr:orderTable.config.page.pages
                      }
                  })
            }
          })
        }
        //头工具添加事件
        table.on('toolbar(orderTable)',function (obj) {
            switch (obj.event) {
               case "add":
                 addOrder();
                 break;
            }
        })

      })
  </script>
</html>
