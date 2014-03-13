function trimString(str)
{
	if (str.length == 0)
		return "";
		
	var start = 0;
	while (start < str.length)
	{
		if (str.charAt(start) != " ")
			break;
		start ++;
	}
	
	if (start >= str.length)
		return "";
	
	var end = str.length;
	while (end > 0)
	{
		if (str.charAt(end - 1) != " ")
			break;
		end --;
	}
	
	return str.substring(start, end);
}
//��������
function getcal()
{
	var strNode=showModalDialog('../js/calendar.asp',0,"dialogWidth:300px;dialogHeight:160px;status:no");
	if (strNode!=-1 && typeof(strNode)!='undefined') return strNode;
	else return "";
}
//��������2
function getcal2()
{
	var strNode=showModalDialog('../../js/calendar.asp',0,"dialogWidth:300px;dialogHeight:160px;status:no");
	if (strNode!=-1 && typeof(strNode)!='undefined') return strNode;
	else return "";
}
//��������3
function getcal3()
{
	var strNode=showModalDialog('js/calendar.asp',0,"dialogWidth:300px;dialogHeight:160px;status:no");
	if (strNode!=-1 && typeof(strNode)!='undefined') return strNode;
	else return "";
}

function mystr(num,len)
{
  var s="";
  var snum = num.toString();
  var nLen = snum.length;
  for(i=0;i<len-nLen;i++)
  {
     s+= "0"
  }
  s+=snum;
  return s;
}
//����С��β������  
function Round(a_Num,a_Bit)
{ 
   return( Math.round(a_Num * Math.pow (10 , a_Bit)) / Math.pow(10 , a_Bit)) ; 
} 
 
function checknumber(object_value)
{
    if (object_value.length == 0)
        return false;

	var start_format = " +-0123456789";
	var number_format = " .0123456789";
	var check_char;
	var isdecimal = false;
	var trailing_blank = false;
	var digits = false;

	check_char = start_format.indexOf(object_value.charAt(0))
	if (check_char == 1)
	    isdecimal = true;
	else if (check_char < 1)
		return false;
        
	for (var i = 1; i < object_value.length; i++)
	{
		check_char = number_format.indexOf(object_value.charAt(i))
		if (check_char < 0)
			return false;
		else if (check_char == 1)
		{
			if (isdecimal)
				return false;
			else
				isdecimal = true;
		}
		else if (check_char == 0)
		{
			if (isdecimal || digits)	
				trailing_blank = true;
		}
	    else if (trailing_blank)
			return false;
		else
			digits = true;
	}	

    return true
}

function checkNum(str)
{
   return !/\D/.test(str)
}

//-------------------------------------------------------------------
// isNull(value)
//   Returns true if value is null
//-------------------------------------------------------------------
function isNull(val){return(val==null);}

//-------------------------------------------------------------------
// isBlank(value)
//   Returns true if value only contains spaces
//-------------------------------------------------------------------
function isBlank(val){
	if(val==null){return true;}
	for(var i=0;i<val.length;i++) {
		if ((val.charAt(i)!=' ')&&(val.charAt(i)!="\t")&&(val.charAt(i)!="\n")&&(val.charAt(i)!="\r")){return false;}
		}
	return true;
	}

//-------------------------------------------------------------------
// isInteger(value)
//   Returns true if value contains all digits
//-------------------------------------------------------------------
function isInteger(val){
	if (isBlank(val)){return false;}
	for(var i=0;i<val.length;i++){
		if(!isDigit(val.charAt(i))){return false;}
		}
	return true;
	}

//-------------------------------------------------------------------
// isNumeric(value)
//   Returns true if value contains a positive float value
//-------------------------------------------------------------------
function isNumeric(val){return(parseFloat(val,10)==(val*1));}

//-------------------------------------------------------------------
// isArray(obj)
// Returns true if the object is an array, else false
//-------------------------------------------------------------------
function isArray(obj){return(typeof(obj.length)=="undefined")?false:true;}

//-------------------------------------------------------------------
// isDigit(value)
//   Returns true if value is a 1-character digit
//-------------------------------------------------------------------
function isDigit(num) {
	if (num.length>1){return false;}
	var string="1234567890";
	if (string.indexOf(num)!=-1){return true;}
	return false;
	}

