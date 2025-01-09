import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:sym_mvvm_clone/ui/home/home_view.dart';
import 'package:sym_mvvm_clone/ui/sign_in/sign_in_view.dart';
import 'package:sym_mvvm_clone/ui/sign_up/sign_up_view.dart';
import 'package:sym_mvvm_clone/ui/splash/splash_view.dart';

void main() async {
  await dotenv.load(fileName: 'assets/config/.env');
  WidgetsFlutterBinding.ensureInitialized();
  String? kakaoNativeAppKey = dotenv.env['KAKAO_API_KEY'];
  KakaoSdk.init(nativeAppKey: kakaoNativeAppKey);
  await initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/home',
      getPages: [
        GetPage(
          name: '/splash',
          page: () => const SplashView(),
        ),
        GetPage(
          name: '/home',
          page: () => HomeView(),
        ),
        GetPage(
          name: '/signIn',
          page: () => SignInView(),
        ),
        GetPage(
          name: '/signUp',
          page: () => SignUpView(),
        )
      ],
    );
  }
}
