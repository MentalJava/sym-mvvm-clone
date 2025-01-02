import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:sym_mvvm_clone/ui/component/s_button.dart';
import 'package:sym_mvvm_clone/ui/component/s_color.dart';
import 'package:sym_mvvm_clone/ui/component/s_text.dart';
import 'package:sym_mvvm_clone/ui/component/s_typo.dart';
import 'package:sym_mvvm_clone/ui/sign_in/sign_in_view.dart';
import 'package:sym_mvvm_clone/ui/splash/splash_view.dart';

void main() async {
  await dotenv.load(fileName: 'assets/config/.env');
  WidgetsFlutterBinding.ensureInitialized();
  String? kakaoNativeAppKey = dotenv.env['KAKAO_API_KEY'];
  KakaoSdk.init(nativeAppKey: kakaoNativeAppKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/splash',
      getPages: [
        GetPage(
          name: '/splash',
          page: () => const SplashView(),
        ),
        GetPage(
          name: '/home',
          page: () => const MyHomePage(),
        ),
        GetPage(
          name: '/signIn',
          page: () => SignInView(),
        )
      ],
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const SText(
          text: 'hi',
          type: TextType.header1,
          color: SColor.black,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SButton(
              state: ButtonState.standard,
              onCilcked: () {},
              text: '완료',
            ),
            const SizedBox(
              height: 10,
            ),
            const SButton(
              state: ButtonState.disabled,
              text: '완료',
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
