package com.inswave.proworks.cmmn;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.inswave.elfw.adapter.AdapterException;
import com.inswave.elfw.exception.ElException;
import com.inswave.elfw.log.AppLog;
import com.inswave.elfw.session.SessionDataAdapter;
import com.inswave.elfw.util.ElBeanUtils;

import com.inswave.proworks.emp.service.EmpService;
import com.inswave.proworks.emp.vo.EmpVo;

/**  
 * @Class Name : ProworksSessionDataAdapter.java
 * @Description : プロジェクトセッションデータアダプター - ログイン後にユーザーヘッダー情報を設定する。 
 * @Modification Information  
 * @
 * @  修正日                  修正者                  修正内容
 * @ ---------   ---------   -------------------------------
 * @ 2019.08.01   EL開発チーム             最初の作成
 * 
 * @author EL開発チーム
 * @since 2013.08.01
 * @version 1.0
 * @see
 * 
 *  Copyright (C) by Inswave All right reserved.
 */
public class ProworksSessionDataAdapter extends SessionDataAdapter {
	/**
	 * SessionAdapterのコンストラクターです。
	 * 
	 * @param adapterInfoMap アダプター情報
	 */
	public ProworksSessionDataAdapter(Map<String, Object> adapterInfoMap) {
		super(adapterInfoMap);
	}

	/**
	 * デモ用セッションデータのロードを担当する実装メソッド。
	 * - フレームワークSessionDataAdapter抽象クラスのセッションデータを設定する実装メソッド
	 * - プロジェクトに必要なヘッダー情報を設定する。 
	 * - 該当のヘッダー情報はログイン後に使用可能です。 
	 * 
	 * @param request HttpServletRequest
	 * @param id
	 * @param obj その他の動的パラメーターに追加できる。(例: サービス実装体)
	 * @return ProworksUserHeader
	 * @throws AdapterException
	 */
	@Override
	public ProworksUserHeader setSessionData(HttpServletRequest request, String id, Object... obj) throws AdapterException{
		
		// ログイン後にidベースでセッション情報を設定して返す。		
		ProworksUserHeader userHeader = new ProworksUserHeader();
		userHeader.setUserId( id );

		// ユーザーセッションをUserHeaderに設定 (サンプル例)
		try{
			EmpService empService = (EmpService)ElBeanUtils.getBean("empServiceImpl");
			EmpVo empVo = new EmpVo();

			empVo.setEmpno(Integer.parseInt(id));
			EmpVo resEmpVo = empService.selectEmp(empVo);

			if( resEmpVo == null ) {
				throw new AdapterException("EL.ERROR.LOGIN.0004", new String[]{id});
			}
			
			// ユーザーセッションの設定
			userHeader.setTestDeptNo(resEmpVo.getDeptno());
			userHeader.setTestDeptName(resEmpVo.getDname());
		}catch(ElException e){
			AppLog.error("setSessionData Error1",e);
			throw e;
		}catch(Exception e){
			AppLog.error("setSessionData Error2",e);
			throw new AdapterException("EL.ERROR.LOGIN.0005");
		}
		
		return userHeader;
	}

}
