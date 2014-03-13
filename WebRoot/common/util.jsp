<%@ page language="java" import="java.util.*" isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib  uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/WEB-INF/page.tld" prefix="page" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript" >
 nowpath = "<%=path %>/";
</script>
<script type="text/javascript" src="<%=path%>/js/jquery-1.4.2.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery-ui-1.8.16.custom.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/valid.js"></script>
<script type="text/javascript" src="<%=path%>/js/select.js"></script>
<script type="text/javascript" src="<%=path%>/js/util.js"></script>
<script type="text/javascript" src="<%=path%>/js/DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=path%>/js/tree/selectjs.js"></script>
<script type="text/javascript" src="<%=path%>/js/tree/treejs.js"></script>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/text.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/validate.css"  />
<link rel="stylesheet" type="text/css" href="<%=path%>/css/stylecss.css">
<link rel="stylesheet" href="<%=path%>/common/css/itemScreen1.css"  type="text/css"/>
<link rel="stylesheet" href="<%=path%>/common/css/alter.css"  type="text/css"/> 
<script type="text/javascript" src="<%=path%>/js/jquery.bgiframe.min.js"></script>
<link href="<%=path%>/css/skin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" >
 
 $(function(){
 //判断SESSION是否失效
 	if("${session.userInfo}"==""){
// 		alert("连接超时，请重新登陆");
		top.location = "<%=path %>/jsp/error.jsp"; 
 	}
 	getwidth();
 	$(window).resize(function(){getwidth();});
		
 	//判断是否有信息传入
 	if("${message}"!="")alert("${message}");
 	//只读框变淡
	 $("input[readonly=true]").css('opacity',0.7).focus(function(){this.blur();});
	 $(".table tr").each(function(index){
			$(this).mouseover(function(){
				if(index>0)
				$(".table tr:eq("+index+")").css("background","#CBE0FF");
				});
			$(this).mouseout(function(){
				if(index>0)
				$(".table tr:eq("+index+")").css("background","#fff");
				});
		});
		
	 });  
	 
/**
员工放大镜 
1.编号对应标签ID
2.员工名称对应 标签ID 
3.职称post_sname
4.学历类型 ditem_sname2
5.emp_sename	英文名
6.emp_nworknum	工龄数
7.学校8学部9学院10系11校区编号12职务13单位编号（鲁）,14员工编号，15除了该员工以外的所有员工
*/
function empTree(text1,text2,val3,val4,val5,val6,ud_sno,ud_sno1,ud_sno2,ud_sno3,sh_sno,job_sno,searchG,emp_sno,searchF){
	var dataPath = "?1=1"; 
	if(emp_sno!=undefined&&emp_sno!=null&&emp_sno!=""){
		dataPath+="&form.emp_sno="+emp_sno;
	}
	if(searchF!=undefined&&searchF!=null&&searchF!=""){
		dataPath+="&form.searchF="+searchF;
	}
	if(ud_sno!=undefined&&ud_sno!=null&&ud_sno!=""){
		dataPath+="&form.ud_sno="+ud_sno;
	}
	if(ud_sno1!=undefined&&ud_sno1!=null&&ud_sno1!=""){
		dataPath+="&form.ud_sno1="+ud_sno1;
	}
	if(ud_sno2!=undefined&&ud_sno2!=null&&ud_sno2!=""){
		dataPath+="&form.ud_sno2="+ud_sno2;
	}
	if(ud_sno3!=undefined&&ud_sno3!=null&&ud_sno3!=""){
		dataPath+="&form.ud_sno3="+ud_sno3;
	}
	if(sh_sno!=undefined&&sh_sno!=null&&sh_sno!=""){
		dataPath+="&form.sh_sno="+sh_sno;
	} 
	if(job_sno!=undefined&&job_sno!=null&&job_sno!=""){
		dataPath+="&form.job_sno="+job_sno;
	} 
	if(searchG!=undefined&&searchG!=null&&searchG!=""){
		dataPath+="&form.searchG="+searchG;
	} 
   return tree6(text1,text2,val3,val4,val5,val6,'<%=path%>/tree!findEmp'+dataPath);
   
	
	
	
}
//单位放大镜 1.编号对应标签ID 2.名称对应 标签ID 
function compTree(text1,text2){
	tree(text1,text2,'<%=path%>/tree!findComp');
}
//部门放大镜 1.编号对应标签ID 2.名称对应 标签ID 3.所属单位编号
function depTree(text1,text2,compno){
	var dataPath = "?1=1"; 
	if(compno!=undefined&&compno!=null&&compno!=""){
		dataPath+="&form.comp_sno="+compno;
	}
	tree(text1,text2,'<%=path%>/tree!findDep'+dataPath);
}
//用户放大镜 1.用户ID对应标签ID 2.用户名称对应 标签ID 
function userTree(text1,text2){
	var dataPath = "?1=1"; 
	tree(text1,text2,'<%=path%>/tree!findUser'+dataPath);
}
//学期放大镜 1.学期ID对应标签ID 2.学期名称对应 标签ID 
function xueqiTree(text1,text2,text3){
	var dataPath = "?1=1"; 
	tree2(text1,text2,text3,'<%=path%>/tree!findxueqi'+dataPath);
}


	//部门放大镜,单位编号，上级编号,单位层次，员工编号,校区编号,隶属层次,选取单位层次为2，3层单位
function unitDepartTree(text1,text2,udno,ud_stopno,ud_nnumber,emp_sno,sh_sno,ud_stop,searchH){
	var dataPath="?1=1";
	if(udno!=undefined&&udno!=null&&udno!=""){//searchA,ud_sno
		dataPath+="&form.searchA="+udno;
	}
	if(ud_stopno!=undefined&&ud_stopno!=null&&ud_stopno!=""){//searchA,ud_sno
		dataPath+="&form.ud_stopno="+ud_stopno;
	}
	//alert(ud_nnumber);
	if(ud_nnumber!=undefined&&ud_nnumber!=null&&ud_nnumber!=""){//searchA,ud_sno
		dataPath+="&form.ud_nnumber="+ud_nnumber;
	}
	if(emp_sno!=undefined&&emp_sno!=null&&emp_sno!=""){//searchA,ud_sno
		dataPath+="&form.searchG="+emp_sno;
	}
	if(sh_sno!=undefined&&sh_sno!=null&&sh_sno!=""){//searchA,ud_sno
		dataPath+="&form.sh_sno="+sh_sno;
	}
	if(ud_stop!=undefined&&ud_stop!=null&&ud_stop!=""){//searchA,ud_sno
		dataPath+="&form.ud_stop="+ud_stop;
	}
	if(searchH!=undefined&&searchH!=null&&searchH!=""){//searchA,ud_sno
		dataPath+="&form.searchH="+searchH;
	}
	tree(text1,text2,'<%=path%>/tree!findUD'+dataPath);
}
	//
	//权限控制六位数字1能返回，0不能返回,单位层次，上级编号, 
	/**部门放大镜,1单位编号对应的页面ID
	*2单位名称对应的页面ID
	*3权限控制六位数字1能返回
	*4对二级单位的控制，只能显示写进去的二级部门编号
	*5单位层次
	*6单位编号
	*
	*/ 
