import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class KakaoLoginApi {
  signWithKakao() {
    final UserApi api = UserApi.instance;

    return isKakaoTalkInstalled().then((isInstalled) {
      // 카톡이 설치되었다면
      if (isInstalled) {
        try {
          // 카톡으로 로그인
          api.loginWithKakaoTalk().then((_) {
            return api.me();
          });
        } catch (e) {
          // 의도적인 뒤로가기 예외처리
          if (e is PlatformException && e.code == "CANCELED") {
            return;
          }
          // 카톡에 로그인되어있지 않으면 계정으로 로그인
          try {
            api.loginWithKakaoAccount().then((_) {
              return api.me();
            });
          } catch (e) {
            print(e);
          }
        }
      } else {
        // 카톡이 설치되어있지 않으면
        // 계정으로 로그인
        try {
          api.loginWithKakaoAccount().then((_) {
            return api.me();
          });
        } catch (e) {
          print(e);
        }
      }
    });
  }
}
