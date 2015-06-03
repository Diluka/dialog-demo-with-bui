<%--
  Created by IntelliJ IDEA.
  User: Diluka
  Date: 2015-06-03
  Time: 下午 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title>弹窗页面复用测试</title>
    <jsp:include page="/import.jsp"></jsp:include>
</head>
<body>
<h1>Hello World!</h1>
<button id="index-btn-open-dialog" class="button button-primary">打开弹窗</button>
<script>
    BUI.use(['bui/form', 'bui/overlay'], function (Form, Overlay) {
        var planA_dialog_page;
        var dialog = new Overlay.Dialog({
            title: "弹窗显示",
            loader: {
                url: "<s:url value="/PlanA/dialog.jsp"/>",
                params: {
                    dialog: true
                },
                callback: function () {
                    planA_dialog_page = new PlanA_dialog();
                }
            },
            success: function () {
                planA_dialog_page.submit().done(function (data) {
                    if (data.success) {
                        switch (data.code) {
                            case 1:
                                BUI.Message.Alert("成功", "success");
                                dialog.close();
                                planA_dialog_page.clearFields();
                                break;
                            case 0:
                                BUI.Message.Alert("失败", "error");
                                break;
                            default :
                                BUI.Message.Alert("请输入1或者0", "warning");
                                planA_dialog_page.clearFields();
                                break;
                        }

                    }
                });
            },
            contentId: "plan-a-dialog"
        });

        $("#index-btn-open-dialog").click(function(){
           dialog.show();
        });
    });
</script>
</body>
</html>