function unitDepartTree1(text1,text2,switchs,ud_snos,ud_stype,udno){
	var dataPath="?1=1";
	if(udno!=undefined&&udno!=null&&udno!=""){//searchA,ud_sno
		dataPath+="&form.searchA="+udno;
	}
	if(ud_stype!=undefined&&ud_stype!=null&&ud_stype!=""){//searchA,ud_sno
		dataPath+="&form.ud_stype="+ud_stype;
	}
	if(ud_snos!=undefined&&ud_snos!=null&&ud_snos!=""){//searchA,ud_sno
		dataPath+="&ud_snos="+ud_snos;
	}
	if(switchs!=undefined&&switchs!=null&&switchs!=""){//searchA,ud_sno
		dataPath+="&switchs="+switchs;
	}
	//,text3,text4,text5,text6,text7,text8,text9,text10,text11,text12,text13,text14
	tree(text1,text2,'<%=path%>/tree!findUD1'+dataPath);
}

/*
 * @param text1 招标代理机构ID
 * @param text2 招标代理机构名称
 * @param agency_sstandby2 代理类型（0内贸；1外贸）
 */
function bidAgencyTree(text1,text2, agency_sstandby2) {
	var dataPath = "?form.isTree=0";//isTree(0是，1否)是否为放大镜查询；此参数只是为了区分普通查询与放大镜查询，以不影响普通查询
	if(agency_sstandby2!=undefined&&agency_sstandby2!=null&&agency_sstandby2!=""){//searchA,ud_sno
		dataPath+="&form.agency_sstandby2="+agency_sstandby2;
	}
	tree(text1,text2,'<%=path%>/bidAgency!findTree'+dataPath, '500px', '850px');
}
	//学校放大镜 部门编号,组织编号
function schoolTree(text1,text2,ud_sno,lo_sno){
	var dataPath="?1=1";
	if(ud_sno!=undefined&&ud_sno!=null&&ud_sno!=""){//sh_sno
		dataPath+="&form.ud_sno="+ud_sno;
	}
	if(lo_sno!=undefined&&lo_sno!=null&&lo_sno!=""){//sh_sno
		dataPath+="&form.lo_sno="+lo_sno;
	}
	tree(text1,text2,'<%=path%>/tree!findSchool'+dataPath);
}	
function schoolTreecheck(text1,text2,shno){
	var dataPath="?1=1";
	if(shno!=undefined&&shno!=null&&shno!=""){//sh_sno
		dataPath+="&form.searchA="+shno;
	}
	tree(text1,text2,'<%=path%>/tree!findSchoolcheck'+dataPath+"&sh_sno=" +$("#"+ text1).val() );
}
//岗位放大镜 1.编号对应标签ID 2.名称对应 标签ID 3.单位部门编号 
function jobTree(text1,text2,depno){
	var dataPath = "?1=1"; 
	if(depno!=undefined&&depno!=null&&depno!=""){//ud_sno,单位
		dataPath+="&form.ud_sno="+depno;
	}
	tree(text1,text2,'<%=path%>/tree!findJob'+dataPath);
}
/*//班组放大镜 1.编号对应标签ID 2.名称对应 标签ID 3.所属部门编号 
function classTree(text1,text2,depno){
	var dataPath = "?1=1"; 
	if(depno!=undefined&&depno!=null&&depno!=""){
		dataPath+="&form.dep_sno="+depno;
	}
	tree(text1,text2,'/tree!findClas'+dataPath);
} */
//团队放大镜 1.编号对应标签ID 2.名称对应 标签ID 3.班组编号 
function teamTree(text1,text2,classno){
	var dataPath = "?1=1"; 
	if(classno!=undefined&&classno!=null&&classno!=""){
		dataPath+="&form.class_sno="+classno;
	}
	tree(text1,text2,'<%=path%>/tree!findTeam'+dataPath);
}
//项目放大镜 1.编号对应标签ID 2.名称对应 标签ID 3.项目类型（0大项目1小项目）
function proTree(text1,text2,pitype){
var dataPath = "?1=1"; 
	if(pitype!=undefined&&pitype!=null&&pitype!=""){
		dataPath+="&form.pi_stype="+pitype;
	}

	tree(text1,text2,'<%=path%>/tree!findPro'+dataPath);
}
//客户放大镜 1.编号对应标签ID 2.名称对应 标签ID 
function custTree(text1,text2){
	tree(text1,text2,'<%=path%>/tree!findCust');
}
 
//合作企业放大镜 1.编号对应标签ID 2.名称对应 标签ID 
function coopTree(text1,text2){
	tree(text1,text2,'<%=path%>/tree!findCoop');
}
//系统信息放大镜 1.编号对应标签ID 2.名称对应 标签ID 
function sysintTree(text1,text2,sysint_sno){
var dataPath = "?1=1"; 
	if(sysint_sno!=undefined&&sysint_sno!=null&&sysint_sno!=""){
		dataPath+="&form.sysint_sno="+sysint_sno;
	}
	tree(text1,text2,'<%=path%>/tree!findSysint'+dataPath);
}
//功能放大镜 1.编号对应标签ID 2.名称对应 标签ID ,3功能编号,4系统编号
function rightTree(text1,text2,right_sno,sysint_sno){
var dataPath = "?1=1"; 
	if(right_sno!=undefined&&right_sno!=null&&right_sno!=""){
		dataPath+="&form.right_sno="+right_sno;
	}
	if(sysint_sno!=undefined&&sysint_sno!=null&&sysint_sno!=""){
		dataPath+="&form.sysint_sno="+sysint_sno;
	}
	tree(text1,text2,'<%=path%>/tree!findRight'+dataPath);
}
//
/*
楼栋信息放大镜1.楼栋编号对应标签ID 2.楼栋名称对应 标签ID ,
3.校区编号对应标签ID，4校区名称对应标签ID
5单位编号对应标签ID，6单对应标签ID位名称
7房屋编号,8校区编号，9单位编号
10.hs_scode	楼栋代码对应标签ID
*/
function houseTree(text1,text2,val3,val4,val5,val6,hs_sno,sh_sno,ud_sno,val7){
var dataPath = "?1=1"; 
	if(hs_sno!=undefined&&hs_sno!=null&&hs_sno!=""){
		dataPath+="&form.hs_sno="+hs_sno;
	}
	if(sh_sno!=undefined&&sh_sno!=null&&sh_sno!=""){
		dataPath+="&form.sh_sno="+sh_sno;
	}
	if(ud_sno!=undefined&&ud_sno!=null&&ud_sno!=""){
		dataPath+="&form.ud_sno="+ud_sno;
	}
	tree9(text1,text2,val3,val4,val5,val6,val7,'<%=path%>/tree!findHouse'+dataPath);
}

