# ucc_ios_sdk
# 1. Cài đặt CocoaPods để quản lý các thư viện của dự án.

  ```
  sudo gem install cocoapods
  ```

# 2. Clone nhánh chứa mã mẫu

# 3. Mở teminal trong thư mục dự án của bạn và nhập lệnh bên dưới.

  ```
  pod install
  ```

# 4. Nhận thông tin xác thực của ứng dụng và lấy ENABLE_OUTGOING_CALL_WAITTING_SCREEN, IMCOMING_CALL_TIMEOUT, TIMEOUT_CONNECTION, TIMEOUT_INTERVAL, ROOT_URL, ROOT_URL_WS, TOKEN_ID, TOKEN_KEY, CLIENT_ID, CLIENT_SECRET.

# 5. Đặt thông tin xác thực đã nhận vào tệp AppDelegate nằm trong thư mục gốc của dự án của bạn.

  ```
  VNPTMeetConfig.shared.ENABLE_OUTGOING_CALL_WAITTING_SCREEN = false
  VNPTMeetConfig.shared.TOKEN_ID = "your_TOKEN_ID"
  VNPTMeetConfig.shared.TOKEN_KEY = "your_TOKEN_KEY"
  VNPTMeetConfig.shared.CLIENT_ID = "videocall"
  VNPTMeetConfig.shared.CLIENT_SECRET = "password"
  VNPTMeet.shared.delegate = self
  ```

# 6. Chạy code sample.

