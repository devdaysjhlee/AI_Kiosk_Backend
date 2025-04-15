# 텐서플로우로 예측모델을 로드하고, 이미지 데이터를 받아 연령을 예측하는 함수 

import numpy as np
from ultralytics import YOLO
import cv2
from tensorflow.keras.models import load_model

# 세 가지 모델을 앙상블 기법으로 사용하기 위해 로드한다.
yolo_model = YOLO("./models/yolo11n.pt")
face_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + "haarcascade_frontalface_default.xml")
age_model_paths = [
    "./models/cnn_model.h5",
    "./models/efficientnet_age_model.h5",
    "./models/rasnet50.h5"
]
age_models = [load_model(model_path) for model_path in age_model_paths]
weights = np.array([0.33, 0.33, 0.34])

# 이미지를 통해 연령을 예측한다
# 
def predict_age(img):
    image_size = 224
    img = cv2.resize(img, (image_size, image_size))
    img = img.astype("float32") / 255.0
    img = np.expand_dims(img, axis=0)

    predictions = np.array([model.predict(img)[0] for model in age_models])
    weighted_predictions = np.average(predictions, axis=0, weights=weights)
    predicted_class = np.argmax(weighted_predictions)

    age_labels = ["kid", "middle", "senior"]
    return age_labels[predicted_class]