/**
楼栋单元信息放大镜1.单元编号对应标签ID 2.单元名称对应 标签ID 
3.sh_sno	校区编号对应标签ID
4.sh_sname	校区名称对应 标签ID 
5.ud_sno	单位编号对应 标签ID
6.ud_sname	单位名称对应 标签ID 
7.hs_sno	楼栋编号对应 标签ID
8.hs_sname	楼栋名称对应 标签ID 
9楼栋编号,10单元编号，,11校区编号，12单位编号
**/
function houseUnitTree(text1,text2,text3,text4,text5,text6,text7,text8,hs_sno,hu_sno,sh_sno,ud_sno){
var dataPath = "?1=1"; 
	if(hs_sno!=undefined&&hs_sno!=null&&hs_sno!=""){
		dataPath+="&form.hs_sno="+hs_sno;
	}
	if(hu_sno!=undefined&&hu_sno!=null&&hu_sno!=""){
		dataPath+="&form.hu_sno="+hu_sno;
	}
	if(sh_sno!=undefined&&sh_sno!=null&&sh_sno!=""){
		dataPath+="&form.sh_sno="+sh_sno;
	}
		if(ud_sno!=undefined&&ud_sno!=null&&ud_sno!=""){
		dataPath+="&form.ud_sno="+ud_sno;
	}
	tree4(text1,text2,text3,text4,text5,text6,text7,text8,'<%=path%>/tree!findHouseUnit'+dataPath);
}
//楼栋楼层信息放大镜1.编号对应标签ID 2.名称对应 标签ID ,楼栋编号,单元编号，楼层编号,校区编号，单位编号
function houseLayerTree(text1,text2,hs_sno,hu_sno,hl_sno,sh_sno,ud_sno){
var dataPath = "?1=1"; 
	if(hs_sno!=undefined&&hs_sno!=null&&hs_sno!=""){
		dataPath+="&form.hs_sno="+hs_sno;
	}
	if(hu_sno!=undefined&&hu_sno!=null&&hu_sno!=""){
		dataPath+="&form.hu_sno="+hu_sno;
	}
	if(hl_sno!=undefined&&hl_sno!=null&&hl_sno!=""){
		dataPath+="&form.hl_sno="+hl_sno;
	}
	if(sh_sno!=undefined&&sh_sno!=null&&sh_sno!=""){
		dataPath+="&form.sh_sno="+sh_sno;
	}
		if(ud_sno!=undefined&&ud_sno!=null&&ud_sno!=""){
		dataPath+="&form.ud_sno="+ud_sno;
	}
	tree(text1,text2,'<%=path%>/tree!findHouseLayer'+dataPath);
}
//楼栋楼层信息放大镜1.编号对应标签ID 2.名称对应 标签ID ,楼栋编号,单元编号，楼层编号,校区编号，单位编号
function houseLayerTree1(text1,text2,text3,text4,text5,text6,text7,text8,text9,text10,hs_sno,hu_sno,hl_sno,sh_sno,ud_sno){
var dataPath = "?1=1"; 
	if(hs_sno!=undefined&&hs_sno!=null&&hs_sno!=""){
		dataPath+="&form.hs_sno="+hs_sno;
	}
	if(hu_sno!=undefined&&hu_sno!=null&&hu_sno!=""){
		dataPath+="&form.hu_sno="+hu_sno;
	}
	if(hl_sno!=undefined&&hl_sno!=null&&hl_sno!=""){
		dataPath+="&form.hl_sno="+hl_sno;
	}
	if(sh_sno!=undefined&&sh_sno!=null&&sh_sno!=""){
		dataPath+="&form.sh_sno="+sh_sno;
	}
		if(ud_sno!=undefined&&ud_sno!=null&&ud_sno!=""){
		dataPath+="&form.ud_sno="+ud_sno;
	}
	tree1(text1,text2,text3,text4,text5,text6,text7,text8,text9,text10,'<%=path%>/tree!findHouseLayer1'+dataPath);
}

