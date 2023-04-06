package com.qa.ats.utils;


import com.gemini.generic.api.utils.*;
import com.gemini.generic.reporting.GemTestReporter;
import com.gemini.generic.reporting.STATUS;
import com.gemini.generic.utils.ProjectConfigData;

import com.google.gson.*;
import com.qa.ats.stepdefinition.ApplicantStep;
import com.qa.ats.stepdefinition.InterviewStep;
import com.qa.ats.stepdefinition.AtsHealthCheck;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import java.io.*;
import java.util.List;
import java.util.Map;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
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


import com.gemini.generic.api.utils.ProjectSampleJson;

public class Utils {
    static Logger logger = LoggerFactory.getLogger(ApplicantStep.class);


    public static void responseCheck(Response response) {
        if ((response.getResponseBody()) != null) {
            GemTestReporter.addTestStep("Response Body", response.getResponseBody(), STATUS.INFO);
        } else {
            GemTestReporter.addTestStep("Response Body", "No-Response", STATUS.INFO);
        }
    }


    public static Response apiWithoutPayloads(String UrlNameFromConfig, String method, Map<String, String> headers, String step) throws Exception {
        Response response = new Response();
        try {
            Request request = new Request();
            String url = ProjectConfigData.getProperty(UrlNameFromConfig);
            if (url.contains("{jobId}"))
                url = GlobalVariable.BASE_URL + url.replace("{jobId}", String.valueOf(AtsHealthCheck.jobId));
            else if (url.contains("{applicantId}"))
                url = GlobalVariable.BASE_URL + url.replace("{applicantId}", String.valueOf(AtsHealthCheck.applicantId));
            else if (url.contains("{interviewId}"))
                url = GlobalVariable.BASE_URL + url.replace("{interviewId}", String.valueOf(InterviewStep.interviewId));
            else
                url = GlobalVariable.BASE_URL + url;
            GemTestReporter.addTestStep("Url for " + method.toUpperCase() + " Request", url, STATUS.INFO);
            request.setURL(url);
            request.setMethod(method);
            if (headers != null) {
                request.setHeaders(headers);
            }
            if (!step.isEmpty()) {
                request.setStep(step);
            }
            response = ApiInvocation.handleRequest(request);
            GemTestReporter.addTestStep("Response Message", response.getResponseMessage(), STATUS.INFO);
            responseCheck(response);
        } catch (Exception exception) {
            logger.info("Request doesn't Executed Successfully ", exception);
            GemTestReporter.addTestStep(method.toUpperCase() + " Request Verification ", method.toUpperCase() + " Request Did not Executed Successfully", STATUS.FAIL);
        }
        return response;
    }

    public static Response apiToSendManagementApprovalEmails(String UrlNameFromConfig, String method, Map<String, String> headers, String step) throws Exception {
        Response response = new Response();
        try {
            Request request = new Request();
            String url = ProjectConfigData.getProperty(UrlNameFromConfig);
            if (url.contains("{applicantId"))
                url = GlobalVariable.BASE_URL + url.replace("{applicantId}", String.valueOf(AtsHealthCheck.applicantId));
            else if (url.contains("{interviewId}"))
                url = GlobalVariable.BASE_URL + url.replace("{interviewId}", String.valueOf(InterviewStep.interviewId));
            else
                url = GlobalVariable.BASE_URL + url;
            GemTestReporter.addTestStep("Url for " + method.toUpperCase() + " Request", url, STATUS.INFO);
            request.setURL(url);
            request.setMethod(method);
            if (!headers.isEmpty()) {
                request.setHeaders(headers);
            }
            if (!step.isEmpty()) {
                request.setStep(step);
            }
            response = ApiInvocation.handleRequest(request);
            GemTestReporter.addTestStep("Response Message", response.getResponseMessage(), STATUS.INFO);
            responseCheck(response);
        } catch (Exception exception) {
            logger.info("Request doesn't Executed Successfully ", exception);
            GemTestReporter.addTestStep(method.toUpperCase() + " Request Verification ", method.toUpperCase() + " Request Did not Executed Successfully", STATUS.FAIL);
        }
        return response;
    }

