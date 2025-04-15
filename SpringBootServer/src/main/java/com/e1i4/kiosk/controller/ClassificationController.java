package com.e1i4.kiosk.controller;

import org.springframework.core.io.FileSystemResource;
import org.springframework.http.*;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class ClassificationController {

    @PostMapping("/classify")
    public ResponseEntity<Map<String, String>> classify(@RequestParam("image") MultipartFile file) throws IOException {
        // 1. 이미지 임시 파일로 저장
        Path tempFile = Files.createTempFile("image_", ".jpg");
        file.transferTo(tempFile.toFile());

        // 2. Flask 서버에 이미지 전송
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.MULTIPART_FORM_DATA);

        MultiValueMap<String, Object> body = new LinkedMultiValueMap<>();
        body.add("image", new FileSystemResource(tempFile.toFile()));

        HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(body, headers);

        String flaskUrl = "http://localhost:5050/predict"; // Flask 서버 주소

        ResponseEntity<Map> response = restTemplate.postForEntity(flaskUrl, requestEntity, Map.class);

        // 3. 결과 반환
        return ResponseEntity.ok(response.getBody());
    }

    @GetMapping("/ping")
    public String ping() {
        return "pong";
    }
}