//Auto-Tab,�Զ�������һ��
//-------------
var phone_field_length=0;
function TabNext(obj,event,len,next_field) 
{
   if (event == "down") {
	phone_field_length=obj.value.length;
   }
   else if (event == "up") {
	 if (obj.value.length != phone_field_length) {
		 phone_field_length=obj.value.length;
		 if (phone_field_length == len) {
			 next_field.focus();
		 }
	 }
   }
}

function setStructValue(structObj,sVal)
{
  if (typeof(structObj)=="undefined" || structObj.tagName!="SELECT")
  {
      return ;
  }
   var i=0
   var sum = structObj.options.length;
   sum = parseInt(sum);
   var strVal = sVal.toString();
   strVal = trimString(strVal);
   for (i=0;i<sum;i++)
   {
       if (structObj.options[i].value == strVal)
       {
           //structObj.options[i].selected = true;
           structObj.selectedIndex = i;           
           return true;
       }

   }
   structObj.selectedIndex = -1;  
}

function getStructValue(structObj)
{
  if (typeof(structObj)=="undefined" || structObj.tagName!="SELECT")
  {
      return null;
  }
  var i=0
  i = structObj.selectedIndex;
  if(i==-1)
     return null;
  else
     return structObj.options[i].value;
}

function setStructText(structObj,sText)
{
  if (typeof(structObj)=="undefined" || structObj.tagName!="SELECT" )
  {
      return ;
  }
   var i=0
   var sum = structObj.options.length;
   sum = parseInt(sum);
   sText = trimString(sText);
   for (i=0;i<sum;i++)
   {
       if (structObj.options[i].text == sText)
       {
           structObj.selectedIndex = i;           
           return true;
       }

   }
   structObj.selectedIndex = -1;  
}
function getStructText(structObj)
{
  if (typeof(structObj)=="undefined" || structObj.tagName!="SELECT")
  {
      return null ;
  }
  var i=0
  i = structObj.selectedIndex;
  if(i==-1)
     return null;
  else
     return structObj.options[i].text;
}

function getStructTextbyVal(structObj,sVal)
{
  if (typeof(structObj)=="undefined" || structObj.tagName!="SELECT" )
  {
      return ;
  }
   var i=0
   var sum = structObj.options.length;
   sum = parseInt(sum);
   for (i=0;i<sum;i++)
   {
       if (structObj.options[i].value == sVal)
       {
           return structObj.options[i].text;
       }

   }
   return null; 
}

function getfilterZeroVal(arg,val)
{
   if(!arg || typeof(arg)=="undefined" || arg=="NULL" || parseInt(arg)==0){
       return val.toString();
   }
   var sVal = arg.toString();
   return sVal;
}

function getVal(arg,val)
{
   if(!arg || typeof(arg)=="undefined" || arg=="NULL"){
       return val.toString();
   }
   var sVal = arg.toString();
   return sVal;
}

function setlistContainer(listContainer,lookupCell_i,lookupCell_val,setCell_i,setCell_val)
{
   for(var index=0;index<listContainer.tableClient.rows.length;index++) 
   {
      var row = listContainer.tableClient.rows(index);  
      if (row.cells(lookupCell_i).innerText ==lookupCell_val)
      {
         row.cells(setCell_i).innerText = setCell_val;
         break;
      }
   }
}

function BiXmlHttp()
{
   return new ActiveXObject(BiXmlHttp._activeXName);
}
BiXmlHttp.create=function(){return new BiXmlHttp();};
BiXmlHttp._activeXName=_biGetActiveXName("XmlHttp");

function BiXmlDocument()
{
   return new ActiveXObject(BiXmlDocument._activeXName);
}
BiXmlDocument.create=function(){return new BiXmlDocument();};
BiXmlDocument._activeXName=_biGetActiveXName("DomDocument");

function _biGetActiveXName(sType)
{
   var servers=["MSXML2","Microsoft","MSXML","MSXML3"];
   var o;
   for(var i=0;i<servers.length;i++)
   {
      try
      {
         o=new ActiveXObject(servers[i]+"."+sType);
         return servers[i]+"."+sType;
      }
         catch(ex){};
   }
   throw new Error("Could not find an installed XML parser");
};

