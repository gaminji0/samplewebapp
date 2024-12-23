package com.inswave.proworks.emp.service.impl;

import java.io.IOException;
import java.io.InputStream;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.inswave.elfw.exception.ElException;

import com.inswave.proworks.emp.dao.EmpFileDAO;
import com.inswave.proworks.emp.service.EmpFileService;
import com.inswave.proworks.emp.vo.EmpVo;

/**
 * @subject		: 従業員添付ファイル情報に関する処理を担当するサービス実装クラス
 * @description	: 従業員添付ファイル情報に関する処理を担当するサービス実装クラス
 * @author		: 開発チーム
 * @since 		: 2024/12/20
 * @modification
 * ===========================================================
 * DATE				AUTHOR				NOTE
 * ===========================================================
 * 2024/12/20		サンプル開発チーム			最初に作成
 * 
 */
@Service("empFileServiceImpl")
public class EmpFileServiceImpl implements EmpFileService {
	
    @Resource(name="empFileDAO")
    private EmpFileDAO empFileDAO;
    
	/**
	 * 従業員添付ファイル情報を照会する。
	 * @process
	 * 1. 従業員添付ファイル情報を照会する。
	 * 2. 照会結果をEmpVoタイプで返す。
	 * @param empVo 従業員情報EmpVo
	 * @return 従業員情報EmpVo
	 * @throws ElException
	 */
	public EmpVo selectEmpFile(EmpVo empVo) throws ElException {		
        EmpVo retVo = (EmpVo) empVo.clone();
        retVo = empFileDAO.selectEmpFile(retVo);
        return retVo;
	}

	/**
	 * 従業員添付ファイル情報を登録する。
	 * @process
	 * 1. 従業員添付ファイル情報を登録する。
	 * 2. 登録件数の結果をint型で返す。
	 * @param empVo 従業員情報EmpVo
	 * @return 処理件数 int
	 * @throws ElException
	 */
	public int insertEmpFile(EmpVo empVo) throws ElException {
		return empFileDAO.insertEmpFile(empVo);
	}

	/**
	 * 従業員添付ファイル情報を更新する。
	 * @process
	 * 1. 従業員添付ファイル情報を更新する。
	 * 2. 更新件数の結果をint型で返す。
	 * @param empVo 従業員情報EmpVo
	 * @return 処理件数 int
	 * @throws Exception
	 */
	public int updateEmpFile(EmpVo empVo) throws ElException {				
		return empFileDAO.updateEmpFile(empVo);				
	}

	/**
	 * 従業員添付ファイル情報を削除する。
	 * @process
	 * 1. 従業員添付ファイル情報を削除する。
	 * 2. 削除件数の結果をint型で返す。
	 * @param empVo 従業員情報EmpVo
	 * @return 処理件数 inst
	 * @throws Exception
	 */
	public int deleteEmpFile(EmpVo empVo) throws ElException {
		return empFileDAO.deleteEmpFile(empVo);
	}
	
	/**
	 * 従業員添付ファイルをアップロードする。
	 * @process
	 * 1. 既存の従業員添付ファイル情報を削除する。
	 * 2. 新規の従業員添付ファイル情報を登録する。
	 * @param empVo 従業員情報EmpVo
	 * @throws Exception
	 */
	public void uploadEmpFile(EmpVo empVo) throws Exception {
		if(empVo.getInputFileData() != null && empVo.getInputFileData().getSize() > 0) {
            EmpVo retEmpVo = (EmpVo) empVo.clone();
            retEmpVo = getEmpVo(empVo);
            empFileDAO.deleteEmpFile(retEmpVo);
            empFileDAO.insertEmpFile(retEmpVo);
        }
	}

	/**
	 * EmpVoのMultipartFileをStreamで読み取り、バイト配列データに格納する。
	 * @param empVo 従業員情報EmpVo
	 * @return 従業員情報EmpVo
	 * @throws ElException
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
