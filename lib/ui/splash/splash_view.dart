import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sym_mvvm_clone/main.dart';
import 'package:sym_mvvm_clone/ui/component/s_color.dart';
import 'package:sym_mvvm_clone/ui/component/s_text.dart';
import 'package:sym_mvvm_clone/ui/component/s_typo.dart';
import 'package:sym_mvvm_clone/ui/splash/splash_view_model.dart';

class SplashView extends StatelessWidget {
  final viewModel = Get.put(SplashViewModel());
  SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Obx(
          () {
            if (viewModel.isLoading.value) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      right: 84,
                      left: 84,
                    ),
                    child: SvgPicture.asset(
                      'assets/happy_sym.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      bottom: 200,
                    ),
                    child: Column(
                      children: [
                        SText(
                          text: 'SYM',
                          type: TextType.header1,
                          color: SColor.main,
                        ),
                        SText(
                          text: 'Speak Your Mind',
                          type: TextType.header2,
                          color: SColor.sub,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const MyHomePage();
            }
          },
        ),
      ),
    );
  }
}
