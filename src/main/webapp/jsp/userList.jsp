<%@ page isELIgnored="false" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>超市账单管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/easyui/themes/icon.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript">
        function load() {
            //$.messager.alert('标题','确认删除吗!','warning');
            $('#test').datagrid({
                title:'用户列表',
                iconCls:'icon-add',
                width:900,
                height:500,
                collapsible:false,//是否可以折叠
                url:'${pageContext.request.contextPath}/userList?userName='+$("[name=userName]").val(),
                frozenColumns:[[ //是否冻结
                    {field:'ck',checkbox:false},
                    {title:'用户编码',field:'userCode',width:80,sortable:true}
                ]],
                columns:[[
                    {title:'用户名称',field:'userName',width:80},
                    {title:'年龄',field:'age'},
                    {title:'手机号',field:'phone'},
                    {title:'用户地址',field:'address'}
                ]],
                pageNumber:1,
                pageSize:2,
                pageList:[2,5,10,15],
                pagination:true,//分页条是否显示
                rownumbers:true,

                toolbar:[{
                    id:'btnadd',
                    text:'Add',
                    iconCls:'icon-add',
                    handler:function(){
                        $('#btnsave').linkbutton('enable');
                        alert('add')
                    }
                },{
                    id:'btncut',
                    text:'Cut',
                    iconCls:'icon-cut',
                    handler:function(){
                        $('#btnsave').linkbutton('enable');
                        alert('cut')
                    }
                },'-',{
                    id:'btnsave',
                    text:'Save',
                    disabled:true,
                    iconCls:'icon-save',
                    handler:function(){
                        $('#btnsave').linkbutton('disable');
                        alert('save')
                    }
                }]
            });
        }

        $(function () {
            load();
            //模糊查询
            $("#btnSelect").click(function () {
                load();
            });

        });
    </script>
</head>
<body>
<!--头部-->
<header class="publicHeader">
    <h1>超市账单管理系统</h1>
    <div class="publicHeaderR">
        <p><span>下午好！</span><span style="color: #fff21b"> Admin</span> , 欢迎你！</p>
        <a href="login.html">退出</a>
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
                <li  id="active"><a href="userList.jsp">用户管理</a></li>
                <li><a href="password.html">密码修改</a></li>
                <li><a href="login.html">退出系统</a></li>
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
        </div>
        <!--用户-->
        <table id="test">
        </table>
        <div class="pagination" id="pagination" style="margin:4px 0 0 0"></div>
    </div>
</section>



<footer class="footer">
    版权归北大青鸟
</footer>

</body>
</html>
