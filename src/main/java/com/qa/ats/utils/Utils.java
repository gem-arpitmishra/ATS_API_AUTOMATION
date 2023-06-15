package com.qa.ats.utils;


import com.gemini.generic.api.utils.*;
import com.gemini.generic.reporting.GemTestReporter;
import com.gemini.generic.reporting.STATUS;
import com.gemini.generic.utils.ProjectConfigData;

import com.google.gson.*;
import com.qa.ats.stepdefinition.ApplicantStep;
import com.qa.ats.stepdefinition.AtsRegression;
import com.qa.ats.stepdefinition.InterviewStep;
import com.qa.ats.stepdefinition.AtsHealthCheck;
import org.apache.commons.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

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
import io.restassured.http.ContentType;

import static io.restassured.RestAssured.given;


public class Utils {
    static Logger logger = LoggerFactory.getLogger(ApplicantStep.class);
    public static String authValue = "";

    public static void responseCheck(Response response) {
        if ((response.getResponseBody()) != null) {
            GemTestReporter.addTestStep("Response Body", response.getResponseBody(), STATUS.INFO);
        } else {
            GemTestReporter.addTestStep("Response Body", "No-Response", STATUS.INFO);
        }
    }

    public static int accessToken(String method, String url) throws IOException {
        List<String> keys = new ArrayList<>();
        List<String> values = new ArrayList<>();
        JsonObject js;
        keys.add("client_id");
        keys.add("scope");
        keys.add("client_secret");
        keys.add("grant_type");

        String client_id_encode = "NGY2ODVkNzYtZTI0My00ZmY1LTkzNjgtNzA0ODM3N2Q3NzA5";
        byte[] decodedString = Base64.decodeBase64(client_id_encode);
        String client_id_decoded = new String(decodedString);
        values.add(client_id_decoded);

        String scope_encoded = "YXBpOi8vNGY2ODVkNzYtZTI0My00ZmY1LTkzNjgtNzA0ODM3N2Q3NzA5Ly5kZWZhdWx0";
        decodedString = Base64.decodeBase64(scope_encoded);
        String scope_decoded = new String(decodedString);
        values.add(scope_decoded);

        String client_secret_encode = "MW5sOFF+d0E0Mi5IRVJVZzBHelBYaVQweXphNmJ6c0d0dzVPZGI3SA==";
        decodedString = Base64.decodeBase64(client_secret_encode);
        String client_secret_decoded = new String(decodedString);
        values.add(client_secret_decoded);

        values.add("client_credentials");
        CloseableHttpClient httpClient = HttpClients.createDefault();
        MultipartEntityBuilder entityBuilder = entityBuilderFileParserForAccessToken(keys, values, method, url);
        HttpEntity multiPartHttpEntity = entityBuilder.build();
        RequestBuilder reqBuilder = null;
        String u = ProjectConfigData.getProperty(url);
        if (method.equalsIgnoreCase("post")) {
            reqBuilder = RequestBuilder.post(u);
        }
        reqBuilder.setEntity(multiPartHttpEntity);
        HttpUriRequest multipartRequest = reqBuilder.build();
        multipartRequest.setHeader(new BasicHeader("X-REMOTE-USER-EMAIL", "saru.goyal@geminisolutions.com"));

        multipartRequest.setHeader(new BasicHeader("Authorization", authValue));
        HttpResponse httpResponse = httpClient.execute(multipartRequest);
        js = (JsonObject) JsonParser.parseString(EntityUtils.toString(httpResponse.getEntity()));
        String accessToken = String.valueOf(js.get("access_token"));
        authValue = "Bearer " + accessToken;
        return httpResponse.getStatusLine().getStatusCode();
    }


    public static MultipartEntityBuilder entityBuilderFileParserForAccessToken(List<String> keys, List<String> values, String method, String url) throws IOException {
        MultipartEntityBuilder entityBuilder = MultipartEntityBuilder.create();
        entityBuilder.setMode(HttpMultipartMode.BROWSER_COMPATIBLE);
        for (int i = 0; i < keys.size(); i++) {
            JsonParser parser = new JsonParser();
            JsonObject newObject = new JsonObject();
            Gson gson = new Gson();
            String jsonOutput = gson.toJson(newObject);
            entityBuilder.addTextBody((keys.get(i)), values.get(i));
        }
        return entityBuilder;
    }

