package com.qa.ats.stepdefinition;

import com.gemini.generic.reporting.GemTestReporter;
import com.gemini.generic.reporting.STATUS;
import com.qa.ats.utils.Utils;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

public class AtsHealthCheck {
    int status = 0;
    public static int jobId = 0;
    public static int applicantId = 0;
    Logger logger = LoggerFactory.getLogger(ApplicantStep.class);

    @Given("^Set the url to generate access token (.+) method and url (.+)$")
    public void getAccessToken(String method, String url) throws IOException {
        try {
            status=Utils.accessToken(method, url);
        }
        catch(Exception exception)
        {
            logger.info("User not able to fetch the access token", exception);
            GemTestReporter.addTestStep("Token", "Token couldn't be fetched", STATUS.FAIL);
        }
    }

    @Given("^Set the Job endpoint (\\w*) method (\\w*) payload (.*) (.*) and form data$")
    public void setTheJobEndpointEndpointMethodMethodPayloadPayloadKeyPayloadValueAndFormData(String url,
                                                                                              String method, String keys, String values) {
        List<String> payloadKeys = Arrays.asList(keys.split(","));
        List<String> payloadValues = Arrays.asList(values.split(","));
        HashMap<String, String> token = new HashMap<String, String>();
        token.put("X-REMOTE-USER-EMAIL", "saru.goyal@geminisolutions.com");
        String checkList[];
        try {
            String check = Utils.jobApiWithFormData(url, method, token, "", payloadKeys, payloadValues);
            if (method.equals("post") && check.contains(",")) {
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
    public void setTheApplicantEndpointEndpointMethodMethodPayloadPayloadKeyPayloadValueAndFormData(String url, String method, String keys, String values) {
        List<String> payloadKeys = Arrays.asList(keys.split(","));
        List<String> payloadValues = Arrays.asList(values.split(","));
        HashMap<String, String> token = new HashMap<String, String>();
        token.put("X-REMOTE-USER-EMAIL", "saru.goyal@geminisolutions.com");
        String checkList[];
        try {
            String check = Utils.applicantApiWithFormData(url, method, token, "", payloadKeys, payloadValues);
            if (method.equals("post") && check.contains(",")) {
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
    @Given("^Setting the Resume Parser endpoint (\\w*) method (\\w*) payload (.*) (.*) and form data$")
    public void setTheResumeParserEndpointEndpointMethodMethodPayloadPayloadKeyPayloadValueAndFormData(String url, String method, String keys, String values) {
        List<String> payloadKeys = Arrays.asList(keys.split(","));
        List<String> payloadValues = Arrays.asList(values.split(","));
        HashMap<String, String> token = new HashMap<String, String>();
        token.put("X-REMOTE-USER-EMAIL", "saru.goyal@geminisolutions.com");
        String checkList[];
        try {
            String check = Utils.applicantApiWithFormData(url, method, token, "", payloadKeys, payloadValues);
            if (method.equals("post") && check.contains(",")) {
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

    @Given("^Setting the Applicant endpoint (.+) method (.+) payload (.+) for vetting using wrong header (.+)$")
    public void settingWrongHeaderForVeeting(String url, String method, String payload, String header) {
        HashMap<String, String> token = new HashMap<String, String>();
        if (header.equals("ObjectID")) {
            token.put("X-REMOTE-USER-EMAIL", "nipun.jain@geminisolutions.com");
            token.put("X-REMOTE-USER-OBJECT-ID", "hsgdhg");
        } else {
            token.put("X-REMOTE-USER-EMAIL", "nhjk");
            token.put("X-REMOTE-USER-OBJECT-ID", "e82f1905-3695-49a6-977e-9712d7f1ece1");
        }
        String[] checkList;
        try {
            String check = Utils.applicantApiForVetting(url, method, payload, token, "");
            if (method.equals("post") && check.contains(",")) {
                checkList = check.split(",");
                status = Integer.parseInt(checkList[0]);
            }
        } catch (Exception e) {
            logger.info("API was not hit successfully", e);
            GemTestReporter.addTestStep("Hit the " + url, "API was not successfully triggered", STATUS.FAIL);
        }

    }

    @Given("^Setting the Applicant endpoint (.+) method (.+) payload (.+) for vetting$")
    public void settingTheApplicantEndpointEndpointMethodMethodForVetting(String url, String method, String payload) {
        HashMap<String, String> token = new HashMap<String, String>();
        token.put("X-REMOTE-USER-EMAIL", "nipun.jain@geminisolutions.com");
        token.put("X-REMOTE-USER-OBJECT-ID", "e82f1905-3695-49a6-977e-9712d7f1ece1");
        token.put("X-REMOTE-INTERVIEWER-EMAIL","nipun.jain@geminisolutions.com");

        String[] checkList;
        try {
            String check = Utils.applicantApiForVetting(url, method, payload, token, "");
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

