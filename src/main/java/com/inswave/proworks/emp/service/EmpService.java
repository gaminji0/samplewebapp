package com.inswave.proworks.emp.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.inswave.elfw.exception.ElException;

import com.inswave.proworks.emp.vo.DeptVo;
import com.inswave.proworks.emp.vo.EmpVo;

/**
 * @subject		: 従業員情報に関する処理を行うサービスインターフェース
 * @description	: 従業員情報に関する処理を行うサービスインターフェース
 * @author		: 開発チーム
 * @since 		: 2024/12/20
 * @modification
 * ===========================================================
 * DATE				AUTHOR				NOTE
 * ===========================================================
 * 2024/12/20		サンプル開発チーム			最初に作成
 * 
 */
public interface EmpService {
	
	/**
	 * ページング処理を行い、従業員情報のリストを取得する。
	 * @param empVo 従業員情報 EmpVo
	 * @return 従業員情報リスト List<EmpVo>
	 * @throws ElException
	 */
	public List<EmpVo> selectListEmp(EmpVo empVo) throws ElException;
	
	/**
	 * 従業員情報リストの件数を取得する。
	 * @param empVo 従業員情報 EmpVo
	 * @return 従業員情報リストの件数 long
	 * @throws ElException
	 */
	public long selectListCountEmp(EmpVo empVo) throws ElException;
	
	/**
	 * 従業員情報を詳細に取得する。
	 * @param empVo 従業員情報 EmpVo
	 * @return 従業員情報 EmpVo
	 * @throws ElException
	 */
	public EmpVo selectEmp(EmpVo empVo) throws ElException;
		
	/**
	 * 従業員情報を登録処理する。
	 * @param empVo 従業員情報 EmpVo
	 * @return 処理件数 int
	 * @throws Exception
	 */
	public int insertEmp(EmpVo empVo) throws Exception;
	
	/**
	 * 従業員情報を更新処理する。
	 * @param empVo 従業員情報 EmpVo
	 * @return 処理件数 int
	 * @throws Exception
	 */
	public int updateEmp(EmpVo empVo) throws Exception;
	
	/**
	 * 従業員情報を削除処理する。
	 * @param empVo 従業員情報 EmpVo
	 * @return 処理件数 int
	 * @throws Exception
	 */
	public int deleteEmp(EmpVo empVo) throws Exception;
	
	/**
	 * 部署情報のリストを取得する。
	 * @param searchKeyHm 条件検索情報 HashMap 
	 * @return 部署情報リスト ArrayList<DeptVo>
	 * @throws Exception
	 */
	public ArrayList<DeptVo> selectListDept(HashMap searchKeyHm) throws Exception;
	
}