    public static Response apiWithoutPayloads(String UrlNameFromConfig, String method, Map<String, String> headers, String step) throws Exception {
        Response response = new Response();
        try {
            Request request = new Request();
            String url = ProjectConfigData.getProperty(UrlNameFromConfig);
            url = GlobalVariable.BASE_URL + url;
            if (url.contains("jobStatus"))
                url = url.replace("{jobStatus}", "1");
            if (url.contains("{jobId}"))
                url = url.replace("{jobId}", String.valueOf(AtsHealthCheck.jobId));
            else if (url.contains("{applicantId}"))
                url = url.replace("{applicantId}", String.valueOf(AtsHealthCheck.applicantId));
            else if (url.contains("{interviewId}"))
                url = url.replace("{interviewId}", String.valueOf(InterviewStep.interviewId));
            GemTestReporter.addTestStep("Url for " + method.toUpperCase() + " Request", url, STATUS.INFO);
            request.setURL(url);
            request.setMethod(method);
            headers.put("Authorization", authValue);
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
            url = GlobalVariable.BASE_URL + url;
            if (url.contains("{applicantId"))
                url = url.replace("{applicantId}", String.valueOf(AtsHealthCheck.applicantId));
            else if (url.contains("{interviewId}"))
                url = url.replace("{interviewId}", String.valueOf(InterviewStep.interviewId));
            GemTestReporter.addTestStep("Url for " + method.toUpperCase() + " Request", url, STATUS.INFO);
            request.setURL(url);
            request.setMethod(method);
            headers.put("Authorization", authValue);
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
                url = GlobalVariable.BASE_URL + url + AtsHealthCheck.applicantId + "/align-job/10" + "?jobTitle=QA";
            else if (method.equals("patch")) {
            } else
                url = GlobalVariable.BASE_URL + url;
            GemTestReporter.addTestStep("Url for " + method.toUpperCase() + " Request", url, STATUS.INFO);
            request.setURL(url);
            request.setMethod(method);
            headers.put("Authorization", authValue);
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
            headers.put("Authorization", authValue);
            if (!headers.isEmpty()) {
                request.setHeaders(headers);
            }
            if (!step.isEmpty()) {
                request.setStep(step);
            }
            if (!payloadName.equals(null)) {
                String payload = ProjectSampleJson.getSampleDataString(payloadName);
                JsonParser parser = new JsonParser();
                JsonObject pay = (JsonObject) parser.parse(payload);
                if (method.equals("post")) {
                    pay.addProperty("jobId", 10);
                    pay.addProperty("applicantId", AtsHealthCheck.applicantId);
                } else if (method.equals("put")) {
                    pay.addProperty("interviewId", InterviewStep.interviewId);
                    pay.addProperty("jobId", 10);
                    pay.addProperty("applicantId", AtsHealthCheck.applicantId);
                }
                String payloads = String.valueOf(ApiHealthCheckUtils.result(pay));
                request.setRequestPayload(payloads);
                GemTestReporter.addTestStep("Payload ", String.valueOf(payloads), STATUS.INFO);
            }
            response = ApiInvocation.handleRequest(request);
            GemTestReporter.addTestStep("Response Message", response.getResponseMessage(), STATUS.INFO);
            responseCheck(response);
        } catch (Exception exception) {
            logger.info("Request doesn't Executed Successfully ", exception);

            if ((response.getResponseBody()) != null) {
                GemTestReporter.addTestStep("Response Body", response.getResponseBody(), STATUS.INFO);
            } else {
                GemTestReporter.addTestStep("Response Body", "No-Response", STATUS.INFO);
            }
        }
        if (method.equals("post") && response.getStatus() >= 200 && response.getStatus() <= 201) {
            return (response.getStatus() + "," + JsonParser.parseString(response.getResponseBody()).getAsJsonObject().get("object"));
        }
        return String.valueOf(response.getStatus());
    }

    public static String applicantApiForVetting(String UrlNameFromConfig, String method, String payloadName, Map<String, String> headers, String step) throws Exception {
        Response response = new Response();
        try {
            Request request = new Request();
            String url = ProjectConfigData.getProperty(UrlNameFromConfig);
            url = GlobalVariable.BASE_URL + url;
            GemTestReporter.addTestStep("Url for " + method.toUpperCase() + " Request", url, STATUS.INFO);
            request.setURL(url);
            request.setMethod(method);
            headers.put("Authorization", authValue);
            if (!headers.isEmpty()) {
                request.setHeaders(headers);
            }
            if (!step.isEmpty()) {
                request.setStep(step);
            }
            if (!payloadName.equals(null)) {
                JsonArray newObject = new JsonArray();
                JsonParser parser = new JsonParser();
                newObject = (JsonArray) parser.parse(new FileReader("src/main/resources/" + payloadName));
                newObject.get(0).getAsJsonObject().addProperty("applicantId", AtsHealthCheck.applicantId);
                newObject.get(0).getAsJsonObject().addProperty("currentStageId", 1);
                newObject.get(0).getAsJsonObject().addProperty("jobId", AtsHealthCheck.jobId);
                Gson gson = new Gson();
                String jsonOutput = gson.toJson(newObject);
                FileWriter writer = new FileWriter("src/main/resources/" + payloadName);
                writer.write(jsonOutput);
                writer.close();
                request.setRequestPayload(jsonOutput);
                GemTestReporter.addTestStep("Payload ", jsonOutput, STATUS.INFO);
            }
            response = ApiInvocation.handleRequest(request);
            GemTestReporter.addTestStep("Response Message", response.getResponseMessage(), STATUS.INFO);
            responseCheck(response);
        } catch (Exception exception) {
            logger.info("Request doesn't Executed Successfully ", exception);

            if ((response.getResponseBody()) != null) {
                GemTestReporter.addTestStep("Response Body", response.getResponseBody(), STATUS.INFO);
            } else {
                GemTestReporter.addTestStep("Response Body", "No-Response", STATUS.INFO);
            }
        }
        if (method.equals("post") && response.getStatus() >= 200 && response.getStatus() <= 201) {

            return (response.getStatus() + "," + JsonParser.parseString(response.getResponseBody()).getAsJsonObject().get("object"));
        }
        if (response.getStatus() != 200 && response.getStatus() != 201) {
            return String.valueOf(response.getStatus());
        }
        return String.valueOf(response.getStatus());
    }

