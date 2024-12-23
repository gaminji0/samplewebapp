package com.inswave.proworks.emp.web;

import java.io.BufferedOutputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.inswave.elfw.annotation.ElDescription;
import com.inswave.elfw.annotation.ElService;
import com.inswave.elfw.annotation.ElValidator;
import com.inswave.elfw.core.ElResDataVO;
import com.inswave.elfw.exception.UserException;
import com.inswave.elfw.log.AppLog;
import com.inswave.elfw.login.LoginInfo;
import com.inswave.elfw.login.LoginProcessor;
import com.inswave.elfw.util.ElHttpUtil;

import com.inswave.proworks.cmmn.ProworksUserHeader;
import com.inswave.proworks.cmmn.tcp.ProworksTcpLengthBaseSendUtil;
import com.inswave.proworks.emp.service.EmpFileService;
import com.inswave.proworks.emp.service.EmpService;
import com.inswave.proworks.emp.vo.DeptListVo;
import com.inswave.proworks.emp.vo.EmpListVo;
import com.inswave.proworks.emp.vo.EmpVo;

/**
 * @subject		: 従業員情報に関する処理を行うコントローラー
 * @description	: 従業員情報に関する処理を行うコントローラー
 * @author		: 開発チーム
 * @since 		: 2024/12/20
 * @modification
 * ===========================================================
 * DATE				AUTHOR				NOTE
 * ===========================================================
 * 2024/12/20		サンプル開発チーム			最初に作成
 * 
 */
@Controller
public class EmpController {
	
    @Resource(name = "empServiceImpl")
    private EmpService empService;
    
    @Resource(name = "empFileServiceImpl")
    private EmpFileService empFileService;
    
    @Resource(name = "loginProcess")
	protected LoginProcessor loginProcess;
    
	/**
	 * ログインを処理する。
	 * @param loginVo ログイン情報 LoginVo
	 * @param request リクエスト情報 HttpServletRequest
	 * @throws Exception
	 */
	@ElService(key = "CmmLogin")
    @RequestMapping(value = "CmmLogin")
    @ElDescription(sub = "ログイン", desc = "ログインを処理する。")
    public void login(com.inswave.proworks.emp.vo.LoginVo loginVo, HttpServletRequest request) throws Exception {
    	String id = loginVo.getId();
    	String pw = loginVo.getPw();
    	
    	LoginInfo info = loginProcess.processLogin(request, id, pw);
    	
    	AppLog.debug("- ログイン情報 : " + info.toString());
    }
	
	/**
	 * ログインフォームページをロードする。
	 * @param loginVo ログイン情報 LoginVo
	 * @param request リクエスト情報 HttpServletRequest
	 * @throws Exception
	 */
	@ElService(key = "CmmLoginFrm")    
    @RequestMapping(value = "CmmLoginFrm")   
    @ElDescription(sub = "ログインフォームページのロード", desc = "ログインフォームページをロードする。")           
    public void loginFrm(com.inswave.proworks.emp.vo.LoginVo loginVo, HttpServletRequest request) throws Exception {    
		String id = loginVo.getId();
		
		loginProcess.processLogout(request, id);
    }
    
	/**
	 * ページング処理を行い、従業員リストを照会する。
	 * @param empVo 従業員情報 EmpVo
	 * @return 従業員リスト情報 EmpListVo
	 * @throws Exception
	 */
	@ElService(key = "DmoEmpList")
    @RequestMapping(value = "DmoEmpList")    
    @ElDescription(sub = "従業員リストの照会", desc = "ページング処理を行い、従業員リストを照会する。")               
    public EmpListVo selectEmpList(EmpVo empVo) throws Exception {
    	AppLog.debug("従業員リスト照会ログテスト : " + empVo);
    	
        List<EmpVo> empList = empService.selectListEmp(empVo);
        long totCnt = empService.selectListCountEmp(empVo);
        
		EmpListVo retEmpVoList = new EmpListVo();
		retEmpVoList.setEmpVoList(empList); 
		retEmpVoList.setDeptVoList(empService.selectListDept(new HashMap()));
		retEmpVoList.setTotalCount(totCnt);

        return retEmpVoList;
    } 

    /**
     * 従業員登録フォームのための照会処理を行う。
     * @param empVo 従業員情報 EmpVo
     * @return 従業員登録フォーム情報 DeptListVo
     * @throws Exception
     */
    @ElService(key = "DmoEmpView")    
    @RequestMapping(value = "DmoEmpView")
    @ElDescription(sub = "従業員登録フォームのための照会", desc = "従業員登録フォームのための照会")
    public DeptListVo selectDeptList(EmpVo empVo) throws Exception {
        List<DeptListVo> deptList = empService.selectListDept(new HashMap());
        
        DeptListVo retDeptVoList = new DeptListVo();
        retDeptVoList.setDeptVoList(deptList);
        
        return retDeptVoList;
    }
    /**
     * 사원 정보를 등록 처리한다.
     * @param empVo 사원 정보 EmpVo
     * @return 사원 등록 폼 정보 DeptListVo
     * @throws Exception
     */
    @ElService(key = "DmoEmpIns")    
    @RequestMapping(value = "DmoEmpIns")
    @ElDescription(sub = "従業員登録処理", desc = "従業員情報を登録処理します。")
    @ElValidator(errUrl="")
    public DeptListVo addEmp(EmpVo empVo) throws Exception {    	
        DeptListVo deptListVo = new DeptListVo();
        deptListVo.setDeptVoList(empService.selectListDept(new HashMap()));
        
        empService.insertEmp(empVo);   
        
        return deptListVo;
    }

