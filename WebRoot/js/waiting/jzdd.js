/*************************** BEGIN ***************************/
/**
 * @author http://kanaifeixiang.blog.sohu.com/
 * @version 1.0
 *
 * ���ȣ����� createGcjDhccFullScreen() ���� fullScreen(ȫ�����ǲ�)
 * Ȼ��
 * ���� showGcjDhccFullScreen() ��ʾ fullScreen
 * ���� hideGcjDhccFullScreen() ���� fullScreen
 * 
 * ********** ����˵�� **********
 * path : ����·�����ñ�������ҳ�涨���ֵ�� var path = "<%=path%>";
 * gcjDhccFullScreenLoadingText : ���� fullScreen ��ļ���ʱ��ʾ�����֣�������HTML��
 * gcjDhccFullScreenLoadingTextAlign : ���� fullScreen ��ļ���ʱ��ʾ������λ�ڼ���ͼƬ��λ�ã�ͼƬ�Ϸ� up���� down���� left���� right
 * gcjDhccFullScreenLoadingImgHAlign : ���� fullScreen ��ļ���ͼƬ��ˮƽλ�ã��� left���� center���� right
 * gcjDhccFullScreenLoadingImgVAlign : ���� fullScreen ��ļ���ͼƬ����ֱλ�ã��� top���� middle���� bottom
 * gcjDhccFullScreenBKImgPath : ���� fullScreen ��ı���ͼƬ·��
 * gcjDhccFullScreenLoadingImgPath : ���� fullScreen ��ļ���ͼƬ·��
 * gcjDhccFullScreenDocumentObj : ���� fullScreen �����Ǹ�ҳ����ʾ
 *     ��ҳ�棺var gcjDhccFullScreenDocumentObj = window.document;
 *     ��ҳ�棺var gcjDhccFullScreenDocumentObj = window.parent.document;
 *     ��ҳ��ĸ�ҳ�棺var gcjDhccFullScreenDocumentObj = window.parent.parent.document;
 *     �������ơ�
 * 
 * ����ȱ�ݣ�gcjDhccFullScreenDocumentObj ����ֻ�������ڱ�ҳ�棬�����ڸ�ҳ��ʱ�޷����� fullScreen�� hideGcjDhccFullScreen() ����ʱ�ᱨ�� ��
 * 
 */
var gcjDhccFullScreenLoadingText = '<font color="#ff0000">������1 ������</font>';
var gcjDhccFullScreenLoadingTextAlign = "center";
var gcjDhccFullScreenLoadingImgPath = "img/jzdd.gif";
var gcjDhccFullScreenLoadingImgHAlign = "center";
var gcjDhccFullScreenLoadingImgVAlign = "middle";
var gcjDhccFullScreenBKImgPath = "img/tmbj.png";
var gcjDhccFullScreenDocumentObj = window;
/**
 * ���� fullScreen(ȫ�����ǲ�)
 * 
 * loadingText = gcjDhccFullScreenLoadingText
 * loadingTextAlign = gcjDhccFullScreenLoadingTextAlign
 * loadingImgPath = gcjDhccFullScreenLoadingImgPath
 * imgHAlign = gcjDhccFullScreenLoadingImgHAlign
 * imgVAlign = gcjDhccFullScreenLoadingImgVAlign
 * bKImgPath = gcjDhccFullScreenBKImgPath
 * documentObj = gcjDhccFullScreenDocumentObj
 * 
 * ����Ҫ�ı�Ĳ����ÿգ�ֵΪ null �������ַ��� "null" ��
 * 
 */
