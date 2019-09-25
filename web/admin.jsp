<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/25 0025
  Time: 上午 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户列表</title>
    <link rel="stylesheet" href="bootstrap-4.3.1-dist/css/bootstrap.min.css">
    <style>
        #showTable {
            margin-top: 20px;
        }

        div.dataTables_filter input {
            width: 16em;
            border: 1px solid #CCC;
        }

        tbody tr td:last-child span:last-child {
            margin-left: 20px;
        }

        tbody tr td:last-child span:hover {
            cursor: pointer;
        }

        .modal-body input[type=text], [type=password] {
            width: 90%;
        }

        .hover {
            text-decoration: #0c0c0c;
            color: #CCCCCC;
        }

        #pageSize {
            width: 50%;
        }

        #tip {
            position: absolute;
            top: 40%;
            left: 45%;
            width: 100px;
            text-align: center;
            color: white;
            display: none;
        }

        .text-secondary span {
            color: #007bff;
        }
    </style>
</head>
<body>
<div id="showTable" class="container">
    <!--新增用户和批量删除-->
    <div class="d-flex justify-content-between">
        <div class="mb-2">
            <button type="button" class="btn btn-primary" data-toggle="modal" id="add">
                新增用户
            </button>
            <button type="button" class="btn btn-danger" data-toggle="modal">
                批量删除
            </button>
        </div>
        <div>
            <span>欢迎您，</span><span id="loginUser">${sessionScope.user.user_name}</span>
            <span><a href="/SessionValServlet">退出登录</a></span>
        </div>
    </div>

    <!--记录数和搜索框-->
    <div class="d-flex justify-content-between">
        <div class="form-group w-25">
            <label for="pageSize">记录数：</label>
            <select id="pageSize" class="form-control form-check-inline">
                <option value="5" selected="selected">5</option>
                <option value="10">10</option>
                <option value="20">20</option>
                <option value="50">50</option>
            </select>
        </div>
        <div class="input-group mb-3 w-25">
            <input id="serachInput" type="text" class="form-control" placeholder="search..." aria-label="search">
            <div class="input-group-append">
                <button id="searchBtn" class="btn btn-outline-primary" type="button">搜索</button>
            </div>
        </div>
    </div>
    <table class="table">
        <thead>
        <tr>
            <th>用户id</th>
            <th>用户名</th>
            <th>年龄</th>
            <th>性别</th>
            <th>地址</th>
            <th>电话</th>
            <th class="pl-5">操作</th>
        </tr>
        </thead>
        <tbody id="rowData">

        </tbody>
    </table>
    <!-- 分页 -->
    <div class="d-flex justify-content-between align-self-center">
        <p class="text-secondary">当前第&nbsp;<span id="curr"></span>&nbsp;页,共&nbsp;<span id="pages"></span>&nbsp;页,共有&nbsp;<span
                id="total"></span>&nbsp;条数据</p>
        <nav id="pagination" class="d-flex justify-content-end" aria-label="Page navigation example">
            <ul class="pagination">
                <li class="page-item" value="first"><a class="page-link" href="#">上一页</a></li>
                <li class="page-item" value="next"><a class="page-link" href="#">下一页</a></li>
            </ul>
        </nav>
    </div>
</div>
<!-- 弹出模态框 -->
<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="CenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="CenterTitle"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="form-data" class="text-right">
                    <div class="form-group row">
                        <label for="userName" class="col-sm-2 col-form-label">用户名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="user_name" id="userName"
                                   placeholder="请输入您的用户名">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="password" class="col-sm-2 col-form-label">密码</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" name="user_password" id="password"
                                   placeholder="请输入您的密码">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="age" class="col-sm-2 col-form-label">年龄</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="user_age" id="age" placeholder="请输入您的年龄">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="sex" class="col-sm-2 col-form-label">性别</label>
                        <div id="sex" class="col-sm-10 text-left">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" checked="checked" name="sex" id="sex1"
                                       value="0">
                                <label class="form-check-label" for="sex1">男</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="sex" id="sex2" value="1">
                                <label class="form-check-label" for="sex2">女</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="address" class="col-sm-2 col-form-label">地址</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="user_address" id="address"
                                   placeholder="请输入您的地址">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="tel" class="col-sm-2 col-form-label">电话</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="user_tel" id="tel" placeholder="请输入您的手机号码">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-offset-2 col-sm-10 text-center">
                            <button id="commit" type="submit" class="btn btn-primary"></button>
                            <button type="reset" id="reset" class="btn btn-success ml-5">重置</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- 提示框 -->
