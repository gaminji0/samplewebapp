package com.inswave.proworks.cmmn;

import javax.servlet.http.HttpServletRequest;

import com.inswave.elfw.core.UserHeader;
import com.inswave.elfw.exception.UserException;
import com.inswave.elfw.util.ControllerContextUtil;

public class ProworksAuthProcess {


	public ProworksAuthProcess(){
	
	}
	
	public void checkAuth(HttpServletRequest request, String svcId, String inputData) throws UserException{
	
		UserHeader userHeader = ControllerContextUtil.getUserHeader();
		
//		try{
//			if( userHeader != null ) {  // セッションが存在する 
//				if( userHeader instanceof ProworksUserHeader ) {
//					ProworksUserHeader siteUserHeader = (ProworksUserHeader)userHeader;
//					String userId = siteUserHeader.getUserId();
//					
//					// ユーザーIDに基づいて ServiceImple を使用して権限などのチェックロジックを実行する -> 以下は ElBeanUtils を使用して権限チェックする例 
//					EmpService empService = (EmpService)ElBeanUtils.getBean("empServiceImpl");  
//					boolean bCheck = false;
//					//..... 権限チェックロジックの実行 
//					
//					if( false == bCheck) { // 権限チェック結果 
//					    throw new UserException("ERR.USER.0003");  // 権限が存在しません。
//					}
//				} else {
//					throw new UserException("ERR.USER.0002");  // セッションが存在しません。
//				}
//			} else { /// セッションが存在しない場合 
//				throw new UserException("ERR.USER.0002");  // セッションが存在しません。
//			}
//		}catch(UserException ue){
//			AppLog.error("CommAuthProcess-UserException", ue);
//			throw ue;
//		}catch(Exception e){
//			AppLog.error("CommAuthProcess-Exception", e);
//			throw new UserException("ERR.USER.0003");  // その他のエラーメッセージ....
//		}
	
	}
	
	
}
