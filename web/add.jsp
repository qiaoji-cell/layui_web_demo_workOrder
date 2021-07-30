<%--
  Created by IntelliJ IDEA.
  User: Joe
  Date: 2021-07-30 0030
  Time: 下午 14:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加工单</title>
    <%@ include file="_layouts/home.jsp"%>
</head>
<body>
    <div class="layui-container">
            <fieldset class="layui-elem-field layui-field-title">
                <legend>添加工单</legend>
            </fieldset>
            <form class="layui-form">
                <div class="layui-form-item">
                    <label class="layui-form-label">执行人：</label>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input" lay-verify="regExecutor" name="executor">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">任务描述：</label>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input" lay-verfiy="regDescription" name="description">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">项目：</label>
                    <div class="layui-input-block">
                        <%@ include file="_partials/projectDrop.jsp"%>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">级别：</label>
                    <div class="layui-input-block">
                        <select class="layui-select" name="orderLevel">
                            <option value="1">1级</option>
                            <option value="1">2级</option>
                            <option value="1">3级</option>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="up">提交</button>
                        <button type="reset" class="layui-btn layui-btn-danger">重置</button>
                    </div>
                </div>
            </form>
    </div>
    <script>
        layui.use(function () {
            let form = layui.form
            ,layer = layui.layer
            ,$ = layui.$
            form.on('submit(up)',function (data) {
                let param = $.param(data.field)
                $.ajax({
                    url:"/contract/ServletAddOrder",
                    type:"post",
                    data:param,
                    dataType:"text",
                    success:function (data) {
                        if(data==="true"){
                            layer.msg('添加成功！',{icon:6});
                        }
                    }
                })
                return false;
            })

            form.verify({
                regExecutor:function(value){
                    if(value===""||value===null){
                        layer.msg('内容必须填写',{icon:5})
                        return true
                    }
                },
                regDescription:function (value) {
                    if(value===""||value===null){
                        layer.msg('内容必须填写',{icon:5})
                        return true
                    }
                },
                project:function(value){
                    if(value===""){
                        layer.msg('请选择项目',{
                            icon:6
                        })
                        return true
                    }
                }
            })
        })
    </script>
</body>
</html>