/********************************************************************
**��ȡQurey�����������XML��ѯ�����һ���ڵ��е��ӽڵ��ֵ
*********************************************************************/
function getResultDocChildNodeValue(resultdoc,nodename,childnodename)
{
    var sname= "";
   var xmlResultDoc = new BiXmlDocument();
   xmlResultDoc.loadXML(resultdoc);     
   var node = xmlResultDoc.documentElement.selectSingleNode(nodename);
   if(node)
   {
      var n0 = node.selectSingleNode("./NoData")
      n0=n0?n0.text:0;
      if (parseInt(n0) == 0)
      { 
          try{
              sname= node.selectSingleNode(childnodename);
              sname=sname?sname.text:"NULL"
          }catch(ex){};
      }
      else
      {
        sname= "NULL";
      }   
   }
   else
       sname = "NULL";
   
   return sname;
}

/*************************************************************************
**��ȡQurey�����������XML��ѯ�����һ��ڵ��е��ӽڵ��ֵ������һ������**
**************************************************************************/
function getResultDocChildNodesValue(resultdoc,nodename,childnodename)
{
   var sname,node;
   var res = new Array();
   var xmlResultDoc = new BiXmlDocument();
   xmlResultDoc.loadXML(resultdoc);     
   var objnodelist = xmlResultDoc.documentElement.selectNodes(nodename);
   if(objnodelist)
   {
      for(i=0;i<objnodelist.length;i++)
      {
        node = objnodelist.item(i);
        var n0 = node.selectSingleNode("./NoData")
        n0=n0?n0.text:0;
        sname="NULL"
        if (parseInt(n0) == 0)
        { 
          try{                     
              sname= node.selectSingleNode(childnodename);
              sname =sname?sname.text:"NULL"                
          }catch(ex){};
        }
        res[i] = sname;
      }

   }
   return res;
}

/********************************************************************
**��ȡProcess�����������XML SQL ������
*********************************************************************/
function getProcessResult(resultdoc,nodename)
{   
   var bSuccess = false;
   try{
      var xmlResultDoc = new BiXmlDocument();
      xmlResultDoc.loadXML(resultdoc);     
      var n0 = xmlResultDoc.documentElement;
      n0=n0?n0.text:0;
      if (parseInt(n0) == 1)
      { 
         bSuccess = true;     
      }
   }catch(ex){}; 
   return bSuccess;
}

/********************************************************************
**��ȡSP�洢����ִ�н����������XML 
*********************************************************************/
function getSPResult(resultdoc,nodename)
{   
   try{
        var xmlResultDoc = new BiXmlDocument();
        xmlResultDoc.loadXML(resultdoc);
        var outparaNode = xmlResultDoc.documentElement.selectSingleNode(nodename); 
        var sVal=outparaNode?outparaNode.text:"NULL";
   }catch(ex){}; 
   return sVal;
}

/********************************************************************
**��ȡ����ִ�н����������XML 
*********************************************************************/
function getFuncResult(resultdoc)
{   
   try{
        var xmlResultDoc = new BiXmlDocument();
        xmlResultDoc.loadXML(resultdoc);
        var outparaNode = xmlResultDoc.documentElement.firstChild; 
        var sVal=outparaNode?outparaNode.text:"NULL";
   }catch(ex){}; 
   return sVal;
}
/*****************************************************************************
**���ͻ��˵�XML����ͨ��XmlHttp�����͵��������˵�ҳ�棨��������ָ����    **
**������Ӧ�Ĵ������ѽ��ͨ��XmlHttp���󴫻�                               **
******************************************************************************/
function sendData2ServerPage(xml,url)
{  
  var oXmlHttp = new BiXmlHttp();
  oXmlHttp.Open("POST", url, false);
  oXmlHttp.setRequestHeader("Content-Type","text/xml")
  oXmlHttp.Send(xml);
  if(oXmlHttp.status!="200")
  {
    alert("û�з�����ȷ���������ͣ�");
    return false;
  }
  else
  {
     return oXmlHttp.responseXML.xml;
  }  
}
/*********************************************************************************
**ִ��SQL���                                                                   **
**********************************************************************************/
function execSQL(sql)
{   
   var xmltext ="<Process><SQL>" + sql + "</SQL></Process>";
   var doc= sendData2ServerPage(xmltext,"XML2SQLProcess.asp"); 
   var bSuccess = getProcessResult(doc,"Success");
   return bSuccess;  
}

