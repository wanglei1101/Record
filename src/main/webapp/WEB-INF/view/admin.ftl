<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>管理员列表</title>
    <link rel="stylesheet" type="text/css" href="../js/jquery-easyui-1.7.0/themes/bootstrap/easyui.css">
    <link rel="stylesheet" type="text/css" href="../js/jquery-easyui-1.7.0/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="../js/jquery-easyui-1.7.0/demo/demo.css">
    <script type="text/javascript" src="../js/jquery-easyui-1.7.0/jquery.min.js"></script>
    <script  type="text/javascript" src="../js/jquery-easyui-1.7.0/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../js/jquery-easyui-1.7.0//locale/easyui-lang-zh_CN.js"></script>
</head>
<body class="easyui-layout">
<div style="padding:8px;height:50px">
    参数项名称: <input class="easyui-validatebox" type="text" name="name" data-options="required:true">
    创建时间: <input class="easyui-datebox" name="createTime" style="width:80px">
    <a href="#" class="easyui-linkbutton" iconCls="icon-search">查找</a>
    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>
</div>
<div data-options="region:'center',">
    <table id="list_data" class="easyui-datagrid" style="width:100%;height:auto;">
        <thead>
        <tr>
            <th field="name" width="100">姓名</th>
            <th field="address" width="100">地址</th>
            <th field="sex" width="100">性别</th>
            <th field="idCard" width="100">身份证</th>
            <th field="birth_Date" width="100">出生日期</th>
            <th field="issue_Date" width="100">班级</th>
            <th field="permit_Type" width="100">手机号码</th>
            <th field="expiration_Date" width="100">地址</th>
            <th field="carNum" width="100">地址</th>
            <th field="id" width="100">id</th>
        </tr>
        </thead>
    </table>
</div>

<script>
    //自动发请求到url，并把返回的数据自动填入
    $('#list_data').datagrid({
        url: ' ',
        dataType:'JSONP',
        rownumbers: true,
        singleSelect: true,
        pagination: true,
        idField: 'id',
        fitColumns: true,
        fit: true,
        nowarp: false,
        border: false,
        pageSize: 5,
        pageList: [5, 10],
    });
</script>


</body>
</html>