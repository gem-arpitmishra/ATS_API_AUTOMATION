package com.qa.ats.stepdefinition;

import com.gemini.generic.reporting.GemTestReporter;
import com.gemini.generic.reporting.STATUS;
import com.qa.ats.utils.Utils;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import java.util.HashMap;

public class ApplicantStep {
    int status = 0;
    Logger logger = LoggerFactory.getLogger(ApplicantStep.class);

    //setting the endpoint and method for API
    @Given("^Set the Applicant endpoint (\\w*) and method (\\w*)$")
    public void setThePolicyEndpointAndMethod(String url, String method) {
        HashMap<String, String> token = new HashMap<String, String>();
        token.put("X-REMOTE-USER-EMAIL", "saru.goyal@geminisolutions.com");
        try {
            status = Utils.apiWithoutPayloads(url, method, token, "").getStatus();

        } catch (Exception exception) {
            logger.info("Error - User not able to hit the API", exception);
            GemTestReporter.addTestStep("Hit API", "User not able to hit the API", STATUS.FAIL);
        }
    }

    //Verify the status
    @Then("^Verify Applicant status code (\\d+)$")
    public void verifyPolicyStatusCodeExpectedStatus(Integer Expected) {
        try {
            Utils.verifyStatusCode(Expected, status);
        } catch (Exception exception) {
            logger.info("User not able verify thr API status", exception);
            GemTestReporter.addTestStep("Status Check", "User not able verify thr API status", STATUS.FAIL);
        }
    }

    @Given("^Set the Applicant endpoint (\\w*) and method (\\w*) with header and stage (\\w*)$")
    public void setTheApplicantEndpointEndpointAndMethodMethodWithHeader(String url,String method,String stage) {
        HashMap<String, String> header = new HashMap<String, String>();
        header.put("X-REMOTE-USER-EMAIL", "saru.goyal@geminisolutions.com");
        try {
            if (method.equals("put")||method.equals("post"))
                status = Utils.apiForUpdatingApplicantStage(url, method, header, stage,"").getStatus();
            else
                status = Utils.apiWithoutPayloads(url, method, header, "").getStatus();

        } catch (Exception exception) {
            logger.info("Error - User not able to hit the API", exception);
            GemTestReporter.addTestStep("Hit API", "User not able to hit the API", STATUS.FAIL);
        }
    }


}
