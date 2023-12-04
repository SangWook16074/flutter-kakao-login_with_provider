import 'package:flutter/material.dart';
import 'package:flutter_kakao_login_with_provider/src/api/kakao_login_api.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class UserController with ChangeNotifier {
  User? _user;
  KakaoLoginApi kakaoLoginApi;
  User? get user => _user;

  UserController({required this.kakaoLoginApi});

  void kakaoLogin() async {
    kakaoLoginApi.signWithKakao().then((User? user) {
      if (user != null) {
        _user = user;
        notifyListeners();
      }
    });
  }
}
