package com.novacroft.nemo.tfl.common.converter.journey_history;

import com.novacroft.nemo.tfl.common.transfer.oyster_journey_history.InsertSyntheticTapResponseDTO;
import com.novacroft.tfl.web_service.model.oyster_journey_history.InsertSyntheticOysterTapResponse;

public interface InsertSyntheticTapResponseConverter {

    InsertSyntheticTapResponseDTO convertModelToDto(InsertSyntheticOysterTapResponse response);
}
