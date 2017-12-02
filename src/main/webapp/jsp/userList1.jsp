<%@page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>超市账单管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/js/bootstrap/css/bootstrap.min.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jQuery1.11.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.pagination.js"></script>
    <script type="text/javascript">
        //让渡
        jQuery.noConflict();
        jQuery(function ($) {
            load(0);
            //模糊查询
            $("#btnSelect").click(function () {
                load(0);
            });
        function load(pageIndex) {
                    //清除tbody中的文本内容
                    $("#mytbody").html('');
            $.ajax({
                url:"${pageContext.request.contextPath}/userList",
                type:"POST",
                data:{"pageIndex":pageIndex,"pageSize":2,"userName":$("[name=userName]").val()},
                success:function (data) {
                    //等待其他的某个操作执行完毕后，执行success，
                    //Ajax ：status=200  readyState=4
                    //
                    $.each(data.list,function (i,dom) {  //一个个的UserInfo对象 json格式存储的
                        $('#mytbody').append(
                            '<tr><td>' + dom.userCode + '</td>                                                                                    ' +
                            '<td>' + dom.userName + '</td>                                                                                       ' +
                            '<td>' + ((dom.gender === 1) ? '男' : '女') + '</td>                                                                                        ' +
                            '<td>' + dom.age + '</td>                                                                                       ' +
                            '<td>' + dom.phone + '</td>                                                                              ' +
                            '<td>' + dom.userType + '</td>                                                                                       ' +
                            '<td>                                                                                              ' +
                            '<a href="userView.html"><img src="${pageContext.request.contextPath}/img/read.png" alt="查看" title="查看"/></a>                          ' +
                            '    <a href="userUpdate.html"><img src="${pageContext.request.contextPath}/img/xiugai.png" alt="修改" title="修改"/></a>                 ' +
                            '    <a href="#" class="removeUser"><img src="${pageContext.request.contextPath}/img/schu.png" alt="删除" title="删除"/></a>              ' +
                            '    </td></tr>                                                                                         '
                        )
                    });
                    //渲染分页页码条    条数：整张表的记录数
                    if(data.totalRecords>0){
                        $('#pagination').pagination(data.totalRecords, {
                            current_page : data.pageIndex,//默认值是0
                            items_per_page : data.pageSize,
                            num_display_entries : 3,
                            callback:load,//方法的指针，C#委托的意味：存放方法地址的一个容器
                            load_first_page : true,
                            prev_text : '上一页',
                            next_text : '下一页'
                        });
                    } else{
                        //没有检索到记录
                        $('#pagination').html('没查到相关信息');
                    }
                }
            });
        }
        });
    </script>
</head>
<body>
<!--头部-->
    <header class="publicHeader">
        <h1>超市账单管理系统</h1>
        <div class="publicHeaderR">
            <p><span>下午好！</span><span style="color: #fff21b"> Admin</span> , 欢迎你！</p>
            <a href="login.jsp">退出</a>
        </div>
    </header>
<!--时间-->
    <section class="publicTime">
        <span id="time">2015年1月1日 11:11  星期一</span>
        <a href="#">温馨提示：为了能正常浏览，请使用高版本浏览器！（IE10+）</a>
    </section>
<!--主体内容-->
    <section class="publicMian ">
        <div class="left">
            <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
            <nav>
                <ul class="list">
                    <li><a href="billList.html">账单管理</a></li>
                    <li><a href="providerList.html">供应商管理</a></li>
                    <li  id="active"><a href="userList1.jsp">用户管理</a></li>
                    <li><a href="password.html">密码修改</a></li>
                    <li><a href="login.jsp">退出系统</a></li>
                </ul>
            </nav>
        </div>
        <div class="right">
            <div class="location">
                <strong>你现在所在的位置是:</strong>
                <span>用户管理页面</span>
            </div>
            <div class="search">
                <span>用户名：</span>
                <input type="text" name="userName" placeholder="请输入用户名"/>
                <input type="button" id="btnSelect" value="查询"/>
                <a href="userAdd.jsp">添加用户</a>
            </div>
            <!--用户-->
            <table class="providerTable" cellpadding="0" cellspacing="0">
                <thead>
                <tr class="firstTr">
                    <th width="10%">用户编码</th>
                    <th width="20%">用户名称</th>
                    <th width="10%">性别</th>
                    <th width="10%">年龄</th>
                    <th width="10%">电话</th>
                    <th width="10%">用户类型</th>
                    <th width="30%">操作</th>
                </tr>
                </thead>
                <tbody id="mytbody">
                </tbody>
            </table>
            <div class="pagination" id="pagination" style="margin:4px 0 0 0"></div>
        </div>
    </section>



<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeUse">
    <div class="removerChid">
        <h2>提示</h2>
        <div class="removeMain">
            <p>你确定要删除该用户吗？</p>
            <a href="#" id="yes">确定</a>
            <a href="#" id="no">取消</a>
        </div>
    </div>
</div>

    <footer class="footer">
        版权归北大青鸟
    </footer>

<script src="/js/jquery.js"></script>
<script src="/js/js.js"></script>
<script src="/js/time.js"></script>

</body>
</html>