    public static Response apiForUpdatingApplicantStage(String UrlNameFromConfig, String method, Map<String, String> headers, String stage, String step) throws Exception {
        Response response = new Response();
        try {
            Request request = new Request();
            String url = ProjectConfigData.getProperty(UrlNameFromConfig);
            if (method.equals("put"))
                url = GlobalVariable.BASE_URL + url + AtsHealthCheck.applicantId + "/stage/" + stage;
            else if (method.equals("post"))
                url = GlobalVariable.BASE_URL + url + AtsHealthCheck.applicantId + "/align-job/" + AtsHealthCheck.jobId + "?jobTitle=DemoCreated";
            else if (method.equals("patch")) {

            }
            GemTestReporter.addTestStep("Url for " + method.toUpperCase() + " Request", url, STATUS.INFO);
            request.setURL(url);
            request.setMethod(method);
            if (!headers.isEmpty()) {
                request.setHeaders(headers);
            }
            if (!step.isEmpty()) {
                request.setStep(step);
            }
            response = ApiInvocation.handleRequest(request);
            GemTestReporter.addTestStep("Response Message", response.getResponseMessage(), STATUS.INFO);
            responseCheck(response);
        } catch (Exception exception) {
            logger.info("Request doesn't Executed Successfully ", exception);
            GemTestReporter.addTestStep(method.toUpperCase() + " Request Verification ", method.toUpperCase() + " Request Did not Executed Successfully", STATUS.FAIL);
        }
        return response;
    }


    public static void verifyStatusCode(int expected, int actual) {
        if (expected == actual) {
            GemTestReporter.addTestStep("Status Verification", "Expected Status :" + expected + ",<br>Actual :" + actual, STATUS.PASS);
        } else {
            GemTestReporter.addTestStep("Status Verification", "Expected Status :" + expected + ",<br>Actual :" + actual, STATUS.FAIL);
        }
    }

    public static String interviewApiWithPayloads(String UrlNameFromConfig, String method, String payloadName, Map<String, String> headers, String step) throws Exception {
        Response response = new Response();
        try {
            Request request = new Request();
            String url = ProjectConfigData.getProperty(UrlNameFromConfig);
            url = GlobalVariable.BASE_URL + url;
            GemTestReporter.addTestStep("Url for " + method.toUpperCase() + " Request", url, STATUS.INFO);
            request.setURL(url);
            request.setMethod(method);
            if (!headers.isEmpty()) {
                request.setHeaders(headers);
            }
            if (!step.isEmpty()) {
                request.setStep(step);
            }

            if (!payloadName.equals("")) {

                String payload = ProjectSampleJson.getSampleDataString(payloadName);
                JsonParser parser = new JsonParser();
                JsonObject pay = (JsonObject) parser.parse(payload);
                if (method.equals("post")) {
                    pay.addProperty("jobId", AtsHealthCheck.jobId);
                    pay.addProperty("applicantId", AtsHealthCheck.applicantId);
                } else if (method.equals("put")) {
                    pay.addProperty("interviewId", InterviewStep.interviewId);
                    pay.addProperty("applicantId", AtsHealthCheck.applicantId);
                }
                String payloads = String.valueOf(ApiHealthCheckUtils.result(pay));
                request.setRequestPayload(payloads);
                GemTestReporter.addTestStep("Payload ", String.valueOf(payloads), STATUS.INFO);
            }
            response = ApiInvocation.handleRequest(request);
            GemTestReporter.addTestStep("Response Message", response.getResponseMessage(), STATUS.INFO);
            if ((response.getResponseBody()) != null) {
                GemTestReporter.addTestStep("Response Body", response.getResponseBody(), STATUS.INFO);
            } else {
                GemTestReporter.addTestStep("Response Body", "No-Response", STATUS.INFO);
            }

        } catch (Exception e) {
            GemTestReporter.addTestStep(method.toUpperCase() + " Request Verification ", method.toUpperCase() + " Request Did not Executed Successfully", STATUS.FAIL);
            GemTestReporter.addTestStep("Response Message", response.getResponseMessage(), STATUS.INFO);
        }
        if (method.equals("post")) {
            return (response.getStatus() + "," + JsonParser.parseString(response.getResponseBody()).getAsJsonObject().get("object"));
        }

        return String.valueOf(response.getStatus());
    }

