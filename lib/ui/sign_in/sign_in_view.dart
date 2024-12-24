import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sym_mvvm_clone/data/repository/sign_in_repository/sign_in_repository_impl.dart';
import 'package:sym_mvvm_clone/ui/component/s_color.dart';
import 'package:sym_mvvm_clone/ui/component/s_text.dart';
import 'package:sym_mvvm_clone/ui/component/s_typo.dart';
import 'package:sym_mvvm_clone/ui/sign_in/sign_in_view_model.dart';

class SignInView extends StatelessWidget {
  SignInView({super.key});

  final _signInViewModel = Get.put(SignInViewModel(SignInRepositoryImpl()));

  @override
  Widget build(BuildContext context) {
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 20,
                ),
                child: Obx(() {
                  if (_signInViewModel.isLoggedIn.value) {
                    return Column(
                      children: [
                        const Text('로그인 성공'),
                        ElevatedButton(
                          onPressed: () {
                            _signInViewModel.logout();
                          },
                          child: const Text('로그아웃 버튼'),
                        ),
                      ],
                    );
                  } else {
                    return ElevatedButton(
                      onPressed: () {
                        _signInViewModel.loginWithKakao();
                      },
                      child: const Text('카카오 로그인'),
                    );
                  }
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
