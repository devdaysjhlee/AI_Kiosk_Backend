# yolo 모델을 사용한 얼굴 검출 함수 

from predict_age import yolo_model

def detect_faces(frame):
    results = yolo_model(frame)
    faces = []

    for result in results:
        for box in result.boxes:
            cls_id = int(box.cls[0])
            if cls_id == 0:
                x1, y1, x2, y2 = map(int, box.xyxy[0])
                w = x2 - x1
                h = y2 - y1
                faces.append((x1, y1, w, h))

    return faces