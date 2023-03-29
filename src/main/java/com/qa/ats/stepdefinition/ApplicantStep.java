package com.qa.ats.stepdefinition;

import com.qa.ats.utils.Utils;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;

import java.util.HashMap;

public class ApplicantStep {
    int status = 0;

    @Given("Set the Applicant endpoint {string} and method {string}")
    public void setThePolicyEndpointAndMethod(String url, String method) {
        HashMap<String, String> token = new HashMap<String, String>();
        //token.put("X-REMOTE-USER-EMAIL", "saru.goyal@geminisolutions.com");
        try {
            status = Utils.APIwithoutPayloads(url, method, token, "").getStatus();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Then("Verify Applicant status code {int}")
    public void verifyPolicyStatusCodeExpectedStatus(Integer Expected) {
        Utils.VerifyStatusCode(Expected, status);
    }

}
