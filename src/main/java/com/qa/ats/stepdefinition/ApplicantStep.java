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

public class ApplicantStep {
    int status = 0;
    Logger logger = LoggerFactory.getLogger(ApplicantStep.class);
    public static String uuid = "";

    @Given("^Set the Applicant endpoint (\\w*) and method (\\w*)$")
    public void setThePolicyEndpointAndMethod(String url, String method) {
        HashMap<String, String> token = new HashMap<String, String>();
        token.put("X-REMOTE-USER-EMAIL", "tripta.sahni@geminisolutions.com");
        try {
            if (url.equals("fetchApplicantWithId")) {
                String respCheck[] = Utils.apiWithoutPayloads(url, method, token, "").split(",");
                status = Integer.parseInt(respCheck[0]);
                uuid=respCheck[1].substring(1,respCheck[1].length()-1);
            }
            else
            status = Integer.parseInt(Utils.apiWithoutPayloads(url, method, token, ""));

        } catch (Exception exception) {
            logger.info("Error - User not able to hit the API", exception);
            GemTestReporter.addTestStep("Hit API", "User not able to hit the API", STATUS.FAIL);
        }
    }

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
    public void setTheApplicantEndpointEndpointAndMethodMethodWithHeader(String url, String method, String stage) {
        HashMap<String, String> header = new HashMap<String, String>();
        header.put("X-REMOTE-USER-EMAIL", "tripta.sahni@geminisolutions.com");
        try {

            if (method.equals("put") || method.equals("post"))
                status = Utils.apiForUpdatingApplicantStage(url, method, header, stage, "").getStatus();

            else
                status = Integer.parseInt(Utils.apiWithoutPayloads(url, method, header, ""));


        } catch (Exception exception) {
            logger.info("Error - User not able to hit the API", exception);
            GemTestReporter.addTestStep("Hit API", "User not able to hit the API", STATUS.FAIL);
        }
    }

    @Given("^Set the Applicant endpoint (.+) and method (.+) and keys (.+) , values (.+) to add multiple applicants$")
    public void setTheApplicantEndpointEndpointAndMethodMethodToAddMultipleApplicants(String url, String method, String keys, String values) {
        List<String> payload_keys = Arrays.asList(keys.split(","));
        List<String> payload_values = Arrays.asList(values.split(","));
        HashMap<String, String> token = new HashMap<String, String>();
        token.put("X-REMOTE-USER-EMAIL", "tripta.sahni@geminisolutions.com");
        String checkList[];
        try {
            String check = Utils.addMultipleApplicants(url, method, token, payload_keys, payload_values);
            if (method.equals("post") && check.contains(",")) {
                checkList = check.split(",");
                status = Integer.parseInt(checkList[0]);
            } else
                status = Integer.parseInt(check);

        } catch (Exception e) {
            logger.info("API was not hit successfully", e);
            GemTestReporter.addTestStep("Hit the " + url, "API was not successfully triggered", STATUS.FAIL);

        }
    }


    @Given("^Set the Applicant endpoint (.+) and method (.+) and keys (.+) , values (.+) to add multiple applicants without (.+)$")
    public void setTheApplicantEndpointEndpointAndMethodMethodToAddMultipleApplicantsForWrongPayload(String url, String method, String keys, String values, String name) {
        List<String> payload_keys = Arrays.asList(keys.split(","));
        List<String> payload_values = Arrays.asList(values.split(","));
        HashMap<String, String> token = new HashMap<String, String>();
        token.put("X-REMOTE-USER-EMAIL", "tripta.sahni@geminisolutions.com");
        String checkList[];
        try {
            String check = Utils.addMultipleApplicantsWithWrongPayload(url, method, token, payload_keys, payload_values, name);
            if (method.equals("post") && check.contains(",")) {
                checkList = check.split(",");
                status = Integer.parseInt(checkList[0]);
            } else
                status = Integer.parseInt(check);

        } catch (Exception e) {
            logger.info("API was not hit successfully", e);
            GemTestReporter.addTestStep("Hit the " + url, "API was not successfully triggered", STATUS.FAIL);

        }
    }

}

