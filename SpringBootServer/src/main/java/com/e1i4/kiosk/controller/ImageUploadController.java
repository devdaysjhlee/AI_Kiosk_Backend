package com.e1i4.kiosk.controller;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpEntity;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Map;
import org.springframework.http.HttpHeaders;

@Controller
@RequestMapping("/upload")
public class ImageUploadController {

    @GetMapping
    public String page() {
        return "upload";
    }

    @PostMapping
    public String handleUpload(@RequestParam("image") MultipartFile image,
                               HttpServletRequest request) throws IOException {
        // 1. 이미지 임시 저장
        Path tempFile = Files.createTempFile("upload_", ".jpg");
        image.transferTo(tempFile.toFile());

        // 2. 모델의 입력값에 맞게 이미지 리사이즈 (224x224x3)
        BufferedImage resizedImage = resizeImage(tempFile.toFile(), 224, 224);
        File resizedFile = new File(tempFile.getParent().toFile(), "resized.jpg");
        ImageIO.write(resizedImage, "jpg", resizedFile);

        // 3. Flask 서버에 전송
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.MULTIPART_FORM_DATA);

        MultiValueMap<String, Object> body = new LinkedMultiValueMap<>();
        body.add("image", new FileSystemResource(resizedFile));

        HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(body, headers);
        String flaskUrl = "http://localhost:5050/predict";
        ResponseEntity<Map> response = restTemplate.postForEntity(flaskUrl, requestEntity, Map.class);

        // 4. 결과 저장 (세션 or 리다이렉트 파라미터)
        String ageGroup = (String) response.getBody().get("age_group");
        String imageBase64 = (String) response.getBody().get("image_base64");

        request.getSession().setAttribute("ageGroup", ageGroup);
        request.getSession().setAttribute("imageBase64", imageBase64);

        System.out.println(response.getBody().get("age_group"));

        return "result";
    }

    private BufferedImage resizeImage(File inputFile, int width, int height) throws IOException {
        BufferedImage inputImage = ImageIO.read(inputFile);
        BufferedImage outputImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics2D g2d = outputImage.createGraphics();
        g2d.drawImage(inputImage, 0, 0, width, height, null);
        g2d.dispose();
        return outputImage;
    }
}