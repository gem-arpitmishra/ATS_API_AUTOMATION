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
    public static int interviewId = 0;
    public static int feedbackId = 0;
    Logger logger = LoggerFactory.getLogger(InterviewStep.class);

    public static boolean check1 = false;

    @Given("^Setting the Interview endpoint (.+) and method (.+) , for getting applicants in Vetting$")
    public void getApplicantsInVetting(String url, String method) {
        HashMap<String, String> token = new HashMap<String, String>();
        token.put("X-REMOTE-USER-EMAIL", "tripta.sahni@geminisolutions.com");
        try {

            if (method.equals("post"))

                status = Utils.apiToSendManagementApprovalEmails(url, method, token, "").getStatus();
            else
                status =Integer.parseInt(Utils.apiWithoutPayloads(url, method, token, ""));
            GemTestReporter.addTestStep("Hit the " + url, "API was triggered", STATUS.INFO);
        } catch (Exception e) {
            logger.info("API was not hit successfully", e);
            GemTestReporter.addTestStep("Hit the " + url, "API was not successfully triggered", STATUS.FAIL);
        }
    }

    @Given("^Set the Interview endpoint (.+) and method (.+)$")
    public void setThePolicyEndpointAndMethod(String url, String method) {
        HashMap<String, String> token = new HashMap<String, String>();
        token.put("X-REMOTE-USER-EMAIL", "tripta.sahni@geminisolutions.com");
        token.put("X-REMOTE-USER-OBJECT-ID", "24431885-d574-445a-b66e-42271b7ad459");
        try {
            if (method.equals("post"))
                status = Utils.apiToSendManagementApprovalEmails(url, method, token, "").getStatus();
            else
                status = Integer.parseInt(Utils.apiWithoutPayloads(url, method, token, ""));
            GemTestReporter.addTestStep("Hit the " + url, "API was triggered", STATUS.INFO);
        } catch (Exception e) {
            logger.info("API was not hit successfully", e);
            GemTestReporter.addTestStep("Hit the " + url, "API was not successfully triggered", STATUS.FAIL);
        }
    }

    @Given("^Set the Interview endpoint (.+) , method (.+) without header (.+)$")
    public void setTheMethodWithoutHeader(String url, String method, String header) {
        HashMap<String, String> token = new HashMap<String, String>();
        if (header.equals("ObjectID"))
            token.put("X-REMOTE-USER-EMAIL", "tripta.sahni@geminisolutions.com");
        else if (header.equals("Email"))
            token.put("X-REMOTE-USER-OBJECT-ID", "24431885-d574-445a-b66e-42271b7ad459");
        try {
            if (method.equals("post"))
                status = Utils.apiToSendManagementApprovalEmails(url, method, token, "").getStatus();
            else
                status = Integer.parseInt(Utils.apiWithoutPayloads(url, method, token, ""));
            GemTestReporter.addTestStep("Hit the " + url, "API was triggered", STATUS.INFO);
        } catch (Exception e) {
            logger.info("API was not hit successfully", e);
            GemTestReporter.addTestStep("Hit the " + url, "API was not successfully triggered", STATUS.FAIL);
        }
    }

    @Given("^Set the Interview endpoint (.+) , method (.+) with wrong (.+) header$")
    public void setInterviewEndpointWithoutPayloadAndWrongHeader(String url, String method, String header) {
        HashMap<String, String> token = new HashMap<String, String>();
        if (header.equals("ObjectID")) {
            token.put("X-REMOTE-USER-EMAIL", "tripta.sahni@geminisolutions.com");
            token.put("X-REMOTE-USER-OBJECT-ID", "demo");
        } else if (header.equals("Email")) {
            token.put("X-REMOTE-USER-OBJECT-ID", "24431885-d574-445a-b66e-42271b7ad459");
            token.put("X-REMOTE-USER-EMAIL", "demo");
        } else if (header.equals("Email")) {
            token.put("X-REMOTE-USER-OBJECT-ID", "24431885-d574-445a-b66e-42271b7ad459");
            token.put("X-REMOTE-USER-EMAIL", "demo");
        }
        try {
            if (method.equals("post"))
                status = Utils.apiToSendManagementApprovalEmails(url, method, token, "").getStatus();
            else
                status = Integer.parseInt(Utils.apiWithoutPayloads(url, method, token, ""));
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

    @Given("^Set the Interview endpoint (.+) , method (.+) , payload (.+) without using header (.+)$")
    public void setTheInterviewEndpointWithoutUsingHeader(String url, String method, String payload, String header) {
        HashMap<String, String> token = new HashMap<String, String>();
        token.put("X-REMOTE-USER-EMAIL", "tripta.sahni@geminisolutions.com");

        try {
            String check = Utils.interviewApiWithPayloads(url, method, payload, token, "");
            if (method.equals("post") && check.contains(",")) {

                String[] checkList = check.split(",");
                status = Integer.parseInt(checkList[0]);
                String str = checkList[1].split(":")[1];
                interviewId = Integer.parseInt((str).substring(0, str.length() - 1).trim());
            } else {
                status = Integer.parseInt(check);
            }
            GemTestReporter.addTestStep("Hit the " + url, "API was triggered", STATUS.INFO);
        } catch (Exception e) {
            logger.info("API was not hit successfully", e);
            GemTestReporter.addTestStep("Hit the " + url, "API was not successfully triggered", STATUS.FAIL);
        }
    }
    @Given("^Setting the Interview endpoint (.+) , method (.+) and payload (.+) for notification Read$")
    public void readNotifications(String url, String method, String payload)
    {
        HashMap<String, String> token = new HashMap<String, String>();
        token.put("X-REMOTE-USER-EMAIL", "tripta.sahni@geminisolutions.com");
        try {
            String check = Utils.applicantApiForVetting(url, method, payload, token, "");
            status = Integer.parseInt(check);
        } catch (Exception e) {
            logger.info("API was not hit successfully", e);
            GemTestReporter.addTestStep("Hit the " + url, "API was not successfully triggered", STATUS.FAIL);

        }
    }


    @Given("^Set the Interview endpoint (.+) , method (.+) and payload (.+)$")
    public void setTheEndpointMethodAndPayload(String url, String method, String payload) {
        HashMap<String, String> token = new HashMap<String, String>();
        token.put("X-REMOTE-USER-EMAIL", "tripta.sahni@geminisolutions.com");
        token.put("X-REMOTE-USER-OBJECT-ID", "24431885-d574-445a-b66e-42271b7ad459");
        try {
            String check = Utils.interviewApiWithPayloads(url, method, payload, token, "");
            if (method.equals("post") && check.contains(",")) {

                String checkList[] = check.split(",");
                status = Integer.parseInt(checkList[0]);
                String str = checkList[1].split(":")[1];
                interviewId = Integer.parseInt((str).substring(0, str.length() - 1).trim());
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
            if (method.equals("post") && check.contains(",")) {
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

    @Given("^Set the Interview endpoint (.+) , method (.+) , payload (.+)  using wrong header (.+)$")
    public void setTheInterviewEndpointAddNewInterviewMethodPostPayloadInterview1UsingWrongHeaderObjectId(String url, String method, String payload, String header) {
        HashMap<String, String> token = new HashMap<String, String>();
        if (header.equals("ObjectID")) {
            token.put("X-REMOTE-USER-EMAIL", "tripta.sahni@geminisolutions.com");
            token.put("X-REMOTE-USER-OBJECT-ID", "demo");
        } else {
            token.put("X-REMOTE-USER-EMAIL", "demo");
            token.put("X-REMOTE-USER-OBJECT-ID", "24431885-d574-445a-b66e-42271b7ad459");
        }
        try {
            String check = Utils.interviewApiWithPayloads(url, method, payload, token, "");
            if (method.equals("post") && check.contains(",")) {

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

    @Given("^Set the Interview endpoint (.+) method (.+) payload (.+) for getting vetter names$")
    public void setTheInterviewEndpointEndpointMethodMethodPayloadPayloadForGettingVetterNames(String url, String method, String payload) {
        HashMap<String, String> token = new HashMap<String, String>();
        token.put("X-REMOTE-USER-EMAIL", "tripta.sahni@geminisolutions.com");
        token.put("X-REMOTE-USER-OBJECT-ID", "24431885-d574-445a-b66e-42271b7ad459");
        String checkList[];
        try {
            String check = Utils.getVetterNames(url, method, payload, token, "");
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

    @Given("^Set the Interview endpoint (.+) method (.+) payload (.+) for getting vetter names using wrong payload$")
    public void setTheInterviewEndpointEndpointMethodForWrongVetterPayload(String url, String method, String payload) {
        HashMap<String, String> token = new HashMap<String, String>();
        token.put("X-REMOTE-USER-EMAIL", "tripta.sahni@geminisolutions.com");
        token.put("X-REMOTE-USER-OBJECT-ID", "24431885-d574-445a-b66e-42271b7ad459");
        String checkList[];
        try {
            String check = Utils.getVetterNamesForWrongPayload(url, method, payload, token, "");
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