/*
房间信息放大镜1.房间编号对应标签ID 2.房间名称对应 标签ID ,
3校区名称对应标签ID，4校区编号对应标签ID
5单位名称对应标签ID，6单位编号对应标签ID
7楼栋名称对应标签ID，8楼栋编号对应标签ID
9单元名称对应标签ID，10单元主键对应标签ID
11楼层名称对应标签ID，12楼层主键对应标签ID
13楼栋编号,14单元编号，15楼层编号，16房屋信息,17校区编号，18单位编号
19.rm_scode房间号对应标签ID
*/
function roomTree(text1,text2,text3,text4,text5,text6,text7,text8,text9,text10,text11,text12,hs_sno,hu_sno,hl_sno,rm_sno,sh_sno,ud_sno,text13){
var dataPath = "?1=1"; 
	if(hs_sno!=undefined&&hs_sno!=null&&hs_sno!=""){
		dataPath+="&form.hs_sno="+hs_sno;
	}
	if(hu_sno!=undefined&&hu_sno!=null&&hu_sno!=""){
		dataPath+="&form.hu_sno="+hu_sno;
	}
	if(hl_sno!=undefined&&hl_sno!=null&&hl_sno!=""){
		dataPath+="&form.hl_sno="+hl_sno;
	}
	if(rm_sno!=undefined&&rm_sno!=null&&rm_sno!=""){
		dataPath+="&form.rm_sno="+rm_sno;
	}
	if(sh_sno!=undefined&&sh_sno!=null&&sh_sno!=""){
		dataPath+="&form.sh_sno="+sh_sno;
	}
		if(ud_sno!=undefined&&ud_sno!=null&&ud_sno!=""){
		dataPath+="&form.ud_sno="+ud_sno;
	}
	tree10(text1,text2,text3,text4,text5,text6,text7,text8,text9,text10,text11,text12,text13,'<%=path%>/tree!findRoom'+dataPath);
}
//资产分类放大镜1.编号对应标签ID 2.名称对应 标签ID，分类:0.国际1.教育1.财务3.学校，资产类型编号,单位编号
function asstesTypeTree(text1,text2,ast_stype,ast_sno,ud_sno){
var dataPath = "?1=1"; 
	if(ast_stype!=undefined&&ast_stype!=null&&ast_stype!=""){
		dataPath+="&form.ast_stype="+ast_stype;
	}
	if(ast_sno!=undefined&&ast_sno!=null&&ast_sno!=""){
		dataPath+="&form.ast_sno="+ast_sno;
	}
	if(ud_sno!=undefined&&ud_sno!=null&&ud_sno!=""){
		dataPath+="&form.ud_sno="+ud_sno;
	}
	tree(text1,text2,'<%=path%>/tree!findAsstesType'+dataPath);
}
//学历放大镜1.编号对应标签ID 2.名称对应 标签ID，学历编号
function degreetypeTree(text1,text2,degt_sno){
var dataPath = "?1=1"; 
	if(degt_sno!=undefined&&degt_sno!=null&&degt_sno!=""){
		dataPath+="&form.degt_sno="+degt_sno;
	}
	
	tree(text1,text2,'<%=path%>/tree!findDegreetype'+dataPath);
}
//专业放大镜
/*1.专业编号对应标签ID 2.专业名称对应 标签ID
*3专业简称对应的标签ID，4单位名称对用的标签ID
*5类型对应的标签ID6，所属学科名称
*，7专业编号，8学科编号.9单位编号
*/
function professionTree(text1,text2,text3,text4,text5,text6,text7,text8,prof_sno,xk_sno,ud_sno){
var dataPath = "?1=1"; 
	if(prof_sno!=undefined&&prof_sno!=null&&prof_sno!=""){
		dataPath+="&form.prof_sno="+prof_sno;
	}
	if(xk_sno!=undefined&&xk_sno!=null&&xk_sno!=""){//学科编号
		dataPath+="&form.prof_sdef1="+xk_sno;
	}
	if(ud_sno!=undefined&&ud_sno!=null&&ud_sno!=""){
		dataPath+="&form.ud_sno="+ud_sno;
	}
	tree4(text1,text2,text3,text4,text5,text6,text7,text8,'<%=path%>/tree!findProfession'+dataPath);
}
/*
课程放大镜
1.课程编号对应标签ID 
2.课程名称对应 标签ID，
3.课程简称对应的标签ID
4，部门编号对应的标签ID
5，部门名称对应的标签ID
6，类别对应的标签ID
7，专业编号对应的标签ID
8，专业名称对应的标签ID
9.总学时数对应的标签ID
10.学分数对应的标签ID
11.课程编号，12专业编号，13学科编号
*/
function courseTree(text1,text2,text3,text4,text5,text6,text7,text8,text9,text10,course_sno,prof_sno,xk_sno){
var dataPath = "?1=1"; 
	if(course_sno!=undefined&&course_sno!=null&&course_sno!=""){
		dataPath+="&form.course_sno="+course_sno;
	}
	if(prof_sno!=undefined&&prof_sno!=null&&prof_sno!=""){
		dataPath+="&form.prof_sno="+prof_sno;
	}
	if(xk_sno!=undefined&&xk_sno!=null&&xk_sno!=""){
		dataPath+="&form.xk_sno="+xk_sno;
	}
	tree1(text1,text2,text3,text4,text5,text6,text7,text8,text9,text10,'<%=path%>/tree!findCourse'+dataPath);
}
//教研组放大镜1.编号对应标签ID 2.名称对应 标签ID，3.调研组编号，4，校区编号，5部门编号
function teachgroupTree(text1,text2,tg_sno,sh_sno,ud_sno){
var dataPath = "?1=1"; 
	if(tg_sno!=undefined&&tg_sno!=null&&tg_sno!=""){
		dataPath+="&form.tg_sno="+tg_sno;
	}
	if(sh_sno!=undefined&&sh_sno!=null&&sh_sno!=""){
		dataPath+="&form.sh_sno="+sh_sno;
	}
	if(ud_sno!=undefined&&ud_sno!=null&&ud_sno!=""){
		dataPath+="&form.ud_sno="+ud_sno;
	}
	
	tree(text1,text2,'<%=path%>/tree!findTeachgroup'+dataPath);
}

/**
//学生信息放大镜1.学生编号对应标签ID 2.学生名称对应 标签ID，3性别，
4.班级对应标签ID 5.专业对应标签ID6. 院系对应标签ID 
6.学生编号
**/
function studentTree(text1,text2,text3,text4,text5,text6,st_sno){
var dataPath = "?1=1"; 
	if(st_sno!=undefined&&st_sno!=null&&st_sno!=""){
		dataPath+="&form.st_sno="+st_sno;
	}
	tree6(text1,text2,text3,text4,text5,text6,'<%=path%>/tree!findStudent'+dataPath);
}

