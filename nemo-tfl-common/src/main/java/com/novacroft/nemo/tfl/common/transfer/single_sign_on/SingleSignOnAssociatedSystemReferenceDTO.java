package com.novacroft.nemo.tfl.common.transfer.single_sign_on;

public class SingleSignOnAssociatedSystemReferenceDTO {

    private String refSysCustomerId;
    private String refSysUserName;
    private SingleSignOnSystemNameDTO systemName;
    
    public String getRefSysCustomerId() {
        return refSysCustomerId;
    }
    
    public void setRefSysCustomerId(String refSysCustomerId) {
        this.refSysCustomerId = refSysCustomerId;
    }

    public String getRefSysUserName() {
        return refSysUserName;
    }

    public void setRefSysUserName(String refSysUserName) {
        this.refSysUserName = refSysUserName;
    }

    public SingleSignOnSystemNameDTO getSystemName() {
        return systemName;
    }

    public void setSystemName(SingleSignOnSystemNameDTO systemName) {
        this.systemName = systemName;
    }

}
