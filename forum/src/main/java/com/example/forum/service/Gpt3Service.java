package com.example.forum.service;

import okhttp3.*;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.json.JSONObject;


import java.io.IOException;

@Service
public class Gpt3Service {

    private static final String GPT3_API_URL = "https://api.openai.com/v1/engines/davinci/completions";

    @Value("${gpt3.api-key}")
    private String gpt3ApiKey;

    public String calculateIntegral(String problem) throws IOException {
        OkHttpClient client = new OkHttpClient();

        MediaType mediaType = MediaType.parse("application/json");
        String bodyContent = "{"
                + "\"model\": \"gpt-3.5-turbo\","
                + "\"messages\": ["
                + "{ \"role\": \"system\", \"content\": \"You are a helpful assistant.\"},"
                + "{ \"role\": \"user\", \"content\": \"" + problem + "\"}"
                + "],"
                + "\"temperature\": 0.2,"
                + "\"max_tokens\": 100"
                + "}";
        RequestBody body = RequestBody.create(mediaType, bodyContent);
        Request request = new Request.Builder()
                .url("https://api.openai.com/v1/chat/completions")
                .post(body)
                .addHeader("Content-Type", "application/json")
                .addHeader("Authorization", "Bearer " + gpt3ApiKey)
                .build();

        try (Response response = client.newCall(request).execute()) {
            if (!response.isSuccessful()) throw new IOException("Unexpected code " + response);

            JSONObject jsonObject = new JSONObject(response.body().string());

            String gpt3Response = jsonObject.getJSONArray("choices")
                    .getJSONObject(0)
                    .getJSONObject("message")
                    .getString("content");

            return gpt3Response;
        }
    }
}