/*********************************************************************************
**ִ�ж��SQL���                                                               **
**********************************************************************************/
function execSQLs(sqls)
{
	var xmltext ="<Process>" + sqls + "</Process>";
	var doc= sendData2ServerPage(xmltext,"XML2SQLProcess.asp"); 
	var bSuccess = getProcessResult(doc,"Success");
	return bSuccess;
}

function execQuery(strQurey,TabName)
{   
   var xmltext = "<Process><Qurey Name = '"+ TabName + "'>" + strQurey + "</Qurey></Process>";
   var doc = sendData2ServerPage(xmltext,"SQLQuery2XML.asp"); 
   return doc;  
}

//ִ��ͼ�����sql���
function execQuery_Image(strQurey,TabName)
{   
   var xmltext = "<Process><Qurey Name = '"+ TabName + "'>" + strQurey + "</Qurey></Process>";
   var doc = sendData2ServerPage(xmltext,"SQLQuery2XML_Image.asp"); 
   return doc;  
}

/*****************************************************************************************
**ִ�д洢����SP:��������洢������SPName��������ά����:arrPara,��һάά������洢���̲�**
**������,�ڶ�άά����5,�ֱ��Ӧ�洢���̵Ĳ����������{0-������,1-����('Int','Varchar'��)**
**2-�������('In','Out','InOut'),3-��������(��adVarchar������Ҫ),4-����ֵ               **                                   
******************************************************************************************/
function execSP(SPName,arrPara)
{
   var xmltext="<Process><SP Name='" + SPName + "'>";
   var paraText="";
   for(var i=0;i<arrPara.length;i++)
   { 
       paraText= paraText +"<Para Name='"   + arrPara[i][0] + "'  Type='" + arrPara[i][1];  
       paraText= paraText +    "' Direct='" + arrPara[i][2] + "'  Length='" + arrPara[i][3];  
       paraText= paraText +   "'  Value='"  + arrPara[i][4] + "' />";       
   }
   xmltext = xmltext + paraText + "</SP></Process>";
   var doc = sendData2ServerPage(xmltext,"XML2SP.asp");
   return doc;
}

/*******************************************************************************
**ִ��Զ�˺��������غ���ִ�н��:�������: ������FuncName��������������:arrPara                                         ***
********************************************************************************/
function execFunc(FuncName,arrPara)
{
   var xmltext="<Function><Name><![CDATA[" + FuncName + "]]></Name>";
   var paraText="";
   for(var i=0;i<arrPara.length;i++)
   { 
        paraText= paraText +"<Para " + "Type='" + arrPara[i][1] + "'><![CDATA["   + arrPara[i][0] + "]]></Para>";      
   }
   xmltext = xmltext + paraText + "</Function>";
   var doc = sendData2ServerPage(xmltext,"XMLREMOTE.asp");
   return doc;
}

/*****************************
**����Session����ȡSessionֵ**
******************************/

function getSessionValue(sSName)
{
	url = "getSessionValue.asp?SessionName=" + sSName;
	var error=false;
	var errorMessage="";
	var n0,n1,sSValue;
	sSValue = "";
	var xmlHttp=new BiXmlHttp();
	xmlHttp.open("GET",url,false);
	try{xmlHttp.send();}
	catch(ex){error=true;errorMessage="File not found"}
	if(!error)
	{
	    if(xmlHttp.responseXML.parseError!=0)
	    {
	       error=true;
	       errorMessage=xmlHttp.responseXML.parseError.reason;
	    }
	    else if(!(xmlHttp.status==200))
	    {
	       error=true;
	       errorMessage="File not found";
	    }
	 }
	 if(!error)
	 {
	    var doc=xmlHttp.responseXML;
	    try{
	       n0=doc.selectSingleNode("/Root/Session/@NoData");
	       var nValid = n0?n0.text:0 ;
	       if(parseInt(nValid)==1)
	       {
	          error = true;
	          errorMessage="û���������";
	          //throw new Error(errorMessage);
	       }
	       n1=doc.selectSingleNode("/Root/Session/@Value");
	       if(n1)
	         sSValue = n1.text;
	       else
	         sSValue = "";
	     }
	     catch(ex){throw ex;};
	 }    
	 else
	 {
	     alert(errorMessage);
	     return "";
	 }
	 sSValue.toString();
	 return sSValue;
}

