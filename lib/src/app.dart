import 'package:flutter/material.dart';
import 'package:flutter_kakao_login_with_provider/src/controller/user_controller.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter with Kakao login"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _profile(),
              _nickName(),
              _loginButton(),
            ],
          ),
        ));
  }

  Widget _profile() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child:
                Consumer<UserController>(builder: (context, controller, child) {
              final String? src = controller.user?.properties?["profile_image"];
              if (src != null) {
                return Image.network(src, fit: BoxFit.cover);
              } else {
                return Container(
                  color: Colors.black,
                );
              }
            }),
          ),
        ),
      );

  Widget _nickName() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<UserController>(builder: (context, controller, child) {
          final String? name = controller.user?.properties?["nickname"];
          if (name != null) {
            return Text(name);
          } else {
            return const Text("로그인이 필요합니다");
          }
        }),
      );

  Widget _loginButton() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
            onTap: context.read<UserController>().kakaoLogin,
            child: Image.asset("assets/images/kakao_login_medium_narrow.png")),
      );
}
