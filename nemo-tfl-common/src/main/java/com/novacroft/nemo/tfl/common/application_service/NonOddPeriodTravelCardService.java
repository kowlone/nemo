package com.novacroft.nemo.tfl.common.application_service;

import com.novacroft.nemo.tfl.common.command.impl.CartItemCmdImpl;
import com.novacroft.nemo.tfl.common.transfer.ProductItemDTO;


/**
 * Specification for new travel card service
 */
public interface NonOddPeriodTravelCardService {
    
    ProductItemDTO convertCartItemCmdImplToProductItemDTO(CartItemCmdImpl cmd);
}