    /**
     * 従業員更新フォームのための照会処理を行います。
     * @param empVo 従業員情報 EmpVo
     * @return 従業員更新フォーム情報 EmpListVo
     * @throws Exception
     */
    @ElService(key = "DmoEmpUpdView")    
    @RequestMapping(value = "DmoEmpUpdView") 
    @ElDescription(sub = "従業員更新フォームのための照会", desc = "従業員更新フォームのための照会処理を行います。")    
    public EmpListVo updateEmpView(EmpVo empVo) throws Exception {
        EmpVo selectEmpVo = empService.selectEmp(empVo);
        EmpVo empFileVo = empFileService.selectEmpFile(empVo);
        
        if(empFileVo != null) {
            selectEmpVo.setFileName(empFileVo.getFileName());
        }		 	

        EmpListVo retEmpVoList = new EmpListVo();
        retEmpVoList.setEmpVo(selectEmpVo);
        retEmpVoList.setDeptVoList(empService.selectListDept(new HashMap()));
        
        return retEmpVoList;
    } 

    /**
     * 従業員情報を更新処理します。
     * @param empVo 従業員情報 EmpVo
     * @return 従業員更新フォーム情報 DeptListVo
     * @throws Exception
     */
    @ElService(key = "DmoEmpUpd")    
    @RequestMapping(value = "DmoEmpUpd")    
    @ElDescription(sub = "従業員更新処理", desc = "従業員情報を更新処理します。")    
    @ElValidator(errUrl = "")
    public DeptListVo updateEmp(EmpVo empVo) throws Exception {  
        DeptListVo deptListVo = new DeptListVo();
        deptListVo.setDeptVoList(empService.selectListDept(new HashMap()));
        
        empService.updateEmp(empVo);
        
        return deptListVo;
    }

    /**
     * 従業員情報を削除処理します。
     * @param empVo 従業員情報 EmpVo
     * @throws Exception
     */
    @ElService(key = "DmoEmpDel")    
    @RequestMapping(value = "DmoEmpDel")
    @ElDescription(sub = "従業員削除処理", desc = "従業員情報を削除処理します。")    
    public void deleteEmp(EmpVo empVo) throws Exception {
        empService.deleteEmp(empVo);
    }

    /**
     * 従業員添付ファイルをダウンロードします。
     * @param empVo 従業員情報 EmpVo
     * @param response 応答情報 HttpServletResponse
     * @throws Exception
     */
    @ElService(key = "DmoEmpDown")    
    @RequestMapping(value = "DmoEmpDown")
    @ElDescription(sub = "従業員添付ファイルのダウンロード", desc = "従業員添付ファイルをダウンロードします。")    
    public void downEmpFile(EmpVo empVo, HttpServletResponse response) throws Exception {
        empVo = empFileService.selectEmpFile(empVo);
        
        byte[] data = empVo.getFileData();  
        String fileName = empVo.getFileName();
        
        fileName = new String(fileName.getBytes("EUC-KR"), "ISO-8859-1");
        
        response.reset();  
        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");  
        response.addHeader("Content-Length", "" + data.length);  
        response.setContentType("application/octet-stream;charset=EUC-KR");
        
        OutputStream outputStream = new BufferedOutputStream(response.getOutputStream());  
        outputStream.write(data);  
        outputStream.flush();  
        outputStream.close();
    }

    /**
     * 従業員添付ファイルをアップロードします。
     * @param request リクエスト情報 HttpServletRequest
     * @param empVo 従業員情報 EmpVo
     * @param model モデル情報 Model
     * @throws Exception
     */
    @ElService(key = "DmoEmpUploadEmpFile")    
    @RequestMapping(value = "DmoEmpUploadEmpFile")
    @ElDescription(sub = "従業員添付ファイルのアップロード", desc = "従業員添付ファイルをアップロードします。")
    public String uploadEmpFileToDb(HttpServletRequest request, EmpVo empVo, Model model) throws Exception {  
        MultipartHttpServletRequest multiPartRequest = (MultipartHttpServletRequest) request;
    	Iterator<String> iter = multiPartRequest.getFileNames();
    	
    	while(iter.hasNext()) {
    		String fileName = iter.next();
    		MultipartFile inputFileData = (MultipartFile) multiPartRequest.getFile(fileName);
    		empVo.setInputFileData(inputFileData);
    		empFileService.uploadEmpFile(empVo);
    	}
    	
    	model.addAttribute("empVo", empVo);
    	
    	return "/cmmn/upload";
    }
    
