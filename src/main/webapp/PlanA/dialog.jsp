<%--
  Created by IntelliJ IDEA.
  User: Diluka
  Date: 2015-06-03
  Time: 下午 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<c:if test="${!param.dialog}">
    <html>
    <head>
        <title>弹窗页面</title>
        <jsp:include page="/import.jsp"></jsp:include>
    </head>
    <body>
    <div class="panel">
    <div class="panel-header">
        <h3>面板标题</h3>
    </div>
    <div class="panel-body">
</c:if>
<div id="plan-a-dialog">
    <form id="plan-a-form">
        <div class="row">
            <div class="control-group">
                <label class="control-label">状态码</label>

                <div class="controls">
                    <input id="plan-a-form-text" type="text" name="code" data-rules="{required:true,number:true}">
                </div>
            </div>
        </div>
        <c:if test="${!param.dialog}">
            <div class="row">
                <div class="control-group">
                    <label class="control-label"></label>

                    <div class="controls">
                        <button id="plan-a-form-btn-submit" type="button">提交</button>
                    </div>
                </div>
            </div>
        </c:if>
    </form>
</div>
<c:if test="${!param.dialog}">
    </div>
    </div>
</c:if>
<script>
    function PlanA_dialog() {
        var me = this;


        BUI.use(['bui/form'], function (Form) {
            var form = new Form.Form({
                srcNode: "#plan-a-form",
                autoRender: true
            });


            me.submit = function () {
                var data = form.getRecord();
                console.log(data);
                return $.post("<s:url value="/demoSave"/>", data);
            };

            me.clearFields=function(){
                form.clearFields();
                form.clearErrors(true);
            };
        });

    }
</script>
<c:if test="${!param.dialog}">
    <script>
        (function () {
            var page = new PlanA_dialog();

            $("#plan-a-form-btn-submit").click(function () {
                page.submit().done(function (data) {
                    if (data.success) {
                        switch (data.code) {
                            case 1:
                                BUI.Message.Alert("成功", "success");
                                break;
                            case 0:
                                BUI.Message.Alert("失败", "error");
                                break;
                        }

                    }
                });
            });
        })();
    </script>
    </body>
    </html>
</c:if>