    public static String feedbackApiWithPayloads(String UrlNameFromConfig, String method, String payloadName, Map<String, String> headers, String step) throws Exception {
        Response response = new Response();
        try {
            Request request = new Request();
            String url = ProjectConfigData.getProperty(UrlNameFromConfig);
            if (url.contains("{applicantId}"))
                url = url.replace("{applicantId}", String.valueOf(AtsHealthCheck.applicantId));
            url = GlobalVariable.BASE_URL + url;
            GemTestReporter.addTestStep("Url for " + method.toUpperCase() + " Request", url, STATUS.INFO);
            request.setURL(url);
            request.setMethod(method);
            headers.put("Authorization", authValue);
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
        if (method.equals("post") && UrlNameFromConfig.contains("Vetting"))
            return String.valueOf((response.getStatus()));
        else if (method.equals("post") && response.getStatus() >= 200 && response.getStatus() <= 201)
            return (response.getStatus() + "," + JsonParser.parseString(response.getResponseBody()).getAsJsonObject().get("object").getAsJsonObject().get("feedbackId").toString());
        else
            return String.valueOf(response.getStatus());
    }

    public static long generateRandom() {
        Random random = new Random();
        StringBuilder sb = new StringBuilder();
        sb.append(random.nextInt(9) + 1);
        for (int i = 0; i < 11; i++) {
            sb.append(random.nextInt(10));
        }
        return Long.valueOf(sb.toString()).longValue();
    }

    public static String getSaltString() {
        String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 10) { // length of the random string.
            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        String saltStr = salt.toString();
        return saltStr;
    }

    public static MultipartEntityBuilder entityBuilderFileParserForResume(List<String> keys, List<String> values, String method, String url) throws IOException {
        MultipartEntityBuilder entityBuilder = MultipartEntityBuilder.create();
        entityBuilder.setMode(HttpMultipartMode.BROWSER_COMPATIBLE);
        entityBuilder.addBinaryBody(keys.get(0), new File("src/main/resources/" + values.get(0)));

        return entityBuilder;
    }

    public static MultipartEntityBuilder entityBuilderFileParser(List<String> keys, List<String> values, String method, String url) throws IOException {
        MultipartEntityBuilder entityBuilder = MultipartEntityBuilder.create();
        entityBuilder.setMode(HttpMultipartMode.BROWSER_COMPATIBLE);
        for (int i = 0; i < keys.size(); i++) {
            if (values.get(i).contains("applicant.json") && method.equals("post") && url.contains("sendApplicantsForVetting") == false) {
                JsonParser parser = new JsonParser();
                JsonObject newObject = new JsonObject();
                newObject = (JsonObject) parser.parse(new FileReader("src/main/resources/" + values.get(i)));
                if (newObject.has("email"))
                    newObject.remove("email");
                if (newObject.has("contactNumber"))
                    newObject.remove("contactNumber");
                newObject.addProperty("email", Utils.getSaltString() + "@gmail.com");
                newObject.addProperty("contactNumber", Utils.generateRandom());
                if (newObject.has("applicantId"))
                    newObject.remove("applicantId");
                Gson gson = new Gson();
                String jsonOutput = gson.toJson(newObject);
                FileWriter writer = new FileWriter("src/main/resources/" + values.get(i));
                writer.write(jsonOutput);
                writer.close();
            } else if (values.get(i).contains("applicantVetting.json") && method.equals("post")) {
                JsonArray newObject = new JsonArray();
                JsonParser parser = new JsonParser();
                newObject = (JsonArray) parser.parse(new FileReader("src/main/resources/" + values.get(i)));
                newObject.get(0).getAsJsonObject().addProperty("applicantId", AtsHealthCheck.applicantId);
                newObject.get(0).getAsJsonObject().addProperty("currentStageId", 1);
                newObject.get(0).getAsJsonObject().addProperty("jobId", AtsHealthCheck.jobId);
                Gson gson = new Gson();
                String jsonOutput = gson.toJson(newObject);
                FileWriter writer = new FileWriter("src/main/resources/" + values.get(i));
                writer.write(jsonOutput);
                writer.close();

            } else if (values.get(i).contains(".json") && method.equals("put") && (!url.contains("JobID"))) {
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
            entityBuilder.addBinaryBody(keys.get(i), new File("src/main/resources/" + values.get(i)));
        }
        return entityBuilder;
    }

    public static String jobApiWithFormData(String url, String method, Map<String, String> headers, String step, List<String> keys, List<String> values) throws Exception {
        int[] arr = new int[2];
        JsonObject js;
        boolean post = false;
        try {
            String u = "";
            u = GlobalVariable.BASE_URL + ProjectConfigData.getProperty(url);
            if (u.contains("{jobId}"))
                u = u.replace("{jobId}", String.valueOf(AtsHealthCheck.jobId));
            GemTestReporter.addTestStep("Url of the test case", u, STATUS.INFO);
            CloseableHttpClient httpClient = HttpClients.createDefault();
            MultipartEntityBuilder entityBuilder = entityBuilderFileParser(keys, values, method, url);
            HttpEntity multiPartHttpEntity = entityBuilder.build();
            RequestBuilder reqBuilder = null;
            if (method.equalsIgnoreCase("post")) {
                reqBuilder = RequestBuilder.post(u);
            } else if (method.equalsIgnoreCase("put")) {
                reqBuilder = RequestBuilder.put(u);
            }
            reqBuilder.setEntity(multiPartHttpEntity);
            HttpUriRequest multipartRequest = reqBuilder.build();
            multipartRequest.setHeader(new BasicHeader("X-REMOTE-USER-EMAIL", "saru.goyal@geminisolutions.com"));

            multipartRequest.setHeader(new BasicHeader("Authorization", authValue));
            HttpResponse httpResponse = httpClient.execute(multipartRequest);
            GemTestReporter.addTestStep("POST Request Verification", "POST request executed Successfully", STATUS.PASS);
            js = (JsonObject) JsonParser.parseString(EntityUtils.toString(httpResponse.getEntity()));
            GemTestReporter.addTestStep("Response Body", String.valueOf(js), STATUS.INFO);
            if (!String.valueOf(js).contains("400"))
                GemTestReporter.addTestStep("Response Message", js.get("message").getAsString(), STATUS.INFO);
            arr[0] = httpResponse.getStatusLine().getStatusCode();
            post = method.equals("post") && (arr[0] == 200 || arr[0] == 201);
            if (post) {
                arr[1] = Integer.parseInt(String.valueOf(js.get("object").getAsJsonObject().get("jobId")));
                return (arr[0] + "," + arr[1]);
            } else
                return String.valueOf(arr[0]);
        } catch (Exception exception) {
            logger.info("Request doesn't Executed Successfully ", exception);
            GemTestReporter.addTestStep(method.toUpperCase() + " Request Verification ", method.toUpperCase() + " Request Did not Executed Successfully", STATUS.FAIL);
        }
        if (post) {
            return (arr[0] + "," + arr[1]);
        } else
            return String.valueOf(arr[0]);
    }


    public static String applicantApiWithFormData(String url, String method, Map<String, String> headers, String step, List<String> keys, List<String> values) throws Exception {
        int[] arr = new int[2];
        JsonObject js;
        MultipartEntityBuilder entityBuilder;
        try {
            String u = "";
            u = GlobalVariable.BASE_URL + ProjectConfigData.getProperty(url);
            if (u.contains("{applicantId}"))
                u = u.replace("{applicantId}", String.valueOf(AtsHealthCheck.applicantId));
            GemTestReporter.addTestStep("Url of the test case", u, STATUS.INFO);
            CloseableHttpClient httpClient = HttpClients.createDefault();
            if (url.contains("resume")) {
                u = ProjectConfigData.getProperty(url);
                entityBuilder = entityBuilderFileParserForResume(keys, values, method, url);
            } else
                entityBuilder = entityBuilderFileParser(keys, values, method, url);
            HttpEntity multiPartHttpEntity = entityBuilder.build();
            RequestBuilder reqBuilder = null;
            if (method.equalsIgnoreCase("post")) {
                reqBuilder = RequestBuilder.post(u);
            } else if (method.equalsIgnoreCase("put")) {
                reqBuilder = RequestBuilder.put(u);
            }
            reqBuilder.setEntity(multiPartHttpEntity);
            HttpUriRequest multipartRequest = reqBuilder.build();
            multipartRequest.setHeader(new BasicHeader("X-REMOTE-USER-EMAIL", "saru.goyal@geminisolutions.com"));
            multipartRequest.setHeader(new BasicHeader("Authorization", authValue));
            HttpResponse httpResponse = httpClient.execute(multipartRequest);
            GemTestReporter.addTestStep("POST Request Verification", "POST request executed Successfully", STATUS.PASS);


            if (!url.contains("resume") && (httpResponse.getStatusLine().getStatusCode() == 200 || httpResponse.getStatusLine().getStatusCode() == 201)) {
                js = (JsonObject) JsonParser.parseString(EntityUtils.toString(httpResponse.getEntity()));
                GemTestReporter.addTestStep("Response Body", String.valueOf(js), STATUS.INFO);
                GemTestReporter.addTestStep("Response Message", js.get("message").getAsString(), STATUS.INFO);
                arr[0] = httpResponse.getStatusLine().getStatusCode();
                arr[1] = Integer.parseInt(String.valueOf(js.get("object").getAsJsonObject().get("applicantId")));
                return (arr[0] + "," + arr[1]);
            } else if (url.contains("resume")) {
                js = (JsonObject) JsonParser.parseString(EntityUtils.toString(httpResponse.getEntity()));
                GemTestReporter.addTestStep("Response Body", String.valueOf(js), STATUS.INFO);
                arr[0] = httpResponse.getStatusLine().getStatusCode();
                return String.valueOf(arr[0]);
            } else {
                arr[0] = httpResponse.getStatusLine().getStatusCode();
                return String.valueOf(arr[0]);
            }
        } catch (Exception exception) {
            logger.info("Request doesn't Executed Successfully ", exception);
            GemTestReporter.addTestStep(method.toUpperCase() + " Request Verification ", method.toUpperCase() + " Request Did not Executed Successfully", STATUS.FAIL);
        }
        if (method.equals("post"))
            return (arr[0] + "," + arr[1]);
        else
            return String.valueOf(arr[0]);
    }

    public static String applicantApiWithFormDataWrongHeader(String url, String method, Map<String, String> headers, String step, List<String> keys, List<String> values) throws Exception {
        int[] arr = new int[2];
        try {
            String u = "";
            u = GlobalVariable.BASE_URL + ProjectConfigData.getProperty(url);
            if (u.contains("{applicantId}"))
                u = u.replace("{applicantId}", String.valueOf(AtsRegression.applicantId));
            GemTestReporter.addTestStep("Url of the test case", u, STATUS.INFO);
            CloseableHttpClient httpClient = HttpClients.createDefault();
            MultipartEntityBuilder entityBuilder = entityBuilderFileParserWrongHeader(keys, values, method, url);
            HttpEntity multiPartHttpEntity = entityBuilder.build();
            RequestBuilder reqBuilder = null;
            if (method.equalsIgnoreCase("post")) {
                reqBuilder = RequestBuilder.post(u);
            } else if (method.equalsIgnoreCase("put")) {
                reqBuilder = RequestBuilder.put(u);
            }
            reqBuilder.setEntity(multiPartHttpEntity);
            HttpUriRequest multipartRequest = reqBuilder.build();
            multipartRequest.setHeader(new BasicHeader("X-REMOTE-USER", "saru.goyal@geminisolutions.com"));
            multipartRequest.setHeader(new BasicHeader("Authorization", authValue));
            HttpResponse httpResponse = httpClient.execute(multipartRequest);
            GemTestReporter.addTestStep("POST Request Verification", "POST request executed Successfully", STATUS.PASS);
            JsonObject js = (JsonObject) JsonParser.parseString(EntityUtils.toString(httpResponse.getEntity()));
            GemTestReporter.addTestStep("Response Body", String.valueOf(js), STATUS.INFO);
            GemTestReporter.addTestStep("Response Message", js.get("message").getAsString(), STATUS.INFO);
            arr[0] = httpResponse.getStatusLine().getStatusCode();
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

    public static MultipartEntityBuilder entityBuilderFileParserWrongHeader(List<String> keys, List<String> values, String method, String url) throws IOException {
        MultipartEntityBuilder entityBuilder = MultipartEntityBuilder.create();
        entityBuilder.setMode(HttpMultipartMode.BROWSER_COMPATIBLE);
        for (int i = 0; i < keys.size(); i++) {
            if (values.get(i).contains(".json") && method.equals("put") && (!url.contains("JobID"))) {
                JsonParser parser = new JsonParser();
                JsonObject newObject = new JsonObject();
                newObject = (JsonObject) parser.parse(new FileReader("src/main/resources/" + values.get(i)));
                if (url.contains("Job"))
                    newObject.addProperty("jobId", AtsRegression.jobId);
                else if (url.contains("updateApplicantJson")) {
                    newObject.addProperty("email", "");
                    newObject.addProperty("contactNumber", "");
                } else
                    newObject.addProperty("applicantId", AtsRegression.applicantId);
                Gson gson = new Gson();
                String jsonOutput = gson.toJson(newObject);
                FileWriter writer = new FileWriter("src/main/resources/" + values.get(i));
                writer.write(jsonOutput);
                writer.close();
            }
            entityBuilder.addBinaryBody(keys.get(i), new File("src/main/resources/" + values.get(i)));
        }
        return entityBuilder;
    }

    public static MultipartEntityBuilder entityBuilderFileParserForMultipleApplicants(List<String> keys, List<String> values, String method, String url) throws IOException {
        MultipartEntityBuilder entityBuilder = MultipartEntityBuilder.create();
        entityBuilder.setMode(HttpMultipartMode.BROWSER_COMPATIBLE);
        for (int i = 0; i < keys.size(); i++) {
            if (values.get(i).contains(".json")) {
                JsonParser parser = new JsonParser();
                JsonArray newObject = new JsonArray();
                newObject = (JsonArray) parser.parse(new FileReader("src/main/resources/" + values.get(i)));
                for (int j = 0; j <= 1; j++) {
                    if (newObject.get(j).getAsJsonObject().has("email")) {
                        newObject.get(j).getAsJsonObject().remove("email");
                        newObject.get(j).getAsJsonObject().addProperty("email", Utils.getSaltString() + "@gmail.com");
                    }
                    if (newObject.get(j).getAsJsonObject().has("contactNumber")) {
                        newObject.get(j).getAsJsonObject().remove("contactNumber");
                        newObject.get(j).getAsJsonObject().addProperty("contactNumber", Utils.generateRandom());
                    }
                }
                Gson gson = new Gson();
                String jsonOutput = gson.toJson(newObject);
                FileWriter writer = new FileWriter("src/main/resources/" + values.get(i));
                writer.write(jsonOutput);
                writer.close();
            }
            entityBuilder.addBinaryBody(keys.get(i), new File("src/main/resources/" + values.get(i)));
        }
        return entityBuilder;
    }

    public static MultipartEntityBuilder entityBuilderFileParserForMultipleApplicantsForWrongHeader(List<String> keys, List<String> values, String method, String url, String name) throws IOException {
        MultipartEntityBuilder entityBuilder = MultipartEntityBuilder.create();
        entityBuilder.setMode(HttpMultipartMode.BROWSER_COMPATIBLE);
        for (int i = 0; i < keys.size(); i++) {
            if (values.get(i).contains(".json")) {
                JsonParser parser = new JsonParser();
                JsonArray newObject = new JsonArray();
                newObject = (JsonArray) parser.parse(new FileReader("src/main/resources/" + values.get(i)));
                for (int j = 0; j <= 1; j++) {
                    if (name.equalsIgnoreCase("email")) {
                        if (newObject.get(j).getAsJsonObject().has("email")) {
                            newObject.get(j).getAsJsonObject().remove("email");
                            newObject.get(j).getAsJsonObject().addProperty("contactNumber", Utils.generateRandom());
                        }
                    } else if (name.equalsIgnoreCase("contactNumber")) {
                        if (newObject.get(j).getAsJsonObject().has("contactNumber")) {
                            newObject.get(j).getAsJsonObject().remove("contactNumber");
                            newObject.get(j).getAsJsonObject().addProperty("email", Utils.getSaltString());
                        }
                    }
                }
                Gson gson = new Gson();
                String jsonOutput = gson.toJson(newObject);
                FileWriter writer = new FileWriter("src/main/resources/" + values.get(i));
                writer.write(jsonOutput);
                writer.close();
            }
            entityBuilder.addBinaryBody(keys.get(i), new File("src/main/resources/" + values.get(i)));
        }
        return entityBuilder;
    }

    public static String addMultipleApplicantsWithWrongPayload(String url, String method, Map<String, String> headers, List<String> keys, List<String> values, String name) {
        int arr[] = new int[2];
        try {
            String u = "";
            u = GlobalVariable.BASE_URL + ProjectConfigData.getProperty(url);
            GemTestReporter.addTestStep("Url of the test case", u, STATUS.INFO);
            CloseableHttpClient httpClient = HttpClients.createDefault();
            MultipartEntityBuilder entityBuilder = entityBuilderFileParserForMultipleApplicantsForWrongHeader(keys, values, method, url, name);
            HttpEntity multiPartHttpEntity = entityBuilder.build();
            RequestBuilder reqBuilder = null;
            if (method.equalsIgnoreCase("post")) {
                reqBuilder = RequestBuilder.post(u);
            } else if (method.equalsIgnoreCase("put")) {
                reqBuilder = RequestBuilder.put(u);
            } else if (method.equalsIgnoreCase("delete"))
                reqBuilder = RequestBuilder.delete(u);
            reqBuilder.setEntity(multiPartHttpEntity);
            HttpUriRequest multipartRequest = reqBuilder.build();
            multipartRequest.setHeader(new BasicHeader("X-REMOTE-USER-EMAIL", "nipun.jain@geminisolutions.com"));
            multipartRequest.setHeader(new BasicHeader("Authorization", authValue));
            HttpResponse httpresponse = httpClient.execute(multipartRequest);
            arr[0] = httpresponse.getStatusLine().getStatusCode();
            GemTestReporter.addTestStep("POST Request Verification", "POST request executed Successfully", STATUS.PASS);
            JsonObject js = (JsonObject) JsonParser.parseString(EntityUtils.toString(httpresponse.getEntity()));
            GemTestReporter.addTestStep("Response Body", String.valueOf(js), STATUS.INFO);
            if (arr[0] == 200 || arr[0] == 201)
                GemTestReporter.addTestStep("Response Message", js.get("message").getAsString(), STATUS.INFO);
            return String.valueOf(arr[0]);
        } catch (Exception exception) {
            logger.info("Request doesn't Executed Successfully ", exception);
            GemTestReporter.addTestStep(method.toUpperCase() + " Request Verification ", method.toUpperCase() + " Request Did not Executed Successfully", STATUS.FAIL);
        }
        return String.valueOf(arr[0]);
    }

    public static String addMultipleApplicants(String url, String method, Map<String, String> headers, List<String> keys, List<String> values) {
        int[] arr = new int[2];
        try {
            String u = "";
            u = GlobalVariable.BASE_URL + ProjectConfigData.getProperty(url);
            GemTestReporter.addTestStep("Url of the test case", u, STATUS.INFO);
            CloseableHttpClient httpClient = HttpClients.createDefault();
            MultipartEntityBuilder entityBuilder = entityBuilderFileParserForMultipleApplicants(keys, values, method, url);
            HttpEntity multiPartHttpEntity = entityBuilder.build();
            RequestBuilder reqBuilder = null;
            if (method.equalsIgnoreCase("post")) {
                reqBuilder = RequestBuilder.post(u);
            } else if (method.equalsIgnoreCase("put")) {
                reqBuilder = RequestBuilder.put(u);
            } else if (method.equalsIgnoreCase("delete"))
                reqBuilder = RequestBuilder.delete(u);
            reqBuilder.setEntity(multiPartHttpEntity);
            HttpUriRequest multipartRequest = reqBuilder.build();
            multipartRequest.setHeader(new BasicHeader("X-REMOTE-USER-EMAIL", "nipun.jain@geminisolutions.com"));
            multipartRequest.setHeader(new BasicHeader("Authorization", authValue));
            HttpResponse httpResponse = httpClient.execute(multipartRequest);
            arr[0] = httpResponse.getStatusLine().getStatusCode();
            GemTestReporter.addTestStep("POST Request Verification", "POST request executed Successfully", STATUS.PASS);
            JsonObject js = (JsonObject) JsonParser.parseString(EntityUtils.toString(httpResponse.getEntity()));
            GemTestReporter.addTestStep("Response Body", String.valueOf(js), STATUS.INFO);
            if (arr[0] == 200 || arr[0] == 201)
                GemTestReporter.addTestStep("Response Message", js.get("message").getAsString(), STATUS.INFO);
            arr[0] = httpResponse.getStatusLine().getStatusCode();
            return String.valueOf(arr[0]);
        } catch (Exception exception) {
            logger.info("Request doesn't Executed Successfully ", exception);
            GemTestReporter.addTestStep(method.toUpperCase() + " Request Verification ", method.toUpperCase() + " Request Did not Executed Successfully", STATUS.FAIL);
        }
        return String.valueOf(arr[0]);
    }

    public static int apiForPatch(String url, String method, Map<String, String> token, String step) {
        url = ProjectConfigData.getProperty(url);
        String endpoint = url.replace("{applicantId}", String.valueOf(AtsHealthCheck.applicantId));
        String newUrl = GlobalVariable.BASE_URL + endpoint;
        GemTestReporter.addTestStep("Url of the test case for PATCH request", newUrl, STATUS.INFO);
        return given().contentType(ContentType.JSON).header("X-REMOTE-USER-EMAIL", "saru.goyal@geminisolutions.com").header("Authorization", authValue).patch(newUrl).statusCode();
    }

    public static int apiForWrongMethods(String url, String method, Map<String, String> token, String step) {
        url = ProjectConfigData.getProperty(url);
        String endpoint = url.replace("{applicantId}", String.valueOf(AtsHealthCheck.applicantId));
        String newUrl = GlobalVariable.BASE_URL + endpoint;
        GemTestReporter.addTestStep("Url of the test case for PATCH request", newUrl, STATUS.INFO);
        if (method.equalsIgnoreCase("get"))
            return given().contentType(ContentType.JSON).header("X-REMOTE-USER-EMAIL", "saru.goyal@geminisolutions.com").header("Authorization", authValue).get(newUrl).statusCode();
        else if (method.equalsIgnoreCase("post"))
            return given().contentType(ContentType.JSON).header("X-REMOTE-USER-EMAIL", "saru.goyal@geminisolutions.com").header("Authorization", authValue).post(newUrl).statusCode();
        return given().contentType(ContentType.JSON).header("X-REMOTE-USER-EMAIL", "saru.goyal@geminisolutions.com").header("Authorization", authValue).patch(newUrl).statusCode();
    }

    public static String getVetterNamesForWrongPayload(String UrlNameFromConfig, String method, String payloadName, Map<String, String> headers, String step) {
        Response response = new Response();
        try {
            Request request = new Request();
            String url = ProjectConfigData.getProperty(UrlNameFromConfig);
            url = GlobalVariable.BASE_URL + url;
            GemTestReporter.addTestStep("Url for " + method.toUpperCase() + " Request", url, STATUS.INFO);
            request.setURL(url);
            request.setMethod(method);
            headers.put("Authorization", authValue);
            if (!headers.isEmpty()) {
                request.setHeaders(headers);
            }
            if (!step.isEmpty()) {
                request.setStep(step);
            }

            if (!payloadName.equals(null)) {
                JsonArray newObject = new JsonArray();
                JsonParser parser = new JsonParser();
                newObject = (JsonArray) parser.parse(new FileReader("src/main/resources/" + payloadName));
                if (!newObject.isEmpty()) {
                    int i = 0;
                    newObject.add(AtsHealthCheck.applicantId);
                }
                Gson gson = new Gson();
                String jsonOutput = gson.toJson(newObject);
                FileWriter writer = new FileWriter("src/main/resources/" + payloadName);
                writer.write(jsonOutput);
                writer.close();

                request.setRequestPayload(jsonOutput);
                GemTestReporter.addTestStep("Payload ", jsonOutput, STATUS.INFO);
            }
            response = ApiInvocation.handleRequest(request);
            GemTestReporter.addTestStep("Response Message", response.getResponseMessage(), STATUS.INFO);

            responseCheck(response);
        } catch (Exception exception) {
            logger.info("Request doesn't Executed Successfully ", exception);

            if ((response.getResponseBody()) != null) {
                GemTestReporter.addTestStep("Response Body", response.getResponseBody(), STATUS.INFO);
            } else {
                GemTestReporter.addTestStep("Response Body", "No-Response", STATUS.INFO);
            }

        }

        if (method.equals("post") && response.getStatus() >= 200 && response.getStatus() <= 201) {

            return (response.getStatus() + "," + JsonParser.parseString(response.getResponseBody()).getAsJsonObject().get("object"));
        }
        if (response.getStatus() != 200 && response.getStatus() != 201) {
            return String.valueOf(response.getStatus());
        }

        return String.valueOf(response.getStatus());
    }


    public static String getVetterNames(String UrlNameFromConfig, String method, String payloadName, Map<String, String> headers, String step) {
        Response response = new Response();
        try {
            Request request = new Request();
            String url = ProjectConfigData.getProperty(UrlNameFromConfig);
            url = GlobalVariable.BASE_URL + url;
            GemTestReporter.addTestStep("Url for " + method.toUpperCase() + " Request", url, STATUS.INFO);
            request.setURL(url);
            request.setMethod(method);
            headers.put("Authorization", authValue);
            if (!headers.isEmpty()) {
                request.setHeaders(headers);
            }
            if (!step.isEmpty()) {
                request.setStep(step);
            }
            if (!payloadName.equals(null)) {
                JsonArray newObject = new JsonArray();
                JsonParser parser = new JsonParser();
                newObject = (JsonArray) parser.parse(new FileReader("src/main/resources/" + payloadName));
                if (!newObject.isEmpty()) {
                    int i = 0;
                    while (newObject.size() != 0) {
                        newObject.remove(i);
                    }
                    newObject.add(AtsHealthCheck.applicantId);
                }
                Gson gson = new Gson();
                String jsonOutput = gson.toJson(newObject);
                FileWriter writer = new FileWriter("src/main/resources/" + payloadName);
                writer.write(jsonOutput);
                writer.close();

                request.setRequestPayload(jsonOutput);
                GemTestReporter.addTestStep("Payload ", jsonOutput, STATUS.INFO);
            }
            response = ApiInvocation.handleRequest(request);
            GemTestReporter.addTestStep("Response Message", response.getResponseMessage(), STATUS.INFO);

            responseCheck(response);
        } catch (Exception exception) {
            logger.info("Request doesn't Executed Successfully ", exception);

            if ((response.getResponseBody()) != null) {
                GemTestReporter.addTestStep("Response Body", response.getResponseBody(), STATUS.INFO);
            } else {
                GemTestReporter.addTestStep("Response Body", "No-Response", STATUS.INFO);
            }

        }

        if (method.equals("post") && response.getStatus() >= 200 && response.getStatus() <= 201) {

            return (response.getStatus() + "," + JsonParser.parseString(response.getResponseBody()).getAsJsonObject().get("object"));
        }
        if (response.getStatus() != 200 && response.getStatus() != 201) {
            return String.valueOf(response.getStatus());
        }

        return String.valueOf(response.getStatus());
    }
}
