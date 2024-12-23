package com.inswave.proworks.emp.vo;

import com.inswave.elfw.annotation.ElDto;
import com.inswave.elfw.annotation.ElDtoField;
import com.fasterxml.jackson.annotation.JsonFilter;

@JsonFilter("elExcludeFilter")
@ElDto(FldYn = "", logicalName = "部署リスト情報")
public class DeptListVo extends com.inswave.proworks.cmmn.ProworksCommVO {
	private static final long serialVersionUID = 1L;
	
    @ElDtoField(logicalName = "部署リスト", physicalName = "deptVoList", type = "", typeKind = "List", fldYn = "", length = 0, dotLen = 0, baseValue = "", desc = "")
    private java.util.List<com.inswave.proworks.emp.vo.DeptVo> deptVoList;


    public java.util.List<com.inswave.proworks.emp.vo.DeptVo> getDeptVoList(){
        return deptVoList;
    }

    public void setDeptVoList(java.util.List<com.inswave.proworks.emp.vo.DeptVo> deptVoList){
        this.deptVoList = deptVoList;
    }

  
    @Override
    public String toString() {
        return "DeptListVo [deptVoList=" + deptVoList + "]";
    }

    public boolean isFixedLengthVo() {
        return false;
    }

}
