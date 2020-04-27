<#assign base=request.getContextPath()>
<!DOCTYPE html>
<html lang="en">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../js/jquery-easyui-1.7.0/themes/bootstrap/easyui.css">
    <link rel="stylesheet" type="text/css" href="../js/jquery-easyui-1.7.0/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="../js/jquery-easyui-1.7.0/demo/demo.css">
    <script type="text/javascript" src="../js/jquery-easyui-1.7.0/jquery.min.js"></script>
    <script  type="text/javascript" src="../js/jquery-easyui-1.7.0/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../js/jquery-easyui-1.7.0//locale/easyui-lang-zh_CN.js"></script>
</head>
<body>

<!-- 布局 -->
<div id="layoutID" style="width:700px;height:500px" class="easyui-layout" data-options="fit:true">

    <!-- 区域面板--北边 -->
    <div data-options="region:'north'," style="height:0px;overflow: hidden;background: #95B8E7">
        <table width="100%">
            <tr>
                <td width="50%" valign="bottom"style="font-size: 20px;color:#df0031;font-family: '楷体';">
                    山西机电职业技术学院学生运动管理系统
                </td>
                <td valign="bottom"
                    style="font-size: 20px;color:#8B8B8B;font-family: '楷体';"
                    align="right" width="50%"><font size="3">&nbsp;&nbsp;<strong>当前用户：</strong>
                   ${adminUser.name}</font>【管理员】
                </td>
            </tr>
        </table>
    </div>

    <!-- 区域面板--南边 -->
    <div data-options="region:'south',split:true,collapsible:false"  style="height:10px;"></div>

    <!-- 区域面板--东边 -->
    <div data-options="region:'east',iconCls:'icon-reload',title:'院系新闻',split:true" style="width:160px;"></div>

    <!-- 区域面板--西边 -->
    <div data-options="region:'west',title:'菜单栏',split:true" style="width:200px;">

        <div id="accordionID"
                class="easyui-accordion"
                data-options="border:true,fit:true,animate:true,selected:-1"
                style="width:300px;height:400px;">

            <!-- 面板 -->
            <div title="系统设置" data-options="iconCls:'icon-save'" style="overflow:auto;padding:10px; text-align: right;" >
                <a class="easyui-linkbutton" href="javascript:openTab(' 管理员列表','admin.ftl','icon-lxr')"
                   data-options="iconCls:'icon-man'" style="width: 100%;margin-top:10px; ">
                    管理员信息
                </a>
                <a class="easyui-linkbutton"
                   data-options="iconCls:'icon-undo'" style="width: 100%;margin-top:10px; ">
                    退出系统
                </a>



            </div>
            <div title="角色管理" data-options="iconCls:'icon-reload'" style="padding:10px;">
                上海
            </div>
            <div title="班级管理"data-options="iconCls:'icon-reload'" style="padding:10px;" >
                广州
            </div>
            <div title="运动信息"  data-options="iconCls:'icon-reload'" style="padding:10px;">
                深圳
            </div>

        </div>

    </div>

    <!-- 区域面板--中间 -->
    <div data-options="region:'center'"  title="欢迎使用本系统" style="overflow: hidden;">
        <div class="easyui-tabs" fit="true" border="false" id="index_tabs">
            <div title="首页" data-options="iconCls:'icon-home'">
                <a  href="welcom.ftl"
                   data-options="iconCls:'icon-man'" style="width: 100%;margin-top:10px; ">

                </a>
           </div>
       </div>
    </div>

</div>
<script language="JavaScript">
    function openTab(text, url, iconCls) {

        if ($("#index_tabs").tabs("exists", text)) {
            debugger;
            $("#index_tabs").tabs("close", text);
            addTab(url, text, iconCls);
            $("#index_tabs").tabs("select", text);
        } else {
            addTab(url, text, iconCls);
        }
    }
    function addTab(url, text, iconCls) {
        debugger;
        var content = "<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='${base}/view/"
                + url + "'></iframe>";
        $("#index_tabs").tabs("add", {
            title: text,
            iconCls: iconCls,
            closable: true,
            content: content
        });
    }
</script>
</body>
</html>
