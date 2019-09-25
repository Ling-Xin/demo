<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/25 0025
  Time: 上午 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人信息</title>
    <link rel="stylesheet" href="bootstrap-4.3.1-dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <div class="d-flex justify-content-end">
            <div>
                <span>欢迎您，</span><span id="loginUser">${sessionScope.user.user_name}</span>
                <span class="ml-2"><a href="/SessionValServlet">退出登录</a></span>
            </div>
        </div>
        <div>
            <form>
                <div class="form-group row">
                    <label for="userName" class="col-sm-2 col-form-label">用户名</label>
                    <div class="col-sm-10">
                        <input type="text" readonly class="form-control-plaintext" id="userName" value="${sessionScope.user.user_name}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="age" class="col-sm-2 col-form-label">年龄</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control-plaintext" id="age" placeholder="请输入年龄" value="${sessionScope.user.user_age}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="sex" class="col-sm-2 col-form-label">性别</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control-plaintext" id="sex" value="${sessionScope.user.user_sex == 0 ? "男" : "女"}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="address" class="col-sm-2 col-form-label">地址</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control-plaintext" id="address" placeholder="请输入地址" value="${sessionScope.user.user_address}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="tel" class="col-sm-2 col-form-label">电话</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control-plaintext" id="tel" placeholder="请输入电话" value="${sessionScope.user.user_tel}">
                    </div>
                </div>
            </form>
        </div>
    </div>


    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="bootstrap-4.3.1-dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
</body>
</html>
