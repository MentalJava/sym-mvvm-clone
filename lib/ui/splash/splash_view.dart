import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sym_mvvm_clone/ui/component/s_color.dart';
import 'package:sym_mvvm_clone/ui/component/s_text.dart';
import 'package:sym_mvvm_clone/ui/component/s_typo.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () => Get.offNamed('/signUp'),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 84,
                    right: 84,
                    bottom: 280,
                  ),
                  child: SvgPicture.asset(
                    'assets/happy_sym.svg',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
            const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
        ),
      ),
    );
  }
}
