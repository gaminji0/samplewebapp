package com.inswave.proworks.cmmn;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.inswave.elfw.exception.ElException;
import com.inswave.elfw.log.AppLog;
import com.inswave.elfw.login.LoginAdapter;
import com.inswave.elfw.login.LoginException;
import com.inswave.elfw.login.LoginInfo;
import com.inswave.elfw.util.ElBeanUtils;

import com.inswave.proworks.emp.service.EmpService;
import com.inswave.proworks.emp.vo.EmpVo;

/**
 * @subject		: ProworksLoginAdapter.java 
 * @description : プロジェクトログイン アダプター
 * @author		: 開発チーム
 * @since 		: 2024/12/20
 * @modification
 * ===========================================================
 * DATE				AUTHOR				NOTE
 * ===========================================================
 * 2024/12/20		サンプル開発チーム			最初に作成
 * 
 */
public class ProworksLoginAdapter extends LoginAdapter {

    
	/**
	 * デモ用ログイン アダプターのコンストラクター
	 * @param adapterInfoMap アダプター情報
	 */
	public ProworksLoginAdapter(Map<String, Object> adapterInfoMap){
		super(adapterInfoMap);
	}

	/**
	 * デモ用ログイン処理を担当する実装体メソッド。
	 * フレームワーク DefaultLoginAdapter 抽象クラスのログイン実装体メソッド
	 * @param request
	 * @param id
	 * @param params その他の動的パラメーターに追加できる。(例: サービス実装体)
	 * @return LoginInfo
	 * @throws LoginException
	 */
	@Override
	public LoginInfo login(HttpServletRequest request, String id, Object... params) throws LoginException {

		// ログイン チェックを実行する (サンプル例)
		try{
			String pw = (String)params[0];
			EmpService empService = (EmpService)ElBeanUtils.getBean("empServiceImpl");
			EmpVo empVo = new EmpVo();

			empVo.setEmpno(Integer.parseInt(id) );
			EmpVo resEmpVo = empService.selectEmp(empVo);

			if( resEmpVo == null ) {
				throw new LoginException("EL.ERROR.LOGIN.0001");
			}
			
			String resPw = String.valueOf(resEmpVo.getMgr());
			if(pw == null || !pw.equals(resPw)){
				throw new LoginException("EL.ERROR.LOGIN.0002");
			}
		}catch(NumberFormatException e){
			AppLog.error("login Error1",e);
			throw new LoginException("EL.ERROR.LOGIN.0001");
		}catch(ElException e){
			AppLog.error("login Error2",e);
			throw e;		
		}catch(Exception e){
			AppLog.error("login Error3",e);
			throw new LoginException("EL.ERROR.LOGIN.0003");
		}

		
		// 3. ログイン成功設定 
		LoginInfo info = new LoginInfo();		
		info.setSuc(true);
		AppLog.debug("[Login] Proworks ログイン成功.....");
			
		return info;
	}

	/**
	 * デモ用ログアウト処理を担当する実装体メソッド。
	 * フレームワーク DefaultLoginAdapter 抽象クラスのログアウト実装体メソッド
	 * @param request
	 * @param id
	 * @param params その他の動的パラメーターに追加できる。
	 * @return LoginInfo
	 * @throws LoginException
	 */
	@Override
	public LoginInfo logout(HttpServletRequest request, String id, Object... params) throws LoginException {
		LoginInfo info = new LoginInfo();
		try{			
			// 1. ログアウト処理ロジックを追加する
			
			// 2. ログアウト成功設定 
			info.setSuc(true);
			AppLog.debug("[Logout] Proworks ログアウト成功.....");
			
		}catch(Exception e){
			throw new LoginException(e);
		}		
		return info;
	}

}
