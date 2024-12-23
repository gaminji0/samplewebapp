package com.inswave.proworks.cmmn;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.ExtendedModelMap;
import org.springframework.ui.Model;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.fasterxml.jackson.databind.JsonNode;
import com.inswave.elfw.ElConstants;
import com.inswave.elfw.core.CoreHeader;
import com.inswave.elfw.core.ElHeader;
import com.inswave.elfw.core.UserHeader;
import com.inswave.elfw.exception.ElException;
import com.inswave.elfw.exception.UserException;
import com.inswave.elfw.intercept.service.ElSystemHandleAdapter;
import com.inswave.elfw.log.AppLog;
import com.inswave.elfw.util.ControllerContextUtil;
import com.inswave.elfw.util.ElBeanUtils;
import com.inswave.elfw.view.ElMappingJacksonObjectMapper;

public class ProworksSystemHandleAdapter extends ElSystemHandleAdapter {

 
	public ProworksSystemHandleAdapter(Map<String, Object> adapterInfoMap) {
		super(adapterInfoMap);
	}

	@Override
	public void preHandle(HttpServletRequest request, String inputData) throws UserException {
		AppLog.debug("[ProworksSystemHandleAdapter-preHandle]...");
		String contextPath = request.getContextPath();
		String reqUri =  request.getRequestURI();
		try{
			String svcId = reqUri.replaceFirst(contextPath, "");
			
			if( svcId.startsWith("/")) {
				svcId = svcId.substring(1);
			}
			
			int iSearch = svcId.lastIndexOf(".");
			String ext = "";
			if( iSearch > 0 ) {
				ext = svcId.substring(iSearch + 1);
				svcId = svcId.substring(0, iSearch);
			}
			
			AppLog.debug(" - svcId:[" + svcId + "]");         // サービスID
			AppLog.debug(" - ext:[" + ext + "]");             // リクエストの拡張子: pwkjson, fld
			AppLog.debug(" - inputData:[" + inputData + "]"); // リクエストのメッセージ 
			
			/////////////// ビジネス要件の処理 (権限処理など ... )  ////////////////////// 
			/// ElBeanUtils.getBean で取得したサービスを使って処理する
			/// セッションキーなどはHTTPヘッダーを使う
			
			// ビジネス共通側の権限チェックロジックに渡す -> 該当の実装クラスでスローによる権限チェック 
			new ProworksAuthProcess().checkAuth(request, svcId, inputData);			
			
		}catch(ElException e){
			AppLog.error("preHandle error", e);
			throw e;
		}catch(Exception e){
			AppLog.error("preHandle error", e);
			throw new UserException("ERROR.SYS.002");
		}
		
	}

	@Override
	public void postHandle(ElHeader elHeader, UserHeader userHeader, Object[] serviceParams, Model resultModel) {
		AppLog.debug("[ProworksSystemHandleAdapter-postHandle]...");
		
		// システムの後処理メソッドのパラメーター説明 
		// 1. ElHeader elHeader : フレームワークのヘッダー 
		// 2. UserHeadeer userHeader : ログインセッション情報 userHeader => プロジェクトのUserHeaderにキャストして使う
		// 3. Object[] serviceParams : リクエストサービスコントローラのメソッドパラメーター順 
		// 4. Model resultModel : サービス成功時にModelに格納された値 
		
		AppLog.debug("- elHeader:" + elHeader.toString()); // フレームワークのヘッダー出力 		
		boolean bSuc = elHeader.isResSuc(); // ビジネス処理のエラー発生有無 
		String svcId = elHeader.getServiceKey();
		
		AppLog.debug("- svcId postHandle:" + svcId);
		long loStartTime = elHeader.getStartTime();
		long loRunTime = System.currentTimeMillis() - loStartTime;
		
		AppLog.debug("- loRunTime (ms):" + loRunTime);
		
		
		
		try{
			if( bSuc == false ) { // 失敗の場合 - 以下のブロックは参考用コード 
				Object obj = elHeader.getObjArgParsingData(); // リクエストサービスの最初のリクエストデータ 
				if( obj != null) {	
					if( obj instanceof JsonNode ) {
						JsonNode jObj = (JsonNode)obj;
						AppLog.debug("- JSON Object: " + jObj); // リクエストサービスの最初のリクエストデータのJSONオブジェクト 
					
						ElMappingJacksonObjectMapper elJacksonObjMapper = (ElMappingJacksonObjectMapper)ElBeanUtils.getBean("jsonMapper");
						String jsonString = elJacksonObjMapper.writeValueAsString(jObj);
						
						AppLog.debug("- JSON String: " + jsonString); // リクエストサービスの最初のリクエストデータのJSON文字列 
						
						//############## JSONオブジェクトまたはJSON文字列を使ってサービスの入力データとして活用 ##################
						 
					}
				}
			}
		} catch(Exception e){
			AppLog.error("postHandle Error", e);
		}
		
		if (resultModel == null) 
{
            CoreHeader coreHeader = ControllerContextUtil.getCoreHeader();

            if (coreHeader == null) {
                coreHeader = new CoreHeader();
            }

            resultModel = coreHeader.getModel();

            if (resultModel == null) {
                resultModel = new ExtendedModelMap();
            }
        }
        
		/////////////////  ElHeaderから除外したい項目を設定できます  //////////////////////
		elHeader.setObjArgParsingData(null);
		elHeader.setjSessionID(null);
		elHeader.setCookieStr(null);
		resultModel.addAttribute(ElConstants.EL_HEADER_STRING, elHeader );
		
		/////////////////  CfwUserHeaderから除外したい項目を設定できます  //////////////////////
		if( userHeader != null && userHeader instanceof ProworksUserHeader ) {
			ProworksUserHeader siteUserHeader = (ProworksUserHeader)userHeader;
			siteUserHeader.setUserGroupNm(null);
			resultModel.addAttribute(ElConstants.USER_HEADER_STRING, siteUserHeader);		
		}
		
		//##### elHeader、userHeader、elDataのみOutputに含まれます 	
		ArrayList<String> alDelKey = new ArrayList<String>();	
		Map<String,Object> mpModel = resultModel.asMap();
        for( String key : mpModel.keySet() ) {
            
            if( !( ElConstants.EL_HEADER_STRING.equals( key ) 
                || ElConstants.USER_HEADER_STRING.equals( key ) 
                || ElConstants.EL_DATA_STRING.equals( key ) 
               )
            ) {
            	alDelKey.add(key);
            }
        }        
        for( String delKey : alDelKey ) {
        	mpModel.remove(delKey);
        }		
				
        ServletRequestAttributes servletRequestAttribute = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpServletRequest request = servletRequestAttribute.getRequest();
        request.setAttribute(ElConstants.EL_HEADER_STRING, elHeader);
        request.setAttribute(ElConstants.USER_HEADER_STRING,
        resultModel.getAttribute(ElConstants.USER_HEADER_STRING));
		
	}

}
