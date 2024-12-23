package com.inswave.proworks.emp.dao;

import org.springframework.stereotype.Repository;

import com.inswave.proworks.cmmn.dao.ProworksDefaultAbstractDAO;
import com.inswave.proworks.emp.vo.EmpVo;
import com.inswave.elfw.exception.ElException;

/**
 * @subject		: 従業員添付ファイル情報に関する処理を担当するDAO
 * @description	: 従業員添付ファイル情報に関する処理を担当するDAO
 * @author		: 開発チーム
 * @since 		: 2024/12/20
 * @modification
 * ===========================================================
 * DATE				AUTHOR				NOTE
 * ===========================================================
 * 2024/12/20		サンプル開発チーム			最初に作成
 * 
 */
@Repository("empFileDAO")
public class EmpFileDAO extends ProworksDefaultAbstractDAO {
	
	/**
	 * 従業員添付ファイル情報を登録処理する。
	 * @param empVo 従業員情報 EmpVo
	 * @return 処理件数 int
	 * @throws ElException
	 */
    public int insertEmpFile(EmpVo empVo) throws ElException {    	
        return insert("com.inswave.proworks.emp.insertEmpFile", empVo);
    }
    
    /**
     * 従業員添付ファイル情報を更新処理する。
     * @param empVo 従業員情報 EmpVo
     * @return 処理件数 int
     * @throws ElException
     */
    public int updateEmpFile(EmpVo empVo) throws ElException {
        return update("com.inswave.proworks.emp.updateEmpFile", empVo);
    }
    
    /**
     * 従業員添付ファイル情報を削除処理する。
     * @param empVo 従業員情報 EmpVo
     * @return 処理件数 int
     * @throws ElException
     */
    public int deleteEmpFile(EmpVo empVo) throws ElException {
        return delete("com.inswave.proworks.emp.deleteEmpFile", empVo);
    }
    
    /**
     * 従業員添付ファイル情報を詳細に照会する。
     * @param empVo 従業員情報 EmpVo
     * @return 従業員情報 EmpVo
     * @throws ElException
     */
    public EmpVo selectEmpFile(EmpVo empVo) throws ElException {
        return (EmpVo) selectByPk("com.inswave.proworks.emp.selectEmpFile", empVo);
    }

}
