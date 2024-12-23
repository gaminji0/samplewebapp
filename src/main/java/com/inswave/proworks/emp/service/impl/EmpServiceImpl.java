package com.inswave.proworks.emp.service.impl;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.inswave.elfw.exception.ElException;

import com.inswave.proworks.emp.dao.EmpDAO;
import com.inswave.proworks.emp.service.EmpFileService;
import com.inswave.proworks.emp.service.EmpService;
import com.inswave.proworks.emp.vo.DeptVo;
import com.inswave.proworks.emp.vo.EmpVo;

/**
 * @subject		: 従業員情報に関する処理を担当するサービス実装クラス
 * @description	: 従業員情報に関する処理を担当するサービス実装クラス
 * @author		: 開発チーム
 * @since 		: 2024/12/20
 * @modification
 * ===========================================================
 * DATE				AUTHOR				NOTE
 * ===========================================================
 * 2024/12/20		サンプル開発チーム			最初に作成
 * 
 */
@Service("empServiceImpl")
public class EmpServiceImpl implements EmpService {
	
    @Resource(name="empDAO")
    private EmpDAO empDAO;
        
    @Resource(name = "empFileServiceImpl")
    private EmpFileService empFileService;
	
    /**
     * ページング処理を行い、従業員情報のリストを取得する。
     * @process
     * 1. 従業員情報のリストを取得する。
     * 2. 取得結果をList<EmpVo>型で返す。
	 * @param empVo 従業員情報 EmpVo
	 * @return 従業員情報リスト List<EmpVo>
	 * @throws ElException
     */
	public List<EmpVo> selectListEmp(EmpVo empVo) throws ElException {
		List<EmpVo> list = empDAO.selectListEmp(empVo);	
		return list;
	}
	
	/**
	 * 従業員情報リストの件数を取得する。
     * @process
     * 1. 従業員情報リストの件数を取得する。
     * 2. 取得結果をlong型で返す。
	 * @param empVo 従業員情報 EmpVo
	 * @return 従業員情報リストの件数 long
	 * @throws ElException
	 */
	public long selectListCountEmp(EmpVo empVo) throws ElException {
		return empDAO.selectListCountEmp(empVo);
	}

    /**
	 * 従業員情報を詳細に取得する。
     * @process
     * 1. 従業員情報を詳細に取得する。
     * 2. 取得結果をEmpVo型で返す。
	 * @param empVo 従業員情報 EmpVo
	 * @return 従業員情報 EmpVo
	 * @throws ElException
     */
	public EmpVo selectEmp(EmpVo empVo) throws ElException {
		EmpVo resultVO = empDAO.selectEmp(empVo);
		
//		if (resultVO == null) {
//			throw new UserException("EL.ERROR.COMM.001"); // 別途例外メッセージが必要な場合の処理例
//		}
		
        return resultVO;
	}

    /**
	 * 従業員情報を登録処理する。
     * @process
     * 1. 従業員情報を登録処理する。
     * 2. 処理件数をint型で返す。
	 * @param empVo 従業員情報 EmpVo
	 * @return 処理件数 int
	 * @throws ElException
	 * @throws IOException
     */
	public int insertEmp(EmpVo empVo) throws ElException, IOException {
        int iRet = empDAO.insertEmp(empVo);
        
        if(empVo.getInputFileData() != null  && empVo.getInputFileData().getSize() > 0) {
            EmpVo retEmpVo = (EmpVo)empVo.clone();
            retEmpVo = getEmpVo(empVo);
            
            empFileService.insertEmpFile(retEmpVo);
        }
        
        return iRet;
	}
	
    /**
	 * 従業員情報を更新処理する。
     * @process
     * 1. 従業員情報を更新処理する。
     * 2. 処理件数をint型で返す。
	 * @param empVo 従業員情報 EmpVo
	 * @return 処理件数 int
	 * @throws ElException
	 * @throws IOException
     */
	public int updateEmp(EmpVo empVo) throws ElException, IOException {				
        int updRet = empDAO.updateEmp(empVo);
        
        if(empVo.getInputFileData() != null && empVo.getInputFileData().getSize() > 0) {
            EmpVo retEmpVo = (EmpVo)empVo.clone();
            retEmpVo = getEmpVo(empVo);
            
            empFileService.deleteEmpFile(retEmpVo);
            empFileService.insertEmpFile(retEmpVo);
        } else {
        	if(empVo.getFileName() == null || "".equals(empVo.getFileName())) {
        		empFileService.deleteEmpFile(empVo); // 添付ファイルの削除
        	}
        }
        
        return updRet;   		
	}

    /**
	 * 従業員情報を削除処理する。
     * @process
     * 1. 従業員情報を削除処理する。
     * 2. 処理件数をint型で返す。
	 * @param empVo 従業員情報 EmpVo
	 * @return 処理件数 int
	 * @throws ElException
     */
	public int deleteEmp(EmpVo empVo) throws ElException {
		int del = empDAO.deleteEmp(empVo);
		empFileService.deleteEmpFile(empVo);
		
		return del;
	}	
		
    

    /**
     * 部署情報リストを取得する。
     * @process
     * 1. 部署情報リストを取得する。
     * 2. 取得結果をArrayList<DeptVo>型で返す。
     * @param searchKeyHm 条件検索情報HashMap
     * @return 部署情報リストArrayList<DeptVo>
     * @throws ElException
     */
    public ArrayList<DeptVo> selectListDept(HashMap searchKeyHm) throws ElException {
        return empDAO.selectListDept(searchKeyHm);
    }

    /**
     * EmpVoのMultipartFileをStreamで読み取り、バイト配列データに格納する。
     * @param empVo 従業員情報EmpVo
     * @return 従業員情報EmpVo
     * @throws Exception
     * @throws IOException
     */
    private EmpVo getEmpVo(EmpVo empVo) throws ElException, IOException {
        if(empVo.getInputFileData() == null) {
            return null;
        }

        long iFileSize = empVo.getInputFileData().getSize();

        if(iFileSize > 0) {
            InputStream is = empVo.getInputFileData().getInputStream();
            byte[] fileData = new byte[(int) iFileSize];
            is.read(fileData);
            is.close();

            empVo.setFileName(empVo.getInputFileData().getOriginalFilename());
            empVo.setFileData(fileData);
        }

        return empVo;
    }
    
}