function createGcjDhccFullScreen(loadingText, loadingTextAlign, loadingImgPath, imgHAlign, imgVAlign, bKImgPath, documentObj)
{
 //��ʼ������
 if(loadingText == null){ loadingText = gcjDhccFullScreenLoadingText; }
 if(loadingTextAlign == null){ loadingTextAlign = gcjDhccFullScreenLoadingTextAlign; }
 if(loadingImgPath == null){ loadingImgPath = gcjDhccFullScreenLoadingImgPath; }
 if(imgHAlign == null){ imgHAlign = gcjDhccFullScreenLoadingImgHAlign; }
 if(imgVAlign == null){ imgVAlign = gcjDhccFullScreenLoadingImgVAlign; }
 if(bKImgPath == null){ bKImgPath = gcjDhccFullScreenBKImgPath; }
 if(documentObj == null){ documentObj = gcjDhccFullScreenDocumentObj; }
 else{gcjDhccFullScreenDocumentObj = documentObj;}
 
 //�ж� fullScreen �Ƿ����
 try{
  if(documentObj.document.getElementById("gcjDhccFullScreen")){return null; }
 }
 catch(e){}
 //��ʼ���� fullScreen
 var divObj = documentObj.document.createElement("div"); 
 divObj.setAttribute("id", "gcjDhccFullScreen");
 divObj.style.display = "none";  //���ɼ�
 divObj.style.position = "absolute"; 
 //����
 divObj.style.top = documentObj.document.body.scrollTop;
 divObj.style.left = 0;

 divObj.style.align = "center";
 divObj.style.width = "100%";
 divObj.style.height = "100%";
 divObj.style.backgroundImage = "url("+ bKImgPath +")";
 divObj.style.zIndex = 999;
 var loadingHtml = '<table width="100%" height="100%" align="'+ imgHAlign +'" valign="'+ imgVAlign +'" border="0" cellpadding="0" cellspacing="0">';
 loadingHtml += '<tr><td ondblclick="hideGcjDhccFullScreen();" align="'+ imgHAlign +'" valign="'+ imgVAlign +'">';
 //ͼƬ�Ϸ� up���� down���� left���� right,�� center
  if(loadingTextAlign == "center"){
  loadingHtml +='<div  align="left" style="width:206px;height:34px;*height:48px;_height:48px;padding-top:14px;background-image:url('+loadingImgPath +')">';
  loadingHtml += '&nbsp;&nbsp;'+'<img src="img/loading.gif" height="100" />'+'&nbsp;&nbsp;';
  loadingHtml += loadingText +'</div>';
 }
 else if(loadingTextAlign == "up"){
  loadingHtml += '<div align="'+ imgHAlign +'">'+ loadingText +'<div>';
  loadingHtml += '<img src="'+ loadingImgPath +'" />';
 }
 else if(loadingTextAlign == "down"){
  loadingHtml += '<img src="'+ loadingImgPath +'" />';
  loadingHtml += '<div align="'+ imgHAlign +'">'+ loadingText +'<div>';
 }
 else if(loadingTextAlign == "left"){
  loadingHtml += loadingText +'&nbsp;&nbsp;';
  loadingHtml += '<img src="'+ loadingImgPath +'" />';
 }
 else if(loadingTextAlign == "right"){
  loadingHtml += '<img src="'+ loadingImgPath +'" />';
  loadingHtml += '&nbsp;&nbsp;'+ loadingText;
 }
 loadingHtml += '</td></tr>';
 loadingHtml += '</table>';
 divObj.innerHTML = loadingHtml;
 
 //��ʼ���� iframe
 /*
 var iframeObj = documentObj.document.createElement("iframe");
 iframeObj.setAttribute("id", "gcjDhccFullScreenIframe");
 iframeObj.style.filter = "progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=0)";
 
 iframeObj.style.display = "none";  //���ɼ�
 iframeObj.style.position = "absolute";  //����
 iframeObj.style.top = document.body.scrollTop;
 iframeObj.style.left = 0;
 iframeObj.style.width = document.body.clientWidth;
 iframeObj.style.height = document.body.clientHeight;
 iframeObj.style.allowtransparency ="true";
 iframeObj.style.backgroundcolor ="transparent";
 iframeObj.style.zIndex = 998;
 
 // body ����� iframe
 documentObj.document.body.appendChild(iframeObj);
 */
 // body ����� div
 documentObj.document.body.appendChild(divObj);
 documentObj.onscroll = function(){
				var scrollTop = documentObj.document.body.scrollTop;
			
				documentObj.document.getElementById("gcjDhccFullScreen").style.top = scrollTop + "px";
				//document.getElementById("gcjDhccFullScreenIframe").style.top = scrollTop + "px";
			}
}
//��ʾ fullScreen

function showGcjDhccFullScreen()
{
 try{
  gcjDhccFullScreenDocumentObj.document.getElementById("gcjDhccFullScreen").style.display = "block";
  //gcjDhccFullScreenDocumentObj.document.getElementById("gcjDhccFullScreenIframe").style.display = "block";
 }
 catch(e){ window.alert('showGcjDhccFullScreen'); }
}
//���� fullScreen
function hideGcjDhccFullScreen()
{
 try{
  gcjDhccFullScreenDocumentObj.document.getElementById("gcjDhccFullScreen").style.display = "none";
  //gcjDhccFullScreenDocumentObj.document.getElementById("gcjDhccFullScreenIframe").style.display = "none";
 }
 catch(e){ window.alert('hideGcjDhccFullScreen'); }
}
function hideGcjDhccFullScreen1(ycdiv)
{
 try{
  ycdiv.document.getElementById("gcjDhccFullScreen").style.display = "none";
  //gcjDhccFullScreenDocumentObj.document.getElementById("gcjDhccFullScreenIframe").style.display = "none";
 }
 catch(e){ window.alert('hideGcjDhccFullScreen'); }
}
/**************************** END ****************************/
  
  //���Է��� -- ���� test(); ���в���

  function djdd()
  {
   createGcjDhccFullScreen('<font style="font-size:18px; color:#ff0000;">���������� ������</font>', null, null, null, null, null, null);
   showGcjDhccFullScreen();
  }
//��߿�ܵ�����ұ���ʾ�ȴ�
function jzdd()
  {
   createGcjDhccFullScreen('<font style="font-size:18px; color:#ff0000;">���������� ������</font>', null, null, null, null, null,parent.parent.mainFrame);
   showGcjDhccFullScreen();
  }
/**
 * ��ע���������form.submit();ʱ��ʾ�����ܻ����ͼƬ���ز�������
 * ���������������ʱ����form.submit();
 *
 * ��ʱ�������� *
 */
function formdd(form)
{
 createGcjDhccFullScreen('<font style="font-size:18px; color:#ff0000;">���������� ������</font>', null, null, null, null, null, null);
 showGcjDhccFullScreen();
 setTimeout(formSubmit(form),3000);  //��ʱ����formSubmit()����
}
function formSubmit(a)
{
   //action�����form�����ã����п��Բ�д
 a.submit();
}


