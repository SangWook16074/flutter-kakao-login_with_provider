import 'package:flutter/material.dart';
import 'package:flutter_kakao_login_with_provider/src/api/kakao_login_api.dart';
import 'package:flutter_kakao_login_with_provider/src/app.dart';
import 'package:flutter_kakao_login_with_provider/src/controller/user_controller.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  KakaoSdk.init(
    nativeAppKey: '7fbb7613e1a56f31bd66426c4a384817',
    javaScriptAppKey: '4a0e02e40dde4f547894e685f20d613e',
  );
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserController(
        kakaoLoginApi: KakaoLoginApi(),
      ),
      child: const MaterialApp(
        home: App(),
      ),
    );
  }
}
