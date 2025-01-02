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
                child: Obx(
                  () {
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
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            _signInViewModel.loginWithKakao();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.yellow,
                            ),
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/icon/kakao_login.svg',
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                    top: 16,
                                    bottom: 16,
                                    left: 6,
                                  ),
                                  child: SText(
                                    text: '카카오로 시작하기',
                                    type: TextType.title2,
                                    color: Color(0xFF213546),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
