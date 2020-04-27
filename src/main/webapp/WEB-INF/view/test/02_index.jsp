<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ include file="/WEB-INF/view/commons/common_js.jsp"%>
<%@ include file="/WEB-INF/view/commons/common_css.jsp"%>
<html>
  <head>
    <title>练习</title>
    
	<!-- 引入css文件，不限顺序 -->
    <link rel="stylesheet" href="themes/default/easyui.css" type="text/css"></link>
    <link rel="stylesheet" href="themes/icon.css" type="text/css"></link>
  
  	<!-- 引入js文件，有顺序限制 -->
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.easyui.min.js"></script>
    
  </head>
  <body>
	
		<!-- Layout布局 -->
		<div id="layoutID" style="width:700px;height:500px" class="easyui-layout" data-options="fit:true">
			
			<!-- 北 -->
			<div data-options="region:'north',border:true,iconCls:'icon-remove',collapsible:true" style="height:100px;">
				<center><font style="font-size:66px">jQuery-EasyUI组件</font></center>			
			</div>   
			
			<!-- 南 -->
			<div data-options="region:'south'" style="height:100px;">
				<center><font style="font-size:33px">XX公司版权所有</font></center>			
			</div>   
			
			<!-- 东 -->
			<div data-options="region:'east',iconCls:'icon-reload'" style="width:100px;"></div>   
			
			<!-- 西 -->
			<div data-options="region:'west'" style="width:200px;">
				<!-- Accordion分类 -->
				<div 
					id="accordionID" 
					class="easyui-accordion" 
					data-options="fit:true,border:false,selected:-1" 
					style="width:300px;height:400px;">   
				    <div title="部门管理" data-options="iconCls:'icon-save'" style="padding:10px;">   
				       	<!-- Linkbutton按钮 -->
						<a 
							id="btn_add" 
							href="#" 
							class="easyui-linkbutton" 
							data-options="iconCls:'icon-add'">增加部门</a><p> 
						<a 
							id="btn_find" 
							href="#" 
							class="easyui-linkbutton" 
							data-options="iconCls:'icon-search'">查询部门</a><p> 
						<a 
							id="btn_update" 
							href="#" 
							class="easyui-linkbutton" 
							data-options="iconCls:'icon-edit'">修改部门</a><p> 
						<a 
							id="btn_delete" 
							href="#" 
							class="easyui-linkbutton" 
							data-options="iconCls:'icon-remove'">删除部门</a><p>  
				    </div>   
				    <div title="人事管理" data-options="iconCls:'icon-reload'" style="padding:10px;">   
				        人事管理    
				    </div>   
				    <div title="客户管理" data-options="iconCls:'icon-reload'" style="padding:10px;">   
				        客户管理    
				    </div> 
				    <div title="权限管理" data-options="iconCls:'icon-reload'" style="padding:10px;">   
				        权限管理    
				    </div>
				    <div title="报表管理" data-options="iconCls:'icon-print'" style="padding:10px;">   
				        报表管理    
				    </div> 
				    <div title="帮助" data-options="iconCls:'icon-help'" style="padding:10px;">   
				        帮助    
				    </div>  
				</div>
			</div>   

			<!-- 中 -->
			<div data-options="region:'center'" style="padding:5px;background:#eee;">
				<!-- Tabs选项卡 -->
				<div 
					id="tabsID" 
					class="easyui-tabs" 
					style="width:500px;height:250px;"
					data-options="plain:true,border:false,selected:-1,fit:true">   
				</div>
			</div>   
			
		</div>












		<script type="text/javascript">
			//定位4个按钮
			$("a").click(function(){
				//获取你所单击的按钮的标题
				var title = $(this).text();
				//去空格
				title = $.trim(title);
				//如果title变量是"增加部门"
				if("增加部门" == title){
					//查看该选项卡是否已经打开
					var flag = $("#tabsID").tabs("exists",title);
					//如果未打开
					if(!flag){
						//打开选项卡
						$("#tabsID").tabs("add",{
							"title" : title,
							"closable" : true,
							"href" : "${pageContext.request.contextPath}/03_addGroup.jsp",
							"iconCls" : "icon-add"
						});
					}
				}else if("查询部门" == title){
					var flag = $("#tabsID").tabs("exists",title);
					if(!flag){
						//打开选项卡
						$("#tabsID").tabs("add",{
							"title" : title,
							"closable" : true,
							"content" : "文本",
							"iconCls" : "icon-search"
						});
					}
				}
			});
		</script>



  </body>
</html>








