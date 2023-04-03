package com.qa.ats.stepdefinition;

import com.gemini.generic.reporting.GemTestReporter;
import com.gemini.generic.reporting.STATUS;
import com.qa.ats.utils.Utils;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;

public class InterviewStep {
    int status = 0;
Logger logger = LoggerFactory.getLogger(InterviewStep.class);
    @Given("^Set the Interview endpoint (.+) and method (.+)$")
    public void setThePolicyEndpointAndMethod(String url, String method) {
        HashMap<String, String> token = new HashMap<String, String>();
        token.put("X-REMOTE-USER-EMAIL", "tripta.sahni@geminisolutions.com");
        token.put("X-REMOTE-USER-OBJECT-ID","24431885-d574-445a-b66e-42271b7ad459");
        try {
            status = Utils.APIwithoutPayloads(url, method, token, "").getStatus();
            GemTestReporter.addTestStep("Hit the "+url,"API was successfully triggered", STATUS.PASS);
        } catch (Exception e) {
            logger.info("API was not hit successfully",e);
            GemTestReporter.addTestStep("Hit the "+url,"API was not successfully triggered", STATUS.FAIL);
        }
    }

    @Then("^Verify Interview status code (.+)$")
    public void verifyPolicyStatusCodeExpectedStatus(Integer Expected)
    {
        Utils.VerifyStatusCode(Expected, status);
    }

    @Given("^Set the Interview endpoint (.+) , method (.+) and payload (.+)$")
    public void setTheEndpointMethodAndPayload(String url , String method , String payload)
    {
        HashMap<String, String> token = new HashMap<String, String>();
        token.put("X-REMOTE-USER-EMAIL", "tripta.sahni@geminisolutions.com");
        token.put("X-REMOTE-USER-OBJECT-ID","24431885-d574-445a-b66e-42271b7ad459");
        try {
            status = Utils.APIwithPayloads(url, method, payload,token , "").getStatus();
            GemTestReporter.addTestStep("Hit the "+url,"API was successfully triggered", STATUS.PASS);
        } catch (Exception e) {
            logger.info("API was not hit successfully",e);
            GemTestReporter.addTestStep("Hit the "+url,"API was not successfully triggered", STATUS.FAIL);
        }
    }

}