/**
班级信息放大镜
1.班级编号编号对应标签ID
2.班级名称对应 标签ID，
3.专业编号对应标签ID
4.专业名称对应标签ID
5.部门编号对应标签ID
6.部门名称对应标签ID
7.校区编号对应标签ID
8.校区名称对应标签ID
9.班级编号，10专业编号，11，部门编号
*/
function classTree(text1,text2,text3,text4,text5,text6,text7,text8,class_sno,prof_sno,ud_sno){
var dataPath = "?1=1"; 
	if(class_sno!=undefined&&class_sno!=null&&class_sno!=""){
		dataPath+="&form.class_sno="+class_sno;
	}
	if(prof_sno!=undefined&&prof_sno!=null&&prof_sno!=""){
		dataPath+="&form.prof_sno="+prof_sno;
	}
	if(ud_sno!=undefined&&ud_sno!=null&&ud_sno!=""){
		dataPath+="&form.ud_sno="+ud_sno;
	}
	tree4(text1,text2,text3,text4,text5,text6,text7,text8,'<%=path%>/tree!findClass'+dataPath);
}
function classTree1(a,b)
{
	var no = "";
	var name = "";
    Str="<%=path%>/tree!findClass1";
    var returnValue= window.showModalDialog(Str,"windSel",'dialogWidth:700px;dialogHeight:600px;dialogLeft:300px;dialogTop:100px;center:yes;help:yes;resizable:yes;status:yes');
	//alert(returnValue);
	if (returnValue == undefined) {
	    returnValue = window.returnValue;
	}
	//alert(returnValue);
	
	  if(returnValue=="" || returnValue==undefined ||returnValue==null)
	  {  
	  	alert(11111);
	  	$('#'+a).val('');
	      $('#'+b).val(''); 
	  }else{
	  	if(returnValue.indexOf("@")!=-1){
	      adddata=returnValue.split("@");
	      for(var i=0;i<adddata.length;i++){
	      	//alert(adddata[i]);
	      	var aa = adddata[i].split(";");
	      	if(i == adddata.length - 1){
	      		no += aa[0];
	        	name += aa[1];
	      	}else{
	      		no += aa[0]+",";
	        	name += aa[1]+",";
	      	}
	      }
	      }else{
	      	var aa = returnValue.split(";");
	      	no += aa[0];
	        name += aa[1];
	      }
	      $('#'+a).val(no);
	      $('#'+b).val(name);
    }

}
/**
*组织架构放大镜
1.组织架构编号
2.组织架构名称或员工姓名
3所属部门编号，
4所属部门名称对应的标签ID
5组织架构简称或员工编号对应的标签ID
6实验室类别对应的标签ID
7.类别:0管理机构、1人员、2中心机构
8.隶属层次
9.隶属机构：上级机构
10.所属部门编号
11.组织架构层次：0实设处，1实验室管理科,2实验中心,3实验分中心,4实验室
12根据组织架构编号得到其所有的子部门
13根据组织架构求出该组织的负责人以及上级组织的负责人；由下级求上级,该字段得到是的（人员） ,使用时必须将类别设置为1人员
14根据组织的负责人求出组织架构以及下级；自评人员(上级)=》评估对象（下级），该字段得到的是（组织架构）,使用时必须将类别设置为0管理机构
15.选取组织架构层次为1，2,3的组织架
16.选取组织架构层次为1，2的组织架
*/
function labOrgTree(text1,text2,text3,text4,text5,text6,lo_stype,lo_stop,lo_stopno,ud_sno,lo_nnumber,searchE,searchF,searchG,searchH,searchI){
var dataPath = "?1=1"; 
	if(lo_stype!=undefined&&lo_stype!=null&&lo_stype!=""){
		dataPath+="&form.lo_stype="+lo_stype;
	}
	if(lo_stop!=undefined&&lo_stop!=null&&lo_stop!=""){
		dataPath+="&form.lo_stop="+lo_stop;
	}
	if(lo_stopno!=undefined&&lo_stopno!=null&&lo_stopno!=""){
		dataPath+="&form.lo_stopno="+lo_stopno;
	}
	if(ud_sno!=undefined&&ud_sno!=null&&ud_sno!=""){
		dataPath+="&form.ud_sno="+ud_sno;
	}
	if(lo_nnumber!=undefined&&lo_nnumber!=null&&lo_nnumber!=""){
		dataPath+="&form.lo_nnumber="+lo_nnumber;
	}
	if(searchE!=undefined&&searchE!=null&&searchE!=""){
		dataPath+="&form.searchE="+searchE;
	}
	if(searchF!=undefined&&searchF!=null&&searchF!=""){
		dataPath+="&form.searchF="+searchF;
	}
	if(searchG!=undefined&&searchG!=null&&searchG!=""){
		dataPath+="&form.searchG="+searchG;
	}
	if(searchH!=undefined&&searchH!=null&&searchH!=""){
		dataPath+="&form.searchH="+searchH;
	}
	if(searchI!=undefined&&searchI!=null&&searchI!=""){
		dataPath+="&form.searchI="+searchI;
	}
	tree6(text1,text2,text3,text4,text5,text6,'<%=path%>/tree!findLabOrg'+dataPath);
}
/**

*实验室放大镜
1.实验室编号对应标签ID  
2.实验室名称对应 标签ID，组织名称
3.实验室编号对应标签ID  单位ID
4.实验室名称对应 标签ID，单位名称
5.实验室类型名称对应标签ID
6.实验室类别名称对应标签ID
7.sh_ssupno	所属校区
8.ud_ssupno	隶属部门
9.lo_ssupno	组织架构编码
10.组织架构编码：根据组织架构编码得到其所有的子部门
11.由组织架构编号求其本身或者下级组织架构对应的实验室
*/
function labOrgTree1(text1,text2,text3,text4,text5,text6,sh_ssupno,ud_ssupno,lo_ssupno,searchE,searchH){
var dataPath = "?1=1"; 
	if(sh_ssupno!=undefined&&sh_ssupno!=null&&sh_ssupno!=""){
		dataPath+="&form.sh_ssupno="+sh_ssupno;
	}
	if(ud_ssupno!=undefined&&ud_ssupno!=null&&ud_ssupno!=""){
		dataPath+="&form.ud_ssupno="+ud_ssupno;
	}
	if(lo_ssupno!=undefined&&lo_ssupno!=null&&lo_ssupno!=""){
		dataPath+="&form.lo_ssupno="+lo_ssupno;
	}
	if(searchE!=undefined&&searchE!=null&&searchE!=""){
		dataPath+="&form.searchE="+searchE;
	}
	if(searchH!=undefined&&searchH!=null&&searchH!=""){
		dataPath+="&form.searchH="+searchH;
	}
	tree6(text1,text2,text3,text4,text5,text6,'<%=path%>/tree!findLabOrgSys'+dataPath);
}

  //管控设置放大镜1.管控设备编号，对应 标签ID， 2.管控设备名称对应 标签ID，
