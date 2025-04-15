# 얼굴 인식 연령대 클래스 분류를 위한 Flask 서버의 메인 실행 파일

import cv2
import numpy as np
from flask import Flask, request, jsonify
import random
import uuid
import os
import base64
from predict_age import predict_age
from detect_faces import detect_faces

# Flask 서버 시작
app = Flask(__name__)
@app.route("/predict", methods=["POST"])  # POST 요청 처리 
def predict():
    if 'image' not in request.files:
        return jsonify({"error": "이미지 없음"}), 400

    file = request.files['image']

    # 이미지명 고유하게 설정해 저장 
    upload_folder = "uploaded_images"
    unique_filename = f"image_{uuid.uuid4().hex}.jpg"
    save_path = os.path.join(upload_folder, unique_filename)
    file.save(save_path)

    # OpenCV로 이미지 읽기
    file_bytes = np.frombuffer(open(save_path, "rb").read(), np.uint8)
    img = cv2.imdecode(file_bytes, cv2.IMREAD_COLOR)

    img = cv2.resize(img, None, fx=2, fy=2, interpolation=cv2.INTER_LINEAR)

    # 얼굴 검출
    faces = detect_faces(img)

    # 디버그
    for (x, y, w, h) in faces:
        cv2.rectangle(img, (x, y), (x + w, y + h), (255, 0, 0), 2)
    cv2.imwrite("debug_faces.jpg", img)  # 검출 결과 이미지 파일로 저장 
    if img is None:
        print("❌ 이미지 로딩 실패")
    print(f"✅ 얼굴 {len(faces)}개 검출됨")

    if len(faces) == 0:
        return jsonify({"error": "No face detected"}), 400
    
    # openCV 결과에서 width와 height이 가장 큰 얼굴 선택
    # 얼굴 여러 개 검출됐을 경우 대비 
    faces = sorted(faces, key=lambda f: f[2] * f[3], reverse=True)
    x, y, w, h = faces[0]
    face_img = img[y:y + h, x:x + w]

    # 나이 예측
    age_group = predict_age(face_img)
    print(age_group)  # 결과 로그로 출력 

    # 검출 결과 이미지 base64로 인코딩
    with open("./debug_faces.jpg", "rb") as f:
        encoded_img = base64.b64encode(f.read()).decode('utf-8')

    # json 형식으로 분류된 클래스 결과와 이미지 반환 
    return jsonify({
        "age_group": age_group,
        "image_base64": encoded_img
    })

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5050)