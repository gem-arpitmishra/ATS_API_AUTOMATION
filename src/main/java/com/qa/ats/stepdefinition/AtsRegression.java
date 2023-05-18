package com.qa.ats.stepdefinition;

import com.gemini.generic.reporting.GemTestReporter;
import com.gemini.generic.reporting.STATUS;
import com.gemini.generic.utils.ProjectConfigData;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.qa.ats.utils.GlobalVariable;
import com.qa.ats.utils.Utils;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.client.methods.RequestBuilder;
import org.apache.http.entity.mime.HttpMultipartMode;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicHeader;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AtsRegression {
    int status = 0;
    public static int jobId = 0;
    public static int applicantId = 0;
    Logger logger = LoggerFactory.getLogger(ApplicantStep.class);

    @Given("^Set the Applicant endpoint (.+) method (.+) payload (.+) (.+) and form data using wrong header$")
    public void setTheApplicantEndpointEndpointMethodMethodPayloadPayloadKeyPayloadValueAndFormData(String url,
                                                                                                    String method, String keys, String values) {
        List<String> payload_keys = Arrays.asList(keys.split(","));
        List<String> payload_values = Arrays.asList(values.split(","));
        HashMap<String, String> token = new HashMap<String, String>();
        token.put("X-REMOTE-USER", "saru.goyal@geminisolutions.com");
        String[] checkList;
        try {
            String check = Utils.applicantApiWithFormDataWrongHeader(url, method, token, "", payload_keys, payload_values);
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
