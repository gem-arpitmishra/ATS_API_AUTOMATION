package com.qa.ats.stepdefinition;

import com.gemini.generic.reporting.GemTestReporter;
import com.gemini.generic.reporting.STATUS;
import com.qa.ats.utils.Utils;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.sl.In;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;

public class InterviewStep {
    int status = 0;
    public static int interviewId = 0;
    public static int feedbackId = 0;
    Logger logger = LoggerFactory.getLogger(InterviewStep.class);

    @Given("^Set the Interview endpoint (.+) and method (.+)$")
    public void setThePolicyEndpointAndMethod(String url, String method) {
        HashMap<String, String> token = new HashMap<String, String>();
        token.put("X-REMOTE-USER-EMAIL", "tripta.sahni@geminisolutions.com");
        token.put("X-REMOTE-USER-OBJECT-ID", "24431885-d574-445a-b66e-42271b7ad459");
        try {
            if (method.equals("post"))
                status = Utils.apiToSendManagementApprovalEmails(url, method, token, "").getStatus();


            else
                status = Utils.apiWithoutPayloads(url, method, token, "").getStatus();
            GemTestReporter.addTestStep("Hit the " + url, "API was triggered", STATUS.INFO);
        } catch (Exception e) {
            logger.info("API was not hit successfully", e);
            GemTestReporter.addTestStep("Hit the " + url, "API was not successfully triggered", STATUS.FAIL);
        }
    }

    @Then("^Verify Interview status code (.+)$")
    public void verifyPolicyStatusCodeExpectedStatus(Integer Expected) {
        Utils.verifyStatusCode(Expected, status);
    }

    @Given("^Set the Interview endpoint (.+) , method (.+) and payload (.+)$")
    public void setTheEndpointMethodAndPayload(String url, String method, String payload) {
        HashMap<String, String> token = new HashMap<String, String>();
        token.put("X-REMOTE-USER-EMAIL", "tripta.sahni@geminisolutions.com");
        token.put("X-REMOTE-USER-OBJECT-ID", "24431885-d574-445a-b66e-42271b7ad459");
        try {
            String check = Utils.interviewApiWithPayloads(url, method, payload, token, "");
            if (method.equals("post")) {

                String checkList[] = check.split(",");
                status = Integer.parseInt(checkList[0]);
                String str = checkList[1].split(":")[1];
                interviewId = Integer.parseInt((str).substring(0, str.length() - 1));
            } else {
                status = Integer.parseInt(check);
            }

            GemTestReporter.addTestStep("Hit the " + url, "API was triggered", STATUS.INFO);
        } catch (Exception e) {
            logger.info("API was not hit successfully", e);
            GemTestReporter.addTestStep("Hit the " + url, "API was not successfully triggered", STATUS.FAIL);
        }
    }

    @Given("^Set the Feedback endpoint (.+) , method (.+) and payload (.+)$")
    public void setTheFeedbackEndpointMethodAndPayload(String url, String method, String payload) {
        HashMap<String, String> token = new HashMap<String, String>();
        token.put("X-REMOTE-USER-EMAIL", "tripta.sahni@geminisolutions.com");
        token.put("X-REMOTE-USER-OBJECT-ID", "24431885-d574-445a-b66e-42271b7ad459");
        try {
            String check = Utils.feedbackApiWithPayloads(url, method, payload, token, "");
            if (method.equals("post")) {
                String checkList[] = check.split(",");
                status = Integer.parseInt(checkList[0]);
                feedbackId = Integer.parseInt(checkList[1]);
            } else {
                status = Integer.parseInt(check);
            }
            GemTestReporter.addTestStep("Hit the " + url, "API was triggered", STATUS.INFO);
        } catch (Exception e) {
            logger.info("API was not hit successfully", e);
            GemTestReporter.addTestStep("Hit the " + url, "API was not successfully triggered", STATUS.FAIL);
        }
    }

    @Given("^Set the Interview endpoint (.+) , wrong objectId (.+) and  method (.+)$")
    public void setEndpointMethodAndWrongHeader(String url, String method, String header) {
        HashMap<String, String> token = new HashMap<String, String>();
        token.put("X-REMOTE-USER-EMAIL", "tripta.sahni@geminisolutions.com");
        token.put("X-REMOTE-USER-OBJECT-ID", header);
        try {
            status = Utils.apiWithoutPayloads(url, method, token, "").getStatus();

            GemTestReporter.addTestStep("Hit the " + url, "API was triggered", STATUS.INFO);
        } catch (Exception e) {
            logger.info("API was not hit successfully", e);
            GemTestReporter.addTestStep("Hit the " + url, "API was not successfully triggered", STATUS.FAIL);
        }
    }


}