    public static String feedbackApiWithPayloads(String UrlNameFromConfig, String method, String payloadName, Map<String, String> headers, String step) throws Exception {
        Response response = new Response();
        try {
            Request request = new Request();
            String url = ProjectConfigData.getProperty(UrlNameFromConfig);
            url = GlobalVariable.BASE_URL + url;
            GemTestReporter.addTestStep("Url for " + method.toUpperCase() + " Request", url, STATUS.INFO);
            request.setURL(url);
            request.setMethod(method);
            if (!headers.isEmpty()) {
                request.setHeaders(headers);
            }
            if (!step.isEmpty()) {
                request.setStep(step);
            }

            if (!payloadName.equals("")) {

                String payload = ProjectSampleJson.getSampleDataString(payloadName);
                JsonParser parser = new JsonParser();
                JsonObject pay = (JsonObject) parser.parse(payload);
                if (method.equals("post")) {
                    pay.addProperty("interviewId", InterviewStep.interviewId);


                } else if (method.equals("put")) {
                    pay.addProperty("interviewId", InterviewStep.interviewId);
                    pay.addProperty("feedbackId", InterviewStep.feedbackId);
                }
                String payloads = String.valueOf(ApiHealthCheckUtils.result(pay));
                request.setRequestPayload(payloads);
                GemTestReporter.addTestStep("Payload ", String.valueOf(payloads), STATUS.INFO);
            }
            response = ApiInvocation.handleRequest(request);

            GemTestReporter.addTestStep("Response Message", response.getResponseMessage(), STATUS.INFO);
            if ((response.getResponseBody()) != null) {
                GemTestReporter.addTestStep("Response Body", response.getResponseBody(), STATUS.INFO);
            } else {
                GemTestReporter.addTestStep("Response Body", "No-Response", STATUS.INFO);
            }

        } catch (Exception e) {
            GemTestReporter.addTestStep(method.toUpperCase() + " Request Verification ", method.toUpperCase() + " Request Did not Executed Successfully", STATUS.FAIL);
            GemTestReporter.addTestStep("Response Message", response.getResponseMessage(), STATUS.INFO);
        }
        if (method.equals("post"))
            return (response.getStatus() + "," + JsonParser.parseString(response.getResponseBody()).getAsJsonObject().get("object").getAsJsonObject().get("feedbackId").toString());
        else
            return String.valueOf(response.getStatus());
    }

    public static MultipartEntityBuilder entitybuilderFileParser(List<String> keys, List<String> values, String method, String url) throws IOException {
        MultipartEntityBuilder entitybuilder = MultipartEntityBuilder.create();
        entitybuilder.setMode(HttpMultipartMode.BROWSER_COMPATIBLE);
        for (int i = 0; i < keys.size(); i++) {
            if (values.get(i).contains(".json") && method.equals("put") && (!url.contains("JobID"))) {
                JsonParser parser = new JsonParser();
                JsonObject newObject = new JsonObject();
                newObject = (JsonObject) parser.parse(new FileReader("src/main/resources/" + values.get(i)));
                if (url.contains("Job"))
                    newObject.addProperty("jobId", AtsHealthCheck.jobId);
                else
                    newObject.addProperty("applicantId", AtsHealthCheck.applicantId);
                Gson gson = new Gson();
                String jsonOutput = gson.toJson(newObject);
                FileWriter writer = new FileWriter("src/main/resources/" + values.get(i));
                writer.write(jsonOutput);
                writer.close();
            }
            entitybuilder.addBinaryBody(keys.get(i), new File("src/main/resources/" + values.get(i)));
        }
        return entitybuilder;
    }

