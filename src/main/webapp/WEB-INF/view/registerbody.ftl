<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!-- 模态窗口 -->
    <div id="win"></div>
    <!-- 对话框顶部工具栏 -->
    <!-- easyui核心JS文件 -->
    <link rel="stylesheet" type="text/css" href="../js/jquery-easyui-1.7.0/themes/bootstrap/easyui.css">
    <link rel="stylesheet" type="text/css" href="../js/jquery-easyui-1.7.0/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="../js/jquery-easyui-1.7.0/demo/demo.css">
    <script type="text/javascript" src="../js/jquery-easyui-1.7.0/jquery.min.js"></script>
    <script  type="text/javascript" src="../js/jquery-easyui-1.7.0/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../js/jquery-easyui-1.7.0//locale/easyui-lang-zh_CN.js"></script>

</head>
<body  >
<!-- 表单 -->
<form id="registerBody" >
    <div style="margin-top: 30px;text-align: center;">
        <label>登录名:</label>
        <input class="easyui-validatebox" type="text" name="loginName" data-options="required:true" />
    </div>
    <div style="text-align: center;margin: 25px">
        <label>姓名:</label>
        <input class="easyui-validatebox" type="text" name="name" data-options="required:true" />
    </div>
    <div style="text-align: center;margin: 25px">
        <label>密码:</label>
        <input class="easyui-validatebox" type="password" name="password" data-options="required:true" />
    </div>
    <div style="text-align: center;margin: 25px">
        <label>身份证号:</label>
        <input class="easyui-validatebox" type="text" name="no"  data-options="required:true"/>
    </div>
    <div style="text-align: center;margin: 25">
        <label>所属系部:</label>
        <input class="easyui-validatebox" type="text" name="department" data-options="required:true"  />
    </div>
    <div style="text-align: center;margin: 25">
        <label>手机号:</label>
        <input class="easyui-validatebox" type="text" name="phone" data-options="required:true"  />
    </div>
    <div style="text-align: center;margin: 25px">
        <label>是否为班主任:</label>
        <input class="easyui-validatebox" type="checkbox" name="isHead" name="isHead" onclick="chk()"/>
    </div>
    <div id="manageClassDiv" style="display:none;text-align: center;margin: 25px">
        <label>管理班级:</label>
        <input class="easyui-validatebox" id="manageClass" type="text" name="manageClass" data-options="required:true"  />
    </div>
    <div id="dlg-buttons" style="text-align: center">
        <a class="easyui-linkbutton" style="margin: 15px" data-options="iconCls:'icon-save'" id="save">保存</a>
        <a class="easyui-linkbutton" style="margin: 15px" data-options="iconCls:'icon-cancel'" onclick="javascript:$('#roleDialog').dialog('close')">关闭</a>
    </div>
</form>


<script type="text/javascript">

    //选中是否为班主任时 隐藏或者出现所带班级
    function chk(){
        if($('#isHead').prop("checked")){
            $("#manageClassDiv").show();
        }else{
            $("#manageClassDiv").hide();
        }
    }
    //给保存按钮设置监听
    $("#save").click(function () {
        debugger;
        var adminUser = $("#registerBody").serializeArray();
        var values = {};
        for (var item in adminUser) {
            values[adminUser[item].name] = adminUser[item].value;
        }

        $.ajax({
            type:'POST',//提交方式
            url:'/login/login_saveAdmin',//请求路径
            data:{adminUser:JSON.stringify(values)},//以json的形式把数据传到前台
            success:function (result) {
                if("success" == result){
                    alert("注册成功");
                    //重定向到登录界面
                    window.location.href="/login/login";
                }else{
                    alert("注册失败，请重新尝试或与管理员联系");
                }
            },
        });

    });

    //用于封装表单数据到对象
    function modol() {
        var adminUser = new Object();
        adminUser.loginName = $.trim($("#loginName").val());
        adminUser.name = $.trim($("#name").val());
        adminUser.password = $.trim($("#password").val());
        adminUser.no = $.trim($("#no").val());
        adminUser.department = $.trim($("#department").val());
        adminUser.phone = $.trim($("#phone").val());
        adminUser.isHead = $.trim($("#isHead").val());
        adminUser.manageClass = $.trim($("#manageClass").val());
        return adminUser;
    }



</script>
</body>
</html>