<div id="tip" class="bg-success p-2">
    操作成功
</div>

<!-- 删除提示框 -->
<div id="delTip" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">删除提示</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>确定要删除吗?</p>
            </div>
            <div class="modal-footer justify-content-center">
                <button id="confirmDel" type="button" class="btn btn-danger">确定</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="bootstrap-4.3.1-dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
<script>
    var totalPage;     //总页数
    var currPage = 1;
    var totalUser;
    $(function () {
        //分页ajax请求
        var getTopicList = function (curr) {
            $.ajax({
                type: 'POST',
                url: 'ShowUserByPageServlet',
                dataType: 'JSON',
                data: {
                    pageSize: $("#pageSize").val(),
                    currPage: curr || 1,
                    userName: $("#serachInput").val()
                },
                success: function (data) {
                    $("#rowData").find("tr[class='text-c']").remove();
                    totalPage = data.totalPage;
                    currPage = data.currPage;
                    totalUser = data.totalUser;
                    setPages(totalPage);
                    $.each(data.userList, function (index, item) {
                        var $topictr = "<tr class='text-c'>" +
                            "<td>" + item.user_id + "</td>" +
                            "<td>" + item.user_name + "</td>" +
                            "<td>" + item.user_age + "</td>" +
                            "<td>" + (item.user_sex == 0 ? "男" : "女") + "</td>" +
                            "<td>" + item.user_address + "</td>" +
                            "<td>" + item.user_tel + "</td>" +
                            "<td><button class='edit btn btn-sm btn-primary'>编辑</button><button class='del btn btn-sm btn-danger ml-2'>删除</button>" +
                            "</tr>";
                        $("#rowData").append($topictr);
                    });
                    pageSetStyle();
                }
            });
        };

        //设置分页按钮
        function setPages(totalPage) {
            $("#pagination .num").remove();
            for (var i = 1; i <= totalPage; i++) {
                var a = $("<a href=\'#\'></a>").attr("class", "page-link");
                a.html(i);
                var page = $("<li></li>").attr("class", "page-item num");
                page.attr("value", i);
                page.append(a);
                $(".page-item:last-child").before($(page));
            }
        }

        //分页按钮点击事件
        $("#pagination").on("click", "li", function () {
            var flag = $(this).attr("value");

            if (flag == "first") {
                currPage--;
                if (currPage < 1) {
                    currPage = 1;
                }
                getTopicList(currPage);
            } else if (flag == "next") {
                currPage++;
                if (currPage > totalPage) {
                    currPage = totalPage;
                }
                getTopicList(currPage);
            } else {
                currPage = flag;
                getTopicList(flag);
            }
        });

        //设置分页按钮样式
        function pageSetStyle() {
            $("#curr").html(currPage);
            $("#pages").html(totalPage);
            $("#total").html(totalUser);
            $("page-item").eq(currPage).removeClass("active");
            if (totalPage == 1) {
                $(".page-item").eq(0).addClass("disabled");
                $(".page-item").eq(0).find("a").attr("tabindex", "-1");
                $(".page-item").eq(totalPage + 1).addClass("disabled");
                $(".page-item").eq(totalPage + 1).find("a").attr("tabindex", "-1");
                return;
            }
            if (currPage == 1) {
                $(".page-item").eq(0).addClass("disabled");
                $(".page-item").eq(0).find("a").attr("tabindex", "-1");
                $(".page-item").eq(totalPage + 1).removeClass("disabled");
                $(".page-item").eq(totalPage + 1).find("a").removeAttr("tabindex");
            } else if (currPage == totalPage) {
                $(".page-item").eq(totalPage + 1).addClass("disabled");
                $(".page-item").eq(totalPage + 1).find("a").attr("tabindex", "-1");
                $(".page-item").eq(0).removeClass("disabled");
                $(".page-item").eq(0).find("a").removeAttr("tabindex");
            } else {
                $(".page-item").eq(0).removeClass("disabled");
                $(".page-item").eq(0).find("a").removeAttr("tabindex");
                $(".page-item").eq(totalPage - 1).removeClass("disabled");
                $(".page-item").eq(totalPage + 1).find("a").removeAttr("tabindex");
            }
            $(".page-item").eq(currPage).addClass("active");
        }

        //页面加载请求一次ajax
        getTopicList();

        //搜索框点击时发送ajax请求
        $("#searchBtn").click(function () {
            getTopicList();
        });

        //下拉列表框值改变时发送ajax请求
        $("#pageSize").change(function () {
            getTopicList();
        });

        //新增用户按钮
        $("#add").click(function () {
            $("#CenterTitle").text("新增用户");
            $("#commit").text("增加");
            $("#password").parents("div[class='form-group row']").show();
            $("#reset").click();
            $("#modal").modal('show');
        });

        //编辑按钮
        $("#rowData").on("click",".edit",function () {

            var tds = $(this).parents("tr").children("td");
            //设置值
            $("#CenterTitle").text("修改用户信息");
            $("#userName").val(tds.eq(1).text());
            $("#userName").attr("userId",tds.eq(0).text());
            /*$("#password").parents("div").css("display","none");*/
            $("#password").attr("disable",true);
            $("#password").parents("div[class='form-group row']").hide();
            $("#age").val(tds.eq(2).text());
            var sex = tds.eq(3).text();
            if(sex == "男"){
                $("#sex2").attr("checked",false);
                $("#sex1").prop("checked",true);
            }else{
                $("#sex1").attr("checked",false);
                $("#sex2").prop("checked",true);
            }
            $("#address").val(tds.eq(4).text());
            $("#tel").val(tds.eq(5).text());
            $("#modal").modal('show');
            $("#commit").text("修改");


        });

        //删除按钮
        $("#rowData").on("click",".del",function () {
            var tr = $(this).parents("tr");
            var userId = tr.children("td").eq(0).text();
            console.log(userId);
            $("#delTip").modal('show');
            $("#confirmDel").unbind("click").click(function () {
                $.ajax({
                    url: "/DelUserServlet",
                    type: "POST",
                    data: {
                        userId: userId
                    },
                    success: function (result) {
                        if (result == "true") {
                            $('#tip').fadeIn(1000);
                            $('#tip').fadeOut(1000).delay(500);
                            $("#delTip").modal('hide');
                            tr.remove();
                            getTopicList(currPage);
                        } else {
                            $("#delTip").modal('hide');
                            console.log("操作失败");
                        }
                    }

                })
            })
        });

        //提交按钮
        $("#commit").click(function (e) {
            e.preventDefault();
            var url;
            var data = $("#form-data").serializeArray();
            var newData = {};
            if($(this).html() == "增加"){
                url = "/AddUserServlet";
            }else{
                url = "UpdateUserServlet";
                data.push({"name":"user_id","value":$("#userName").attr("userId")});
            }
            data.map(function (value) {
                newData[value.name] = value.value;
            });
            $.ajax({
                url: url,
                data: {data: JSON.stringify(newData)},
                type: "POST",
                success: function (result) {
                    if (result == "true") {
                        $('#tip').fadeIn(1000);
                        $('#tip').fadeOut(1000).delay(500);
                        $("#modal").modal('hide');
                        getTopicList(currPage);
                    } else {
                        $("#modal").modal('hide');
                        console.log("操作失败");
                    }
                }
            });
        })
    });
</script>
</body>
</html>