/*******************************
**����Session��������Sessionֵ**
********************************/

function setSessionValue(sSName,sSValue)
{
	url = "setSessionValue.asp?SessionName=" + sSName + "&SessionValue=" + sSValue;
	var error=false;
	var errorMessage="";
	var n0,n1,n2,rtnSName,rtnSValue;
	sSValue = "";
	var xmlHttp=new BiXmlHttp();
	xmlHttp.open("GET",url,false);
	try{xmlHttp.send();}
	catch(ex){error=true;errorMessage="File not found"}
	if(!error)
	{
	    if(xmlHttp.responseXML.parseError!=0)
	    {
	       error=true;
	       errorMessage=xmlHttp.responseXML.parseError.reason;
	    }
	    else if(!(xmlHttp.status==200))
	    {
	       error=true;
	       errorMessage="File not found";
	    }
	 }
	 if(!error)
	 {
	    var doc=xmlHttp.responseXML;
	    try{
	       n0=doc.selectSingleNode("/Root/Session/@NoData");
	       var nValid = n0?n0.text:0 ;
	       if(parseInt(nValid)==1)
	       {
	          error = true;
	          errorMessage="û���������";
	          //throw new Error(errorMessage);
	       }
	       n1=doc.selectSingleNode("/Root/Session/@Name");
	       n2=doc.selectSingleNode("/Root/Session/@Value");
	       rtnSName = n1.text;
	       rtnSValue = n2.text;
	     }
	     catch(ex){throw ex;};
	 }    
	 else
	 {
	     alert(errorMessage);
	     return "";
	 }
	 rtnSName.toString();
	 rtnSValue.toString();
}

/***********************************************************
**����code_class��codeֵ���public_codes���е�code_valueֵ**
************************************************************/
function getPublicCodeValue(sCodeClass,sCode)
{
	var strSQL = "select code_value from public_codes where code_class = " + sCodeClass + " and code = " + sCode;
	var doc = execQuery(strSQL,"CodeValue");
	var sCodeValue = getResultDocChildNodeValue(doc,"CodeValue","code_value");
	return sCodeValue;
}

/***********************************************************
**����code_class��code_valueֵ���public_codes���е�codeֵ**
************************************************************/
function getPublicCode(sCodeClass,sCodeValue)
{
	var strSQL = "select code from public_codes where code_class = " + sCodeClass + " and code_value = '" + sCodeValue + "'";
	var doc = execQuery(strSQL,"Code");
	var sCode = getResultDocChildNodeValue(doc,"Code","code");
	return sCode;
}

/***********************************************************
**���obj.value��ֵ                                     ****
************************************************************/
function getObjVal(obj,defaultval)
{
    if (obj && typeof(obj.value)!="undefined" )
        return obj.value;
    else
        return defaultval;	
}

/***********************************************************
**����obj.value��ֵ**
************************************************************/
function setObjVal(obj,val)
{
    if (obj && typeof(obj.value)!="undefined"){        
        obj.value=val;
    }
    return true;
	
}

//ֻ����������
function inputNumber()
{
	return (/[\d.]/.test(String.fromCharCode(event.keyCode)));
}

