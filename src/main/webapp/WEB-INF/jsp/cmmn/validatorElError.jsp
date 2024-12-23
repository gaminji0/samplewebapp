<%@page import="com.inswave.elfw.login.LoginException"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%
    com.inswave.elfw.core.ElHeader  elHeader = (com.inswave.elfw.core.ElHeader)request.getAttribute("elHeader");

boolean resSuc = elHeader.isResSuc();
String resCode = elHeader.getResCode();
String resMsg  = elHeader.getResMsg();  

/* ############# エラーメッセージ処理の例 Start ##############
String errMsg = "";
java.util.HashMap<String,String> errorMap  = elHeader.getResValidatErr();

if( errorMap != null ) {
	Set set = errorMap.keySet();
	for( String filedName : errorMap.keySet() ) {
		String filedMsg = errorMap.get(filedName);
		errMsg = errMsg + "\\n" + filedMsg;	
	}
	if( errMsg != null && errMsg.length() > 0 ) errMsg = errMsg.substring(2);
}
############## エラーメッセージ処理の例 End ############## */

if( resSuc == false && 
  com.inswave.elfw.ElConstants.DEFAULT_VALIDATOR_ERR_CODE.equals(resCode)
) {	
	RequestDispatcher dispatcher =
    request.getRequestDispatcher( com.inswave.elfw.ElConstants.DEFAULT_VALIDATOR_DEFAULT_FORWARD_URL + ".do");
	dispatcher.forward(request, response);
}
%>