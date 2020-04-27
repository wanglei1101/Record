<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<TITLE>登录 </TITLE>
    <link rel="stylesheet" type="text/css" href="../js/jquery-easyui-1.7.0/themes/bootstrap/easyui.css">
    <link rel="stylesheet" type="text/css" href="../js/jquery-easyui-1.7.0/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="../js/jquery-easyui-1.7.0/demo/demo.css">
    <script type="text/javascript" src="../js/jquery-easyui-1.7.0/jquery.min.js"></script>
    <script  type="text/javascript" src="../js/jquery-easyui-1.7.0/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../js/jquery-easyui-1.7.0//locale/easyui-lang-zh_CN.js"></script>

<style>

.mainDiv {
	background-color:#CFE8E9;
	height: 100%;
}

.formDiv {
	font-size: 20px; 
	margin-bottom: 20px;
}

.formDiv input {
	width: 200px; 
	height: 30px;
}

.textDiv {
	margin-top: 30px;
}

.textDiv input {
	width: 200px; 
	height: 30px;
}

.buttonDiv {
	margin-top: 30px;
    text-align:center
}

.buttonDiv input {
	width: 80px; 
	height: 40px;

}

</style>

</HEAD>

<BODY>

<div class="mainDiv" id="mydialog">

	<div>
		<div style="height: 40px;"></div>
		<div style="height: 40px; margin-top: 100px;">
			<h1 style="font-size:30px; margin-top: 100px;text-align:center"><strong>欢迎使用运动信息管理系统</strong></h1>
	    </div>

		<div class="formDiv">
			<span style="color:red; height: 30px;">  </span>
			<form id="loginform" method="post" action="">
			<div style="margin: auto auto auto 40%; text-align: left;">
				<div class="textDiv">
					<span style="width: 300px; margin-right: 20px;">用户名: </span>
					<input class="easyui-validatebox" type="text" id="loginName" data-options="required:true"/>

				</div>
				<div class="textDiv">
					<span style="width: 300px; margin-right: 40px;">密码:</span>
					<input type="password" class="easyui-validatebox" id="password" data-options="required:true"/>
				</div>
				<div class="textDiv">

				</div>

				</div>
				<div class="buttonDiv">
					<input type="button" id="loginBtn" value="确定"/>
					<input type="button" id="registerBtn" value="注册" />
				</div>
			</form>
		</div>
	</div>
	<div id="roleDialog" style="display: none;overflow: hidden;">

	</div>
</div>
<script language="JavaScript">

	//登录按钮的监听事件
    $("#loginBtn").click(function () {
        debugger;
        var admin = new Object();
        admin.loginName = $.trim($("#loginName").val());
        admin.password = $.trim($("#password").val());

        //前台的非空验证
        if(admin.loginName == "" || admin.loginName == null){
           alert("账号不能为空")
        }else if(admin.password == "" || admin.password == null){
            alert("请输入密码")
		}else {
			//异步提交
			$.ajax({
				type:'POST',//提交方式
				url:'/login/login_admin',//请求路径
				data:{adminUser:JSON.stringify(admin)},//以json的形式把数据传到前台
				success:function (result) {
					if(result == "success"){
						//验证成功后请求login_index 然后跳转到主界面
						window.location.href="/login/login_index"//window.location.href="admin/tologin.do?userid="+data.userid
					}else if(result == "fail"){
						alert("登录失败，请确认用户名密码是否正确！");
					}else {
                        alert("没有查到该用户，请重新注册");
					}
				},
			});
        }
	});


	//注册按钮的点击事件
	$("#registerBtn").click(function () {
        debugger;
            // 打开一个模态框
            /**
             * 打开一个dialog窗口
             * @param width 宽度
             * @param height 高度
             * @param title dialog标题
             * @param url 需要打开的页面url
             * @param id 页面div的id
             */
            $('#roleDialog').dialog({
                width: 400,
                height: 550,
                top : 10,
                title : "新用户注册",
                modal: true,
                collapsible: true,
                minimizable : true,
                resizable : true,
				href:'/login/login_register'
            });

    });




</script>


</BODY>

</HTML>