    /**
     * 従業員の添付ファイルを更新処理する。
     * @param request リクエスト情報 HttpServletRequest
     * @param empVo 従業員情報 EmpVo
     * @param model モデル情報 Model
     * @throws Exception
     */
    @ElService(key = "DmoEmpUpdateUploadEmpFile")    
    @RequestMapping(value = "DmoEmpUpdateUploadEmpFile")
    @ElDescription(sub = "従業員の添付ファイル更新処理", desc = "従業員の添付ファイルを更新処理する。")
    public String updateUploadEmpFile(HttpServletRequest request, EmpVo empVo, Model model) throws Exception {  
    	MultipartHttpServletRequest multiPartRequest = (MultipartHttpServletRequest) request;
    	Iterator<String> iter = multiPartRequest.getFileNames();
    	
    	while(iter.hasNext()) {
    		String fileName = iter.next();
    		MultipartFile inputFileData = (MultipartFile) multiPartRequest.getFile(fileName);
    		empVo.setInputFileData(inputFileData);
    		empService.updateEmp(empVo);
    	}
    	
    	model.addAttribute("empVo", empVo);
    	
    	return "/cmmn/upload";
    }
    
    
    ////////////////////////////////////////////////// TCPサンプル //////////////////////////////////////////////////
    
    /**
     * 従業員情報の詳細照会(TCP内部テスト用)を行う。
     * @param empVo 従業員情報 EmpVo
     * @return 従業員情報 EmpVo
     * @throws Exception
     */
    @ElService(key = "DmoEmpSelect")    
    @RequestMapping(value = "DmoEmpSelect") 
    @ElDescription(sub = "従業員情報の詳細照会(TCP内部テスト用)", desc = "従業員情報の詳細照会(TCP内部テスト用)を行う。")    
    public EmpVo selectEmpView(EmpVo empVo) throws Exception {
    	return empService.selectEmp(empVo);
    } 
    
    /**
     * TCPの送信テストを行う。
     * @param empVo 従業員情報 EmpVo
     * @return 従業員情報 EmpVo
     * @throws Exception
     */
	@ElService(key = "DmoTcpSendTest")    
	@RequestMapping(value = "DmoTcpSendTest") 
	@ElDescription(sub = "TCP送信テスト", desc = "TCPの送信テストを行う。")    
	public EmpVo tcpSendTest(EmpVo empVo) throws Exception {
		// TCPテストサンプル 
		EmpVo eInVo = new EmpVo();
		eInVo.setEmpno(1111);
		EmpVo eOutVo = new EmpVo();
		
		ProworksUserHeader userHeader = new ProworksUserHeader();
		userHeader.setSvcId("DmoEmpSelect");
		userHeader.setTestId("TEST_ID");
		
		ElResDataVO resVo = ProworksTcpLengthBaseSendUtil.sendFld("localhost", 9999, userHeader, eInVo, eOutVo, 10, false, "EUC-KR");
		
		EmpVo resEmpVo = (EmpVo) resVo.getVo();
		ProworksUserHeader resUserHeader =(ProworksUserHeader) resVo.getUserHeader();
		
		AppLog.debug("resTcp EmpVo:" + resEmpVo);
		AppLog.debug("resTcp resUserHeader:" + resUserHeader);
			
		return resEmpVo;
	}    

	
    ////////////////////////////////////////////////// JSPサンプル //////////////////////////////////////////////////
	
    /**
     * 従業員更新フォームのためのJSP照会を行う。
     * @param empVo 従業員情報 EmpVo
     * @return 従業員更新フォーム情報 EmpListVo
     * @throws Exception
     */
    @ElService(key = "DmoEmpUpdViewJsp")    
    @RequestMapping(value = "DmoEmpUpdViewJsp") 
    @ElDescription(sub = "従業員更新フォームのためのJSP照会", desc = "従業員更新フォームのためのJSP照会を行う。")    
    public EmpListVo updateEmpViewJsp(EmpVo empVo) throws Exception {
    	EmpVo selectEmpVo = empService.selectEmp(empVo);    	    
		EmpVo empFileVo = empFileService.selectEmpFile(empVo);
		
		if(empFileVo != null) {
			selectEmpVo.setFileName(empFileVo.getFileName());
		}		 	
		
        EmpListVo retEmpVoList = new EmpListVo();
        retEmpVoList.setEmpVo(selectEmpVo);
        retEmpVoList.setDeptVoList(empService.selectListDept(new HashMap()));
        
        ElHttpUtil.setViewResolverName("emp/empRegister");
        
		return retEmpVoList;
    }
        
}
