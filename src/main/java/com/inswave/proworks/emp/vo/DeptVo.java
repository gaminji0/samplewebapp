package com.inswave.proworks.emp.vo;

import com.inswave.elfw.annotation.ElDto;
import com.inswave.elfw.annotation.ElDtoField;
import com.fasterxml.jackson.annotation.JsonFilter;

@JsonFilter("elExcludeFilter")
@ElDto(FldYn = "", logicalName = "部門情報")
public class DeptVo extends com.inswave.proworks.cmmn.ProworksCommVO {
	private static final long serialVersionUID = 1L;
	
	@ElDtoField(logicalName = "部門番号", physicalName = "deptno", type = "String", typeKind = "", fldYn = "", length = 0, dotLen = 0, baseValue = "", desc = "")
	private String deptno;
	
	@ElDtoField(logicalName = "部門名", physicalName = "dname", type = "String", typeKind = "", fldYn = "", length = 0, dotLen = 0, baseValue = "", desc = "")
	private String dname;
	
	@ElDtoField(logicalName = "地域", physicalName = "loc", type = "String", typeKind = "", fldYn = "", length = 0, dotLen = 0, baseValue = "", desc = "")
	private String loc;


    public String getDeptno(){
        return deptno;
    }

    public void setDeptno(String deptno){
        this.deptno = deptno;
    }

    public String getDname(){
        return dname;
    }

    public void setDname(String dname){
        this.dname = dname;
    }

    public String getLoc(){
        return loc;
    }

    public void setLoc(String loc){
        this.loc = loc;
    }


    @Override
    public String toString() {
        return "DeptVo [deptno=" + deptno + ",dname=" + dname + ",loc=" + loc + "]";
    }

    public boolean isFixedLengthVo() {
        return false;
    }

}
