package com.inswave.proworks.emp.service;

import com.inswave.elfw.exception.ElException;
import com.inswave.proworks.emp.vo.EmpVo;

/**
 * @subject		: 従業員添付ファイル情報に関する処理を担当するサービスインターフェース
 * @description	: 従業員添付ファイル情報に関する処理を担当するサービスインターフェース
 * @author		: 開発チーム
 * @since 		: 2024/12/20
 * @modification
 * ===========================================================
 * DATE				AUTHOR				NOTE
 * ===========================================================
 * 2024/12/20		サンプル開発チーム			最初に作成
 * 
 */
public interface EmpFileService {
		
	/**
	 * 従業員添付ファイル情報を照会する。
	 * @param empVo 従業員情報 EmpVo
	 * @return 従業員情報 EmpVo
	 * @throws ElException
	 */
	public EmpVo selectEmpFile(EmpVo empVo) throws ElException;
		
	/**
	 * 従業員添付ファイル情報を登録する。
	 * @param empVo 従業員情報 EmpVo
	 * @return 処理件数 int
	 * @throws ElException
	 */
	public int insertEmpFile(EmpVo empVo) throws ElException;
	
	/**
	 * 従業員添付ファイル情報を更新する。
	 * @param empVo 従業員情報 EmpVo
	 * @return 処理件数 int
	 * @throws ElException
	 */
	public int updateEmpFile(EmpVo empVo) throws ElException;
	
	/**
	 * 従業員添付ファイル情報を削除する。
	 * @param empVo 従業員情報 EmpVo
	 * @return 処理件数 inst
	 * @throws ElException
	 */
	public int deleteEmpFile(EmpVo empVo) throws ElException;
	
	/**
	 * 従業員添付ファイルをアップロードする。
	 * @param empVo 従業員情報 EmpVo
	 * @throws Exception
	 */
	public void uploadEmpFile(EmpVo empVo) throws Exception;
	
}