    public static String jobApiWithFormData(String url, String method, Map<String, String> headers, String step, List<String> keys, List<String> values) throws Exception {
        int arr[] = new int[2];
        JsonObject js;
        try {
            String u = "";
            u = GlobalVariable.BASE_URL + ProjectConfigData.getProperty(url);
            if (u.contains("{jobId}"))
                u = u.replace("{jobId}", String.valueOf(AtsHealthCheck.jobId));
            GemTestReporter.addTestStep("Url of the test case", u, STATUS.INFO);
            CloseableHttpClient httpclient = HttpClients.createDefault();

            MultipartEntityBuilder entitybuilder = entitybuilderFileParser(keys, values, method, url);
            HttpEntity mutiPartHttpEntity = entitybuilder.build();
            RequestBuilder reqbuilder = null;
            if (method.equalsIgnoreCase("post")) {
                reqbuilder = RequestBuilder.post(u);
            } else if (method.equalsIgnoreCase("put")) {
                reqbuilder = RequestBuilder.put(u);
            }
            reqbuilder.setEntity(mutiPartHttpEntity);
            HttpUriRequest multipartRequest = reqbuilder.build();
            multipartRequest.setHeader(new BasicHeader("X-REMOTE-USER-EMAIL", "saru.goyal@geminisolutions.com"));
            HttpResponse httpresponse = httpclient.execute(multipartRequest);
            GemTestReporter.addTestStep("POST Request Verification", "POST request executed Successfully", STATUS.PASS);
            js = (JsonObject) JsonParser.parseString(EntityUtils.toString(httpresponse.getEntity()));
            GemTestReporter.addTestStep("Response Body", String.valueOf(js), STATUS.INFO);
            GemTestReporter.addTestStep("Response Message", js.get("message").getAsString(), STATUS.INFO);
            arr[0] = httpresponse.getStatusLine().getStatusCode();
            if (method.equals("post")) {
                arr[1] = Integer.parseInt(String.valueOf(js.get("object").getAsJsonObject().get("jobId")));
                return (arr[0] + "," + arr[1]);
            } else
                return String.valueOf(arr[0]);
        } catch (Exception exception) {
            logger.info("Request doesn't Executed Successfully ", exception);
            GemTestReporter.addTestStep(method.toUpperCase() + " Request Verification ", method.toUpperCase() + " Request Did not Executed Successfully", STATUS.FAIL);
        }
        if (method.equals("post")) {
            return (arr[0] + "," + arr[1]);
        } else
            return String.valueOf(arr[0]);
    }


    public static String applicantApiWithFormData(String url, String method, Map<String, String> headers, String step, List<String> keys, List<String> values) throws Exception {
        int response = 0;
        int arr[] = new int[2];
        try {
            String u = "";
            u = GlobalVariable.BASE_URL + ProjectConfigData.getProperty(url);
            if (u.contains("{applicantId}"))
                u = u.replace("{applicantId}", String.valueOf(AtsHealthCheck.applicantId));

            GemTestReporter.addTestStep("Url of the test case", u, STATUS.INFO);
            CloseableHttpClient httpclient = HttpClients.createDefault();
            MultipartEntityBuilder entitybuilder = entitybuilderFileParser(keys, values, method, url);
            HttpEntity mutiPartHttpEntity = entitybuilder.build();
            RequestBuilder reqbuilder = null;
            if (method.equalsIgnoreCase("post")) {
                reqbuilder = RequestBuilder.post(u);
            } else if (method.equalsIgnoreCase("put")) {
                reqbuilder = RequestBuilder.put(u);
            }
            reqbuilder.setEntity(mutiPartHttpEntity);
            HttpUriRequest multipartRequest = reqbuilder.build();
            multipartRequest.setHeader(new BasicHeader("X-REMOTE-USER-EMAIL", "saru.goyal@geminisolutions.com"));
            HttpResponse httpresponse = httpclient.execute(multipartRequest);
            GemTestReporter.addTestStep("POST Request Verification", "POST request executed Successfully", STATUS.PASS);
            JsonObject js = (JsonObject) JsonParser.parseString(EntityUtils.toString(httpresponse.getEntity()));
            GemTestReporter.addTestStep("Response Body", String.valueOf(js), STATUS.INFO);
            GemTestReporter.addTestStep("Response Message", js.get("message").getAsString(), STATUS.INFO);
            arr[0] = httpresponse.getStatusLine().getStatusCode();
            if (method.equals("post"))
                arr[1] = Integer.parseInt(String.valueOf(js.get("object").getAsJsonObject().get("applicantId")));
            if (method.equals("post"))
                return (arr[0] + "," + arr[1]);
            else
                return String.valueOf(arr[0]);
        } catch (Exception exception) {
            logger.info("Request doesn't Executed Successfully ", exception);
            GemTestReporter.addTestStep(method.toUpperCase() + " Request Verification ", method.toUpperCase() + " Request Did not Executed Successfully", STATUS.FAIL);
        }
        if (method.equals("post"))
            return (arr[0] + "," + arr[1]);
        else
            return String.valueOf(arr[0]);
    }
}