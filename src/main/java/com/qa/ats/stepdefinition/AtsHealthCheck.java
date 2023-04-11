package com.qa.ats.stepdefinition;

import com.gemini.generic.reporting.GemTestReporter;
import com.gemini.generic.reporting.STATUS;
import com.qa.ats.utils.Utils;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

public class AtsHealthCheck {
    int status = 0;
    public static int jobId = 0;
    public static int applicantId = 0;
    Logger logger = LoggerFactory.getLogger(ApplicantStep.class);

    @Given("^Set the Job endpoint (\\w*) method (\\w*) payload (.*) (.*) and form data$")
    public void setTheJobEndpointEndpointMethodMethodPayloadPayloadKeyPayloadValueAndFormData(String url,
                                                                                              String method, String keys, String values) {
        List<String> payload_keys = Arrays.asList(keys.split(","));
        List<String> payload_values = Arrays.asList(values.split(","));
        HashMap<String, String> token = new HashMap<String, String>();
        token.put("X-REMOTE-USER-EMAIL", "saru.goyal@geminisolutions.com");
        String checkList[];
        try {
            String check = Utils.jobApiWithFormData(url, method, token, "", payload_keys, payload_values);
            if (method.equals("post")) {
                checkList = check.split(",");
                status = Integer.parseInt(checkList[0]);
                jobId = Integer.parseInt(checkList[1]);

            } else {
                status = Integer.parseInt(check);

            }
        } catch (Exception exception) {
            logger.info("User not able set the form data", exception);
            GemTestReporter.addTestStep("Form-data", "User not able verify the form-data", STATUS.FAIL);
        }
    }

    @Then("^Verify scenario status code (.+)$")
    public void verifyScenarioStatusCodeExpectedStatus(int Expected) {
        try {
            Utils.verifyStatusCode(Expected, status);


        } catch (Exception exception) {
            logger.info("User not able verify thr API status", exception);
            GemTestReporter.addTestStep("Status Check", "User not able verify thr API status", STATUS.FAIL);
        }
    }

    @Given("^Set the Applicant endpoint (\\w*) method (\\w*) payload (.*) (.*) and form data$")
    public void setTheApplicantEndpointEndpointMethodMethodPayloadPayloadKeyPayloadValueAndFormData(String url,
                                                                                                    String method, String keys, String values) {
        List<String> payload_keys = Arrays.asList(keys.split(","));
        List<String> payload_values = Arrays.asList(values.split(","));
        HashMap<String, String> token = new HashMap<String, String>();
        token.put("X-REMOTE-USER-EMAIL", "saru.goyal@geminisolutions.com");
        String checkList[];
        try {
            String check = Utils.applicantApiWithFormData(url, method, token, "", payload_keys, payload_values);
            if (method.equals("post")) {
                checkList = check.split(",");
                status = Integer.parseInt(checkList[0]);
                applicantId = Integer.parseInt(checkList[1]);

            } else {
                status = Integer.parseInt(check);

            }
        } catch (Exception exception) {
            logger.info("User not able set the form data", exception);
            GemTestReporter.addTestStep("Form-data", "User not able verify the form-data", STATUS.FAIL);
        }
    }
}