function guanKongEquTree(text1,text2,gqu_sno){
var dataPath = "?1=1"; 
	if(gqu_sno!=undefined&&gqu_sno!=null&&gqu_sno!=""){
		dataPath+="&form.gqu_sno="+gqu_sno;
	}
	tree(text1,text2,'<%=path%>/tree!findGuanKongEqu'+dataPath);
}
/**
实验室岗位管理放大镜
1.岗位编号对应标签ID 
2.名称对应 标签ID，
3.隶属部门编号对应标签ID
4.隶属部门名称对应标签ID
5.组织架构编号对应标签ID
6.组织架构名称对应标签ID
7.实验室岗位类别，
8组织架构编号，
9，实验室岗位编号
*/
function labPostTree(text1,text2,text3,text4,text5,text6,lp_stype,lo_sno,lp_sno){
var dataPath = "?1=1"; 
	if(lp_sno!=undefined&&lp_sno!=null&&lp_sno!=""){
		dataPath+="&form.lp_sno="+lp_sno;
	}
	if(lp_stype!=undefined&&lp_stype!=null&&lp_stype!=""){
		dataPath+="&form.lp_stype="+lp_stype;
	}
	if(lo_sno!=undefined&&lo_sno!=null&&lo_sno!=""){
		dataPath+="&form.lo_sno="+lo_sno;
	}
	tree6(text1,text2,text3,text4,text5,text6,'<%=path%>/tree!findLabPost'+dataPath);
}
//实验室房间信息管理放大镜
/**1.实验室编号对应标签ID 2.实验室名称对应 标签ID，
*3所属校区编号对应标签ID，4所属校区名称对应标签ID，
5隶属部门编号对应标签ID，6隶属部门名称对应标签ID，
7实验室编码对应标签ID，
8实验室编码名称对应标签ID， 
，9楼栋编码对应标签ID，10楼栋名称对应标签ID，
11房间编码对应标签ID，12房间名称对应标签ID
*13.实验室房间编号，14组织架构编号，
15.校区编号sh_sno
16，部门编号 ud_sno
17.	hs_sno	楼栋编码
18.	rm_sno	房间编码
19.rm_scode	房间号对应标签ID
*/
function labRoomTree(text1,text2,text3,text4,text5,text6,text7,text8,text9,text10,text11,text12,labrm_sno, lo_sno,sh_sno,ud_sno,hs_sno,rm_sno,text13){
var dataPath = "?1=1"; 
	if(labrm_sno!=undefined&&labrm_sno!=null&&labrm_sno!=""){
		dataPath+="&form.labrm_sno="+labrm_sno;
	}
	if(lo_sno!=undefined&&lo_sno!=null&&lo_sno!=""){
		dataPath+="&form.lo_sno="+lo_sno;
	}
	if(ud_sno!=undefined&&ud_sno!=null&&ud_sno!=""){
		dataPath+="&form.ud_sno="+ud_sno;
	}
	if(hs_sno!=undefined&&hs_sno!=null&&hs_sno!=""){
		dataPath+="&form.hs_sno="+hs_sno;
	}
	if(rm_sno!=undefined&&rm_sno!=null&&rm_sno!=""){
		dataPath+="&form.rm_sno="+rm_sno;
	}
	tree7(text1,text2,text3,text4,text5,text6,text7,text8,text9,text10,text11,text12,text13,'<%=path%>/tree!findLabRoom'+dataPath);
}
// 多选房间信息  实验室房间信息管理放大镜1.编号对应标签ID 2.名称对应 标签ID，3.实验室房间编号，4
function labRoomTreeyzc(text1,text2,text3,labrm_sno,lo_slabno){
var dataPath = "?1=1"; 
	if(labrm_sno!=undefined&&labrm_sno!=null&&labrm_sno!=""){
		dataPath+="&form.labrm_sno="+labrm_sno;
	}
	if(lo_slabno!=undefined&&lo_slabno!=null&&lo_slabno!=""){
		dataPath+="&form.lo_slabno="+lo_slabno;
	}
	
	tree2(text1,text2,text3,'<%=path%>/tree!findLabRoomyzc'+dataPath);
}
//职称信息表放大镜1.编号对应标签ID 2.名称对应 标签ID，3.班级编号，4专业编号，5，部门编号
function postTree(text1,text2,post_sno){
var dataPath = "?1=1"; 
	if(post_sno!=undefined&&post_sno!=null&&post_sno!=""){
		dataPath+="&form.post_sno="+post_sno;
	}
	
	tree(text1,text2,'<%=path%>/tree!findPost'+dataPath);
}
//7月4号
/*
实验室员工表放大镜
1.员工编号对应标签ID 
2.员工名称对应 标签ID，
3.实验室管理科编号对应标签ID
4.实验室管理科名称对应标签ID
5.实验室中心编号对应标签ID
6.实验室中心名称对应标签ID
7.实验室分中心编号对应标签ID
8.实验室分中心编号对应标签ID
9.实验室编号对应标签ID
10.实验室名称对应标签ID
11.所属部门编号对应标签ID
12.所属部门名称对应标签ID
13.实验室岗位编号对应标签ID
14.实验室岗位名称对应标签ID
15.实验室编号，16实验室名称，17，员工名称18.岗位名称
19.房间编号列表对应标签ID 20.房间号列表对应标签ID
*/
function labPersonTree(text1,text2,text3,text4,text5,text6,text7,text8,text9,text10,text11,text12,text13,text14,searchA,searchB,searchC,searchD,text15,text16){
var dataPath = "?1=1"; 
	if(searchA!=undefined&&searchA!=null&&searchA!=""){
		dataPath+="&form.searchA="+searchA;
	}
	if(searchB!=undefined&&searchB!=null&&searchB!=""){
		dataPath+="&form.searchB="+searchB;
	}
	if(searchC!=undefined&&searchC!=null&&searchC!=""){
		dataPath+="&form.searchC="+searchC;
	}
	if(searchD!=undefined&&searchD!=null&&searchD!=""){
		dataPath+="&form.searchD="+searchD;
	}
	tree5(text1,text2,text3,text4,text5,text6,text7,text8,text9,text10,text11,text12,text13,text14,text15,text16,'<%=path%>/tree!findLabPerson'+dataPath);
}
//实验室评估体系放大镜1.编号对应标签ID 2.名称对应 标签ID，3.评估体系类型编号4.体系编号
function labPgtxTree(text1,text2,pgtype_sno,pgtx_sno){
var dataPath = "?1=1"; 
	if(pgtype_sno!=undefined&&pgtype_sno!=null&&pgtype_sno!=""){
		dataPath+="&form.pgtype_sno="+pgtype_sno;
	}
	if(pgtx_sno!=undefined&&pgtx_sno!=null&&pgtx_sno!=""){
		dataPath+="&form.pgtx_sno="+pgtx_sno;
	}
	tree(text1,text2,'<%=path%>/tree!findLabPgtx'+dataPath);
}
//实验类型放大镜1.编号对应标签ID 2.名称对应 标签ID，3.实验室类型编号，4实验室类型名称，5，类别，6、组织架构编码
function labTypeTree(text1,text2,searchA,searchB,searchC, lo_sno){
var dataPath = "?1=1"; 
	if(searchA!=undefined&&searchA!=null&&searchA!=""){
		dataPath+="&form.searchA="+searchA;
	}
	if(searchB!=undefined&&searchB!=null&&searchB!=""){
		dataPath+="&form.searchB="+searchB;
	}
	if(searchC!=undefined&&searchC!=null&&searchC!=""){
		dataPath+="&form.searchC="+searchC;
	}
	if(lo_sno!=undefined&&lo_sno!=null&&lo_sno!=""){
		dataPath+="&form.lo_sno="+lo_sno;
	}
	
	tree(text1,text2,'<%=path%>/tree!findLabType'+dataPath);
}
//评估类型放大镜1.类型编号对应标签ID 2.类型名称对应 标签ID，3.类别，4组织编号，5，类别名称
function labPgTypeTree(text1,text2,pgtype_stype,lo_sno,pgtype_sname){
var dataPath = "?1=1"; 
	if(pgtype_stype!=undefined&&pgtype_stype!=null&&pgtype_stype!=""){
		dataPath+="&form.pgtype_stype="+pgtype_stype;
	}
	if(lo_sno!=undefined&&lo_sno!=null&&lo_sno!=""){
		dataPath+="&form.lo_sno="+lo_sno;
	}
	if(pgtype_sname!=undefined&&pgtype_sname!=null&&pgtype_sname!=""){
		dataPath+="&form.pgtype_sname="+pgtype_sname;
	}
	tree(text1,text2,'<%=path%>/tree!findLabPgtype'+dataPath);
}
//学科放大镜1.学科编号对应标签ID 2.学科名称对应 标签ID，3.类别，4学科编号，5，学科名称
function xueKeTree(text1,text2,searchA,searchB,searchC){
var dataPath = "?1=1"; 
	if(searchA!=undefined&&searchA!=null&&searchA!=""){
		dataPath+="&form.searchA="+searchA;
	}
	if(searchB!=undefined&&searchB!=null&&searchB!=""){
		dataPath+="&form.searchB="+searchB;
	}
	if(searchC!=undefined&&searchC!=null&&searchC!=""){
		dataPath+="&form.searchC="+searchC;
	}
	tree(text1,text2,'<%=path%>/tree!findXueke'+dataPath);
}
/*
实验室组织架构表放大镜
1.实验室管理科编号对应标签ID
2.实验室管理科名称对应标签ID
3.实验室中心编号对应标签ID
4.实验室中心名称对应标签ID
5.实验室分中心编号对应标签ID
6.实验室分中心编号对应标签ID
7.实验室编号对应标签ID
8.实验室名称对应标签ID
9.所属部门编号对应标签ID
10.所属部门名称对应标签ID
11.组织编号
12.组织名字
13.所属部门
*/
function laborgTree11(text1,text2,text3,text4,text5,text6,text7,text8,text9,text10,searchA,searchB,searchC){
var dataPath = "?1=1"; 
	if(searchA!=undefined&&searchA!=null&&searchA!=""){
		dataPath+="&form.searchA="+searchA;
	}
	if(searchB!=undefined&&searchB!=null&&searchB!=""){
		dataPath+="&form.searchB="+searchB;
	}
	if(searchC!=undefined&&searchC!=null&&searchC!=""){
		dataPath+="&form.searchC="+searchC;
	}
	tree1(text1,text2,text3,text4,text5,text6,text7,text8,text9,text10,'<%=path%>/tree!findLabOrg2'+dataPath);
}


