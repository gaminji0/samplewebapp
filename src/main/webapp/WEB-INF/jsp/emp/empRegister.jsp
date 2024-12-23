<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="com.inswave.elfw.util.*"%>
<%@page import="com.inswave.proworks.emp.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%
    java.util.Enumeration eAttr = request.getAttributeNames();
while (eAttr.hasMoreElements()) {
    String aName = (String)eAttr.nextElement();
    Object obj = request.getAttribute(aName);    
    //out.println(aName + " : " + obj.toString() + "<br>");    
}

/**
* @Class Name : empRegister.jsp
* @Description : 従業員の詳細情報処理画面
* @Modification Information
* 
*   修正日         修正者                   修正内容
*  -------    --------    ---------------------------
*  2022.06.01            最初の作成
*
* author 実行環境開発チーム
* since 2022.06.01
*  
*/
%>


<%
    /* 共通情報 */
com.inswave.elfw.core.ElHeader  elHeader = (com.inswave.elfw.core.ElHeader)request.getAttribute("elHeader");
boolean resSuc = elHeader.isResSuc();
String resCode = elHeader.getResCode();
String resMsg  = elHeader.getResMsg(); 
java.util.HashMap<String,String> errorMap  = elHeader.getResValidateErr();

EmpListVo empListVo = (EmpListVo)request.getAttribute("empListVo");

/* 業務情報 */
EmpVo empVo = empListVo.getEmpVo();
if(empVo==null) empVo = new EmpVo();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>従業員情報 <c:out value="${registerFlag}"/> </title>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/ElDemo.css'/>"/>
<script type="text/javascript" src="<c:url value='/js/comm/ElComm.js'/>"></script>

<script type="text/javaScript" language="javascript" defer="defer">
<!--
/* 従業員一覧画面 function */
function fn_emp_selectList() {
	location.href = "html/emp/empList.html";
}


function fn_downEmpFile(){
	document.detailForm.action = "<c:url value='/DmoEmpDown.do'/>";
   	document.detailForm.submit();		
}

-->
</script>
</head>
<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">


<form name="detailForm" method="post"  enctype="multipart/form-data">
<div id="content_pop">
	<!-- タイトル -->
	<div id="title">
		<ul>
			<li><img src="<c:url value='/images/sample/rte/title_dot.gif'/>"> 従業員詳細情報</li>
		</ul>
	</div>

	<!-- // タイトル -->
	<div id="table">	
	<table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#D3E2EC" bordercolordark="#FFFFFF" style="BORDER-TOP:#C2D0DB 2px solid; BORDER-LEFT:#ffffff 1px solid; BORDER-RIGHT:#ffffff 1px solid; BORDER-BOTTOM:#C2D0DB 1px solid; border-collapse: collapse;">
		<colgroup>
			<col width="150">
			<col width="">
		</colgroup>

		<tr>
			<td class="tbtd_caption">* 社員番号</td>
			<td class="tbtd_content" colspan='2'>
					<input type='text' name="empno" class="essentiality" readOnly="true" maxlength="4" value="<%=empVo.getEmpno()%>"/>
			</td>			
		</tr>
		 
		<tr>
			<td class="tbtd_caption">* 氏名</td>
			<td class="tbtd_content" colspan='2'>
				<input type='text' name="ename" maxlength="10" class="txt" value="<%=empVo.getEname()%>"/>
			</td>
		</tr>
		<tr>
			<td class="tbtd_caption">* 職種</td>
			<td class="tbtd_content" colspan='2'>
				<input type='text' name="job" maxlength="10" class="txt" value="<%=empVo.getJob()%>"/>
			</td>
		</tr>	
		<tr>
			<td class="tbtd_caption">* 上司</td>
			<td class="tbtd_content" colspan='2'>
				<input type='text' name="mgr" maxlength="4" class="txt" value="<%=empVo.getMgr()%>"/>					
			</td>
		</tr>	
		
		<tr>
			<td class="tbtd_caption">入社日</td>
			<td class="tbtd_content" colspan='2'>
				<input type='text' name="hiredate" maxlength="20" class="txt" value="<%=empVo.getHiredate()%>"/>	
							
			</td>
		</tr>
		
		<tr>
			<td class="tbtd_caption">* 給与</td>
			<td class="tbtd_content" colspan='2'>
				<input type='text' name="sal" maxlength="10" class="txt" value="<%=empVo.getSal()%>"/>								
			</td>
		</tr>	
		
		<tr>
			<td class="tbtd_caption">賞与</td>
			<td class="tbtd_content" colspan='2'>
				<input type='text' name="comm" maxlength="10" class="txt" value="<%=empVo.getComm()%>"/>				
			</td>
		</tr>						
		
		<tr>
			<td class="tbtd_caption">* 部門コード</td>
			<td class="tbtd_content" colspan='2'>

				<select name="deptno" class="use">
					<option value="" selected>-全体-</option>
					<%
					java.util.List<DeptVo> listDeptVo = empListVo.getDeptVoList();
					if( listDeptVo != null ) {
						for( DeptVo deptVo: listDeptVo){
							String selected = "";
							if( empVo.getDeptno() != null && deptVo.getDeptno() != null && empVo.getDeptno().equals(deptVo.getDeptno())) {
								selected = " selected";
							}
						%>
							<option value="<%=deptVo.getDeptno()%>"<%=selected%>><%=deptVo.getDname()%></option>	
						<%
						}
					}
					%>
				</select>												
			</td>
		</tr>	
		
		<tr>
			<td class="tbtd_caption">説明</td>
			<td class="tbtd_content" colspan='2'>
				<textarea name="account" class="txt" cols="65" rows="5"><%=empVo.getAccount()==null ? "" : empVo.getAccount()%></textarea>								
			</td>
		</tr>	
			
		<tr>
			<td class="tbtd_caption">添付ファイル</td>
			<td class="tbtd_content" colspan='2'>
						<a href='javascript:fn_downEmpFile()'><span id='span_fileName'>&nbsp;&nbsp;&nbsp;<%=empVo.getFileName()%></span></a> 												
			</td>
		</tr>	
			
	</table>
    </div>
	
	<div id="sysbtn">
		<ul>
			<li><span class="btn_blue_l"><a href="javascript:fn_emp_selectList();">リスト</a><img src="<c:url value='/images/sample/rte/btn_bg_r.gif'/>" style="margin-left:6px;"></span></li>
	</div>
</div>


</form>
</body>
</html>
