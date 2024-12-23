package com.inswave.proworks.cmmn;

import java.util.Map;

import com.inswave.elfw.ElConstants;
import com.inswave.elfw.adapter.AdapterException;
import com.inswave.elfw.core.ElHeader;
import com.inswave.elfw.core.UserHeader;
import com.inswave.elfw.session.UserHeaderSetAdapter;
import com.inswave.elfw.util.ControllerContextUtil;

public class ProworksUserHeaderSetAdapter extends UserHeaderSetAdapter{

	public ProworksUserHeaderSetAdapter(Map<String, Object> adapterInfoMap) {
		super(adapterInfoMap);
	}

	public void setInputUserHeader(UserHeader userHeader) throws AdapterException {
		ProworksUserHeader inputUserHeader = (ProworksUserHeader) userHeader;

		if (inputUserHeader != null) {
			// Input から入ってきたヘッダ値で Context の UserHeader 値を設定し、Controller に渡します。
			// (必要な値だけ - 改ざんされる危険性のある項目は除く)
			ProworksUserHeader contextUserHeader = null;
			try {
			    contextUserHeader = (ProworksUserHeader) ControllerContextUtil.getUserHeader();
            }catch(Exception e){}
            
			if (contextUserHeader != null) {
				userHeader.setUserId(contextUserHeader.getUserId());
				userHeader.setUserGroupNo(contextUserHeader.getUserGroupNo());			
				// 以下の例
				//contextUserHeader.setLocation(inputUserHeader.getLocation());
				//contextUserHeader.setFldLen(inputUserHeader.getFldLen());
			} else {
			    contextUserHeader = new ProworksUserHeader();
			}
		}
	}

	public UserHeader getOutputUserHeader(String outputType, ElHeader elHeader, UserHeader userHeader, Object obj) throws AdapterException {
	    ProworksUserHeader paramUserHeader = new ProworksUserHeader();
	    try {
		    paramUserHeader = (ProworksUserHeader)userHeader;
		} catch( Exception e) {}
		
		if( outputType != null && ElConstants.OUTPUT_FLD.equals(outputType) ) {			
			if(  paramUserHeader != null ) {				
				byte[] bb = (byte [])obj;
				if( bb != null ) {
					// 以下の例
					//paramUserHeader.setFldLen(bb.length + paramUserHeader.getFixedTotalLength() - 10);				
				}
			}
		} 

		if(  paramUserHeader != null ) {
			if( elHeader.isResSuc() == false ) {
				// 以下の例
				//paramUserHeader.setSucYn("N");
				//paramUserHeader.setErrorCode(elHeader.getResCode());
				//paramUserHeader.setErrMag(elHeader.getResMsg());
			}else {
				// 以下の例
				//paramUserHeader.setSucYn("Y");
			}
		}
		return paramUserHeader;
	}

	public UserHeader getExceptionOutputUserHeader(String outputType, ElHeader elHeader) throws AdapterException {
		ProworksUserHeader userHeader = new ProworksUserHeader();
		
		// 以下の例
		// userHeader.setSucYn("N");

		if (elHeader != null) {
			// 以下の例
			//userHeader.setFldLen(userHeader.getFixedTotalLength() - 10);
			//userHeader.setErrorCode(elHeader.getResCode());
			//userHeader.setErrMag(elHeader.getResMsg());
		}

		return userHeader;
	}
	
		
}