/*
实验项目放大镜
1.xm_sno	项目编号对应标签ID
2.xm_stype	类别[对应的字典项名]对应标签ID
3.ud_sno	开课部门对应标签ID
4.xm_sstype	项目类型[对应的字典项名]对应标签ID
5.xm_sname	项目名称对应标签ID
6.xm_nnum	项目学时对应标签ID
7.xm_nzbtime	项目实验前准备提前时间对应标签ID
8.course_sno	课程编号对应标签ID
9.course_sname	课程名称对应标签ID
10.course_ssname	课程简称对应标签ID
11.course_sename	课程英文名称对应标签ID
12.course_stype	类别对应标签ID
13.course_nxsnum	总学时数对应标签ID
14.course_nxfnum	学分数对应标签ID

15.ud_sno	开课部门对应标签ID <br>
16.xm_nktnum	实验所需天数对应标签ID
17.xm_smem	备注对应标签ID <br>
18.lo_sno	归属实验室对应标签ID
19.xm_sisreport	是否需要提交实验报告对应标签ID <br>
20.xm_sway	方式对应标签ID
21.xm_npnum	每组最多人数对应标签ID <br>
22.xm_siswork	是否需要工作台实验对应标签ID
23.xm_sstat	状态对应标签ID <br>
24. 实验室名称
25学科编号26学科名称
27.课程编号 <br>【课程->实验室项目联动字段】
28.xm_stype	类别[1]
29.xm_sstat	状态
30.部门编号
31.xm_stype	类别对应标签ID
32.xm_sstype	项目类型对应标签ID
*/
function expXmTree(text1,text2,text3,text4,text5,text6,text7,text8,text9,text10,text11,text12,text13,text14,text15,text16,text17,text18,text19,text20,text21,text22,text23,text24,text25,text26,course_sno,xm_stype,xm_sstat,ud_sno,text27,text28){
var dataPath = "?1=1"; 
	if(course_sno!=undefined&&course_sno!=null&&course_sno!=""){
		dataPath+="&form.course_sno="+course_sno;
	}
	if(xm_stype!=undefined&&xm_stype!=null&&xm_stype!=""){
		dataPath+="&form.xm_stype="+xm_stype;
	}
	if(xm_sstat!=undefined&&xm_sstat!=null&&xm_sstat!=""){
		dataPath+="&form.xm_sstat="+xm_sstat;
	}
	if(ud_sno!=undefined&&ud_sno!=null&&ud_sno!=""){
		dataPath+="&form.ud_sno="+ud_sno;
	}
	tree8(text1,text2,text3,text4,text5,text6,text7,text8,text9,text10,text11,text12,text13,text14,text15,text16,text17,text18,text19,text20,text21,text22,text23,text24,text25,text26,text27,text28,'<%=path%>/tree!findExpXm'+dataPath);
}
 
 
/**
实验室类型放大镜:
1.rt_sno	房间类型编码对应标签ID
2.rt_sname	房间类型名称对应标签ID
3.rt_ssname	房间类型简称对应标签ID
4.rt_nlevel	分类
**/
function roomTypeTree(text1,text2,text3,rt_nlevel){

var dataPath = "?1=1"; 
	if(rt_nlevel!=undefined&&rt_nlevel!=null&&rt_nlevel!=""){
		dataPath+="&form.rt_nlevel="+rt_nlevel;
	}
	tree2(text1,text2,text3,'<%=path%>/tree!findRoomType'+dataPath);

}
/**实验项目预习题库管理:
1.yxtk_sno	预习题库编号对应标签ID
2.yxtk_stitle	题目名称对应标签ID
**/
function prepareQuestionTree(text1,text2){

var dataPath = "?1=1"; 
	tree(text1,text2,'<%=path%>/tree!findPrepareQuestion'+dataPath);

}
/**
评分项放大镜
1.si_sno 评分项编号对应标签ID
2.si_stype 评分项类型对应标签ID
3.si_sname 评分项名称对应标签ID
4.si_stype	评分项类型

**/
function eduScoreitemTree(text1,text2,text3,searchB){
var dataPath = "?1=1"; 
	if(searchB!=undefined&&searchB!=null&&searchB!=""){
		dataPath+="&form.searchB="+searchB;
	}
	tree2(text1,text2,text3,'<%=path%>/tree!findEduScoreitem'+dataPath);

}
/**
实验室设备信息管理放大镜
1.ei_sno 设备编号对应标签ID
2.ei_sname 设备名称对应标签ID
3.实验室编号 

**/
function labEquTree(text1,text2,searchC){
var dataPath = "?1=1"; 
	if(searchC!=undefined&&searchC!=null&&searchC!=""){
		dataPath+="&form.searchC="+searchC;
	}
	tree(text1,text2,'<%=path%>/tree!findLabEqu'+dataPath);
}
/**
资产信息表[设备信息表]管理放大镜
1.ei_nid	主键对应标签ID
2.ei_sno	设备编号对应标签ID
3.ei_ssname	主设备编号（附设备用）对应标签ID
4.ei_sname	资产名称对应标签ID
**/
function equipInfoTree(text1,text2,text3,text4){
var dataPath = "?1=1"; 
	tree3(text1,text2,text3,text4,'<%=path%>/tree!findEquipInfo'+dataPath);
}
/**
评分考核主表放大镜
1	zs_sno 主表编号对应标签ID
2	zs_sname 标题对应标签ID
**/
function eduZscoreTree(text1,text2){
var dataPath = "?1=1"; 
	tree(text1,text2,'<%=path%>/tree!findeduZscore'+dataPath);
}
/**
考核人信息表放大镜
1.re_nid 主键对应标签ID	
2.emp_sno 考核人编号对应标签ID	
3.emp_sname 考核人名称对应标签ID	
4.zs_sno 考核编号对应标签ID	
5.zs_sname 考核标题对应标签ID	
**/
function eduRscoreempTree(text1,text2,text3,text4,text5){
var dataPath = "?1=1"; 
	tree11(text1,text2,text3,text4,text5,'<%=path%>/tree!findeduRscoreemp'+dataPath);
}
/**
edu_rscorerelate考核关系表放大镜
1.rela_nid 主键对应标签ID	
2.emp_sno 考核人编号对应标签I
3.emp_sname 考核人对应标签I
4.emp_spf 评分人编号对应标签I
5.emp_sname1 评分人对应标签I
6.rela_stype 评分项类型(0上级评分类，1.下级评分类2同级评分类)对应标签I

**/
function eduRscorerelateTree(text1,text2,text3,text4,text5,text6){
var dataPath = "?1=1"; 
	tree6(text1,text2,text3,text4,text5,text6,'<%=path%>/tree!findeduRscorerelate'+dataPath);
}
/**
 * 招商代理机构
 */
