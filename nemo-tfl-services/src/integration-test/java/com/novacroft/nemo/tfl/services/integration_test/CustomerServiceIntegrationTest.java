package com.novacroft.nemo.tfl.services.integration_test;

import org.junit.runner.RunWith;

import com.novacroft.nemo.tfl.services.integration_test.util.IntegrationTestConstants;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;

@RunWith(Cucumber.class)
@CucumberOptions(features = {"classpath:com/novacroft/nemo/tfl/services/integration_test/CustomerService.feature"}, glue = {
                IntegrationTestConstants.CUCUMBER_API_SPRING, IntegrationTestConstants.STEP_DEFINITION_PACKAGE}, format = {
                IntegrationTestConstants.CUCUMBER_FORMAT_PRETTY})
public class CustomerServiceIntegrationTest {
}