//��Сдת��
function aToc(obj1,obj2)
{
	var whole = document.getElementById(""+obj1+"").value;
	//����������С��
	var num;
	var dig;
	if(whole.indexOf(".") == -1)
	{
		num = whole;
		dig = "";
	}
	else
	{
		num = whole.substr(0,whole.indexOf("."));
		dig = whole.substr( whole.indexOf(".")+1, whole.length);
	}
	//ת����������
	var i=1;
	var len = num.length;
	var dw2 = new Array("","��","��");//��λ
	var dw1 = new Array("ʰ","��","Ǫ");//С��λ
	var dw  = new Array("��","Ҽ","��","��","��","��","½","��","��","��");//����������
	var dws = new Array("��","Ҽ","��","��","��","��","½","��","��","��");//С��������
	var k1=0;//��С��λ
	var k2=0;//�ƴ�λ
	var str="";
	for(i=1;i<=len;i++)
	{
		var n = num.charAt(len-i);
		if(n=="0")
		{
			if(k1!=0)
			str = str.substr( 1, str.length-1);
		}
		str = dw[Number(n)].concat(str);//������
		if(len-i-1>=0)//�����ַ�Χ��
		{
			if(k1!=3)//��С��λ
			{
				str = dw1[k1].concat(str);
				k1++;
			}
			else//����С��λ���Ӵ�λ
			{
				k1=0;
				var temp = str.charAt(0);
				if(temp=="��" || temp=="��")//����λǰû����������ȥ��λ
				str = str.substr( 1, str.length-1);
				str = dw2[k2].concat(str);
			}
		}
		if(k1==3)//С��λ��ǧ���λ��һ
		{k2++;}
	}
	str = str + "Ԫ";
	
	//�����д�ַ���
	str = str.replace("������","��");
	str = str.replace("������","��");
	str = str.replace("������","��");
	str = str.replace("������","��");

	str = str.replace("����","��");
	str = str.replace("����","��");
	str = str.replace("����","��");
	str = str.replace("����","��");

	str = str.replace("����","��");
	str = str.replace("����","��");
	str = str.replace("��Ԫ","Ԫ");

	//ת��С������
	var strdig="";
	for(i=0;i<2;i++)
	{
		var n=dig.charAt(i);
		strdig+=dws[Number(n)];//������
		if (i == 0)
		{
			strdig = strdig + "��";
		}
		if (i == 1)
		{
			strdig = strdig + "��";
		}
	}

	if (strdig != "������")
	{
		str = str + strdig;
	}

	if (document.getElementById(""+obj1+"").value.length != 0)
	{
		if (document.getElementById(""+obj1+"").value == "0")
		{
			str = "��" + str;
		}
		document.getElementById(""+obj2+"").value = str + "��";
	}

/*
	if(strdig!='����')str += "��"+strdig;

	if (str=="")
	{
		str = "��";
	}
	if (document.getElementById(""+obj1+"").value.length != 0)
	{
		document.getElementById(""+obj2+"").value = str + "Ԫ��";
	}
*/
}


//��������
function srchSelTxt(obj,oSel)
{
	var sTxt = obj.value;
	var nLen = oSel.length;
	for (i = 0;i < nLen;i++)
	{
		var sTagTxt = oSel.options[i].text;
		if (sTagTxt.indexOf(sTxt) == 0)
		{
			oSel.selectedIndex = i;
			break;
		}
	}
}

//tr����л�����ɫ
function setSelectBgcolor(id)
{
	id.style.backgroundColor=(id.style.backgroundColor=='lightskyblue')?'white':'lightskyblue';
}

//���tr����ʾ��ͬ�ı���ɫ�����ұ���֮ǰtr�ı���ɫ��
var oldBgColor = "Beige";
var nCurrentMarker = 1;
function ClickMarker_saveOldBG(nMarker)
{
	SetCurrentTopic_saveOldBG( nMarker );
}
function SetCurrentTopic_saveOldBG(nMarker)
{
	if (nCurrentMarker != nMarker)
	{
		oldBgColor = document.getElementById("myTable").rows( nMarker ).style.backgroundColor;
		if (oldBgColor == "")
		{
			document.getElementById("myTable").rows( nCurrentMarker ).style.background = oldBgColor;
		}
		document.getElementById("myTable").rows( nMarker ).style.background = "#dee0e1";
	}
	else
	{
		if (nCurrentMarker == 1)
		{
			document.getElementById("myTable").rows( nCurrentMarker ).style.background = "#dee0e1";
			document.getElementById("myTable").rows( nMarker).style.background = "#dee0e1";
		}
	}
	nCurrentMarker = nMarker;
}