function findAgencyTree(text1,text2,text3,text4,text5,text6,text7,text8,text9){
	var dataPath = "?1=1"; 
	treeagency(text1,text2,text3,text4,text5,text6,text7,text8,text9,'<%=path%>/tree!findAgency'+dataPath);
	}

 
 
 
 function checkAll(box){  //全选或全不选
	form1.checkbox.checked = box.checked;
  	if(form1.idcheckbox == null)
  		return;
  	var numRow = form1.idcheckbox.length;
  	if(numRow == null) {
  		form1.idcheckbox.checked = box.checked;	
  		return;
  	}
  	if(box.checked) {
		for (var i = 0; i < numRow; i++) {
			form1.idcheckbox[i].checked = true;
		}
	} else {
		for (var i = 0; i < numRow; i++) {
			form1.idcheckbox[i].checked = false;
		}
	}
  }
  
  function checkOne(){  //选一个时全选或全不选
  	
  	if(form1.idcheckbox == null)
  		return;
  	var numRow = form1.idcheckbox.length;
  	if(numRow == null) {
		form1.checkbox.checked = form1.idcheckbox.checked;
		return;
  	}
  	var numBox =0;
	for (var i = 0; i < numRow; i++) {
		if(form1.idcheckbox[i].checked){
			numBox++;
		}
	}
	if(numBox==numRow){
		form1.checkbox.checked = true;
	}else {
		form1.checkbox.checked = false;
	}
  }
  //下载导入模板
  function downloadTemp(name){
  		document.form1.action="<%=path%>/login!downloadTemp?id="+name;
		document.form1.submit();
  }
  //导入Excel
  function importExcel(name,pathname,Width,Height){
  	if(Height==undefined)
	{
		Height = '150px';
	}
	if(Width==undefined)
	{
		Width = '300px';
	}
	 
	var path="<%=path%>/jsp/fileUpload.jsp?pathname="+name;
	  
  	var returnValue = window.showModalDialog(path,obj,'dialogHeight:'+Height+';dialogWidth:'+Width+';center:yes;help:no;resizable:no;status:no;scroll:no;location:no;');
  	if(returnValue==undefined){
  	return false;
  	}
  	if(returnValue!=true){
  		alert("导入文件失败！");
  	}
  }
  //导出Excel
  function exportExcel(path){
  		document.form1.action="<%=path%>/"+path+"!exportExcel";
		document.form1.submit();
  }
  
 
  //获得divwidth的宽度
var divwidth =null;
	function getwidth(){ 
		if(document.getElementById("table1")!=undefined&&document.getElementById("divwidth")!=undefined&&document.getElementById("idwidth")!=undefined){
			if(divwidth!=null)document.getElementById("table1").style.width = divwidth;
			document.getElementById("divwidth").style.width= document.body.offsetWidth-50;
			document.getElementById("divwidth").style.width= document.getElementById("idwidth").offsetWidth;
			if(document.getElementById("table1").offsetWidth>document.getElementById("divwidth").offsetWidth){
				document.getElementById("divwidth").style.height= document.getElementById("table1").offsetHeight+17;
			}else{
				if(divwidth==null)divwidth = document.getElementById("table1").offsetWidth;
				document.getElementById("table1").style.width = document.getElementById("divwidth").offsetWidth;
				document.getElementById("divwidth").style.height= document.getElementById("table1").offsetHeight;
//				document.getElementById("divwidth").style.paddingBottom = "0px";
			}
		}
		if(document.getElementById("alltable")!=undefined){
			document.getElementById("alltable").style.height=window.parent.document.getElementById('main').height-50;
		}
		if(document.getElementById("PopupDiv")!=undefined){
			document.getElementById("PopupDiv").style.width= document.body.scrollWidth-10;
			document.getElementById("PopupDiv").style.height= document.body.scrollHeight;
		}
	}
	
	
	//获得divheight的高度
	function getheight(){ 
		if(document.getElementById("divheight")!=undefined){
			document.getElementById("divheight").style.height= document.body.offsetHeight-83;
			document.getElementById("divheight").style.width= document.body.offsetWidth;
		}
	}
	function input_trim() {
		var isSubmit = true;
		var fv = new FormValid($("[valid],[url]:([urlmsg])"));
		$("input").each(function(){
			if($(this).attr("type")=="text"&&$(this).attr("value")!=undefined){
				$(this).attr("value", $(this).attr("value").trim());
			}
		});
	}
 </script>
 