import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class KakaoLoginApi {
  signWithKakao() {
    final UserApi api = UserApi.instance;
    try {
      return isKakaoTalkInstalled().then((isInstalled) async {
        if (isInstalled) {
          await api.loginWithKakaoTalk();
        } else {
          await api.loginWithKakaoAccount();
        }
      }).then((_) async {
        final User user = await api.me();
        print(user);
        return user;
      });
    } catch (e) {
      if (e is PlatformException && e.code == "CANCELED") {
        return;
      }
      throw Exception("Kakao Login Faield...");
    }
  }
}
