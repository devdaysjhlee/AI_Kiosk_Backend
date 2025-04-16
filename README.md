# AI_Kiosk_Backend

WASSUP EST AI 모델 개발자 양성과정 6회차에서 진행된 2개월간의 AI 안면인식 키오스크 프로젝트입니다. 

- 기간 : 25.02.08 - 25.04.07 (2개월) 
- 인원 : AI 모델 2인, 안드로이드 1인, 백엔드 1인
- 사용 기술 : Android, SpringBoot, Flask, MySQL, TensorFlow, CV2, Numpy, Yolo, Cnn, RasNet, EfficientNet, Github 
- 요약 : 안드로이드 기반으로 사용자의 안면을 인식해 연령대를 예측하고 맞춤 UI를 보여주는 키오스크
- 담당 부분 : MySQL, SpringBoot, Flask

# 전체 프로젝트 구조

![수정](https://github.com/user-attachments/assets/571b696e-e6c0-4782-bed1-3a08b968742c)

1. 키오스크 화면의 카메라가 유저의 얼굴을 촬영하고, 이미지 프레임을 Classification Controller에 전송합니다.
2. Classificatino Controller는 해당 이미지를 임시 파일로 저장하고 Flask 서버에 전송합니다.
3. Flask 서버는 yolo를 통해 이미지에서 얼굴을 검출하고, cnn+rasnet+efficientnet으로 이미지 연령대 분류를 수행합니다.
4. 분류 결과를 다시 Classification Controller에 전송합니다.
5. 안드로이드 UI가 이 결과를 받아 유저에게 해당되는 맞춤형 UI를 보여줍니다.
6. UI는 Menu Controller를 통해 받아온 맥도날드 메뉴 데이터를 활용해 구성됩니다.
7. Order에서 유저의 주문 내역을 SalesContrller에 전송하면 DB에 저장되며, 이를 통해 연령대별 메뉴 추천을 수행합니다.
8. Payment에서 주문을 결제합니다. 

안드로이드 기반으로 만들어진 프론트엔드가 카메라로 사용자의 안면을 촬영하고 UI를 보여주는 역할을 수행합니다. 

![image](https://github.com/user-attachments/assets/b4c8f176-e295-4716-8193-d1b8c0d89646)
![image](https://github.com/user-attachments/assets/28b10786-6748-4304-b6ba-4b7ca342482e)
![image](https://github.com/user-attachments/assets/bab47441-eb74-443a-b9f5-787870bdd3d1)
![image](https://github.com/user-attachments/assets/b9cb02c1-24cf-4e63-8a18-3d84914a4917)
![image](https://github.com/user-attachments/assets/c4440487-4f7f-45f5-95c8-3d4cc3f6a8f7)

# MySQL

MySQL로 만들어진 DB는 맥도날드 주문 페이지에서 api를 통해 가져온 메뉴 정보를 저장하는 테이블과 주문 내역을 저장하는 테이블로 이루어져 있습니다. 

<img width="181" alt="image" src="https://github.com/user-attachments/assets/d0932b1b-ebfe-4157-929b-b327dcb7c49f" />

menu는 맥도날드 메뉴 정보를 저장하고, sales는 주문 내역을 저장합니다. 

### menu
<img width="804" alt="image" src="https://github.com/user-attachments/assets/44ff7cdc-b15f-4cc0-95d4-af3125a6e303" />

### sales
<img width="685" alt="image" src="https://github.com/user-attachments/assets/b5e03f95-77ea-47f5-a13f-31baeb852437" />

# SpringBoot

<img width="295" alt="image" src="https://github.com/user-attachments/assets/84b33fa7-ef02-4c05-963b-980c70a8441f" />

<img width="173" alt="image" src="https://github.com/user-attachments/assets/f5192781-5edb-49bf-a266-9f582efd7c99" />



get / -> home 화면

get /menus -> 맥도날드 메뉴 정보 db에서 반환

post /sales -> db에 판매 기록 업데이트

post /api/classify -> 이미지 전송하여 flask에서의 분류 결과 반환

get /upload -> 테스트 페이지

post /upload -> 이미지 전송해 결과 테스트 

