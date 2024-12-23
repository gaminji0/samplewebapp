<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
com.inswave.elfw.core.ElHeader elHeader = (com.inswave.elfw.core.ElHeader)request.getAttribute("elHeader");
com.inswave.elfw.core.UserHeader userHeader = (com.inswave.elfw.core.UserHeader)request.getAttribute("userHeader");
Object elData = request.getAttribute("elData");
java.util.Map<String,Object> mpModel = new java.util.HashMap<String, Object>();
String reqUrl = elHeader.getReqUrl();

if( reqUrl.endsWith(".do") && elData != null && elData instanceof com.inswave.elfw.core.CommVO) {  // リクエストURLが.doで、レスポンスデータがVOタイプの場合 
	com.inswave.elfw.core.CommVO commVo = (com.inswave.elfw.core.CommVO)elData;

	mpModel.put(com.inswave.elfw.ElConstants.EL_HEADER_STRING, elHeader);
	mpModel.put(com.inswave.elfw.ElConstants.USER_HEADER_STRING, userHeader);
	mpModel.put(com.inswave.elfw.ElConstants.EL_DATA_STRING, commVo);

	try{
		String resEncode = "EUC-KR";  // 使用するエンコーディングの設定 
		
		com.inswave.elfw.view.ElMappingJacksonObjectMapper elJacksonOm 
		  = (com.inswave.elfw.view.ElMappingJacksonObjectMapper)com.inswave.elfw.util.ElBeanUtils.getBean("jsonMapper");
		String outJson = elJacksonOm.writeValueAsString(mpModel); // jsonに変換 
		
		out.println(outJson);

    } catch(Exception e){
    	com.inswave.elfw.log.AppLog.error("err",e);
        //TODO : エラー発生に対する処理 -> 必要に応じて業務要件を適用
       	
    } 
} else {
	//TODO: 業務要件に合わせて構成可能 
}
%>