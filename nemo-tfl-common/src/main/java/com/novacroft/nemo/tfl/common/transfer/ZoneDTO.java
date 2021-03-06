package com.novacroft.nemo.tfl.common.transfer;

import java.util.Date;

import com.novacroft.nemo.common.transfer.PeriodicAbstractBaseDTO;

public class ZoneDTO extends PeriodicAbstractBaseDTO {
	
	private static final long serialVersionUID = 6703340500610639556L;
    protected String code;
    protected String name;

    public ZoneDTO() {

    }

    public ZoneDTO(Long id, String code, String name, Date effectiveFrom, Date effectiveTo, String cubicReference) {
        this.id = id;
        this.code = code;
        this.name = name;
        this.effectiveFrom = effectiveFrom;
        this.effectiveTo = effectiveTo;
        this.cubicReference = cubicReference;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
