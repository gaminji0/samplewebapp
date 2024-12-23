package com.inswave.proworks.emp.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.inswave.elfw.exception.ElException;
import com.inswave.elfw.log.AppLog;

import com.inswave.proworks.cmmn.dao.ProworksDefaultAbstractDAO;
import com.inswave.proworks.emp.vo.DeptVo;
import com.inswave.proworks.emp.vo.EmpVo;

/**
 * @subject		: 従業員情報に関する処理を担当するDAO
 * @description	: 従業員情報に関する処理を担当するDAO
 * @author		: 開発チーム
 * @since 		: 2024/12/20
 * @modification
 * ===========================================================
 * DATE				AUTHOR				NOTE
 * ===========================================================
 * 2024/12/20		サンプル開発チーム			最初に作成
 * 
 */
@Repository("empDAO")
public class EmpDAO extends ProworksDefaultAbstractDAO {
	
	/**
	 * 従業員情報を登録処理する。
	 * @param empVo 従業員情報 EmpVo
	 * @return 処理件数 int
	 * @throws ElException
	 */
    public int insertEmp(EmpVo empVo) throws ElException {
        return insert("com.inswave.proworks.emp.insertEmp", empVo);
    }
    
    /**
     * 従業員情報を更新処理する。
     * @param empVo 従業員情報 EmpVo
     * @return 処理件数 int
     * @throws ElException
     */
    public int updateEmp(EmpVo empVo) throws ElException {
        return update("com.inswave.proworks.emp.updateEmp", empVo);
    }
    
    /**
     * 従業員情報を削除処理する。
     * @param empVo 従業員情報 EmpVo
     * @return 処理件数 int
     * @throws ElException
     */
    public int deleteEmp(EmpVo empVo) throws ElException {
    	return delete("com.inswave.proworks.emp.deleteEmp", empVo);
    }
    
    /**
     * 従業員情報を詳細に照会する。
     * @param empVo 従業員情報 EmpVo
     * @return 従業員情報 EmpVo
     * @throws ElException
     */
    public EmpVo selectEmp(EmpVo empVo) throws ElException {
        return (EmpVo) selectByPk("com.inswave.proworks.emp.selectEmp", empVo);
    }
    
    /**
     * 従業員情報のリストを照会する。
     * @param empVo 従業員情報 EmpVo
     * @return 従業員情報リスト List<EmpVo>
     * @throws ElException
     */
    public List<EmpVo> selectListEmp(EmpVo empVo) throws ElException {
    	AppLog.debug("DAOでログテストを行う");
        return list("com.inswave.proworks.emp.selectListEmp", empVo);
    }
    
    /**
     * 従業員情報リストの件数を照会する。
     * @param empVo 従業員情報 EmpVo
     * @return 従業員情報リストの件数 long
     * @throws ElException
     */
    public long selectListCountEmp(EmpVo empVo) throws ElException {
        return (Long) selectByPk("com.inswave.proworks.emp.selectListCountEmp", empVo);
    }
    
    /**
     * 部署情報リストを照会する。
     * @param searchKeyHm 条件検索情報 HashMap
     * @return 部署情報リスト ArrayList<DeptVo>
     * @throws ElException
     */
    public ArrayList<DeptVo> selectListDept(HashMap searchKeyHm) throws ElException {
    	return (ArrayList<DeptVo>) list("com.inswave.proworks.emp.selectListDept", searchKeyHm);
    }

}
