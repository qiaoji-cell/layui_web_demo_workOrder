<%--
  Created by IntelliJ IDEA.
  User: Joe
  Date: 2021-07-30 0030
  Time: 下午 15:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<select name="projectId" id="select" lay-verify="project" lay-filter="selectProject">

</select>
<script>
    layui.use(function () {
        let $=layui.$
        ,form=layui.form
        //获得下拉数据
        function getDrop(){
            $.ajax({
                url:"/contract/ServletQueryProject",
                type:"post",
                dataType:"json",
                success:function (data) {
                    let select = $('#select');
                    select.append("<option value=''>请选择</option>");
                    $(data).each(function (index,obj) {
                        let option = "<option value="+obj.id+">"+obj.projectName+"</option>"
                        select.append(option);
                    })

                    form.render('select');
                }
            })
        }
        getDrop();
    })
</script>
