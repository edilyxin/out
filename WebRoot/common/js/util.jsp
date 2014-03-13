<%@ page language="java" import="java.util.*" isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib  uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/WEB-INF/page.tld" prefix="page" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link rel="stylesheet" href="<%=path%>/common/css/itemScreen1.css"  type="text/css"/>
<link rel="stylesheet" href="<%=path%>/common/css/alter.css"  type="text/css"/>
<script type="text/javascript" src="<%=path%>/js/DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=path%>/common/js/jquery-1.4.2.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/common/js/itemScreen.js"></script>
<script type="text/javascript" src="<%=path%>/common/js/table.js"></script>
<script type="text/javascript" src="<%=path%>/common/js/cdate.js"></script>
<script type="text/javascript" src="<%=path%>/js/valid.js"></script>
<script type="text/javascript" src="<%=path%>/js/select.js"></script>
<script type="text/javascript" src="<%=path%>/js/tree/selectjs.js"></script>
<script type="text/javascript" src="<%=path%>/js/My97DatePicker4.7/WdatePicker.js"></script>

<script type="text/javascript" >

 $(document).ready(function(){
 //判断SESSION是否失效
 	if("${session.userInfo}"==""){
 		alert("连接超时，请重新登陆");
		top.location = "<%=path %>/"; 
 	} 
 	//判断是否有信息传入
 	if("${message}"!="")alert("${message}");
 	//只读框变淡
	 $("input[readonly=true]").css('opacity',0.5).focus(function(){this.blur();});
	 });  
 </script>