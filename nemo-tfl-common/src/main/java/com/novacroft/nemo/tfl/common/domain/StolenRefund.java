package com.novacroft.nemo.tfl.common.domain;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

/**
 * TfL lost stolen refund cart domain definition
 */
@Entity
@DiscriminatorValue("StolenRefund")
public class StolenRefund extends Cart {
    private static final long serialVersionUID = -6646945007451058314L;
}
