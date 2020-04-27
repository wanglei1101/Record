<!DOCTYPE html PUBLIC "-/W3C/DTD XHTML 1.0 Transitional/EN" "http:/www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>请假管理</title>
    <link rel="stylesheet" type="text/css" href="../css/main_new.css" />
    <link rel="stylesheet" type="text/css" href="${contextPath}/css/easyui.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/css/icon.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/css/demo.css">
    <script type="text/javascript" src="${contextPath}/js/formatDate.js"></script>
    <script type="text/javascript" src="${contextPath}/js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/locale/easyui-lang-zh_CN.js"></script>
</head>
<body class="easyui-layout">
<div id="careRoadContentDiv" region="center" title=" 请假管理" border="false" style="overflow:hidden;">
    <table id="list"></table>
</div>

<div id="jqueryToolbar" style="padding:5px;height:auto">
    <div style="margin-top:5px; padding-bottom:8px; border-bottom:1px solid #ccc;">
        人员名称：<input type="text" id="rymc" style="width:120px" />
        人员编号：<input type="text" id="rybh" style="width:120px" />
        <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="searchData()">查询</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-reload" onclick="resetCondition()">重置</a>
    </div>
    <div style="margin-top:5px;">
        <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="create()">新增</a>
    </div>
</div>

<script type="text/javascript">
    $(function(){
        $('#list').datagrid({
            width:600,
            height:600,
            nowrap: false,
            striped: true,
            fit: true,
            idField:'id',
            url:'',
            columns:[[
                {field:'id',title:'',hidden:true},
                {field:'rybh',title:'人员编号', align:'center',width:150},
                {field:'rymc',title:'人员名称', align:'center',width:100},
                {field:'rylx',title:'人员类型', align:'center',width:100},
                {field:'sszhmc',title:'所属部门名称', align:'center',width:200},
                {field:'sqrybh',title:'授权人员编号', align:'center',width:150},
                {field:'czry',title:'操作人员', align:'center',width:120},
                {field:'czsj',title:'操作时间', align:'center',width:130},
                {field:'opt', title:'操作', width:160, align:'center', formatter:function(value, rec, index){
                        var e ='';
                        var d ='';
                        e='<a href="###" onclick="editRow('+rec.id+')">编辑</a>';
                        e += ' | ';
                        d='<a href="###" onclick="deleteRow('+rec.id+')">删除</a>';
                        d += ' | ';
                        var f = '<a href="###" onclick="showRow('+ rec.id +')">详情</a>';
                        return e+d+f;
                    }},
            ]],
            toolbar:'#jqueryToolbar',
            pagination:true,
            queryParams:{},
            onLoadSuccess:function(data){
                $('#list').datagrid('clearSelections');	//清除掉列表选中记录
                if(data.total==0){
                    $('.datagrid-body-inner').eq(0).addClass("l_elist");
                    $('.datagrid-body').eq(1).append('<div class="r_elist">无数据</div>');
                }else{
                    $('.datagrid-body-inner').eq(0).removeClass("l_elist");
                }
            }
        });

        //设置分页控件
        var p = $('#list').datagrid('getPager');
        $(p).pagination({
            pageSize: 10,//每页显示的记录条数，默认为
            pageList: [10,20,30,40,50],//可以设置每页记录条数的列表
            beforePageText: '第',//页数文本框前显示的汉字
            afterPageText: '页    共 {pages} 页',
            displayMsg: '当前显示第 {from} 到 {to} 条记录   共 {total} 条记录'/*,
			onBeforeRefresh:function(){
				$(this).pagination('loading');
				alert('before refresh');
				$(this).pagination('loaded');
			}*/
        });


    })

    function searchData() {
        var a = new Array();
        var yhm = $("#yhm").val();
        if(yhm!=null && yhm!="") a["yhm"]=yhm;
        var rymc = $("#rymc").val();
        if(rymc!=null && rymc!="") a["rymc"]=rymc;
        var rybh = $("#rybh").val();
        if(rybh!=null && rybh!="") a["rybh"]=rybh;
        doSearch(a);
    }

    function doSearch(queryParams){
        $('#list').datagrid('clearSelections');
        $("#list").datagrid('options').queryParams=queryParams;
        $("#list").datagrid('load');
    }

    function resetCondition(){
        $("#yhm").val("");
        $("#rymc").val("");
        $("#rybh").val("");
    }

    function create() {
        var url = '';
        showMaxJqueryWindow("新增用户信息", url);
    }





</script>
</body>
</html>
