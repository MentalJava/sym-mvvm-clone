import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sym_mvvm_clone/data/repository/sign_up_repository/sign_up_repository_impl.dart';
import 'package:sym_mvvm_clone/ui/component/s_button.dart';
import 'package:sym_mvvm_clone/ui/component/s_color.dart';
import 'package:sym_mvvm_clone/ui/component/s_text.dart';
import 'package:sym_mvvm_clone/ui/component/s_text_field.dart';
import 'package:sym_mvvm_clone/ui/component/s_typo.dart';
import 'package:sym_mvvm_clone/ui/sign_up/sign_up_view_model.dart';

class SignUpView extends StatelessWidget {
  final _signUpViewModel = Get.put(SignUpViewModel(SignUpRepositoryImpl()));

  SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        centerTitle: true,
        title: const SText(
          text: '닉네임 설정',
          type: TextType.title1,
          color: SColor.black,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              top: 48,
              left: 28,
              bottom: 16,
            ),
            child: SText(
              text: '환영해요! \n닉네임을 입력해주세요',
              type: TextType.header2,
              color: SColor.black,
            ),
          ),
          Obx(
            () => STextField(
              hintText: '닉네임을 입력해주세요',
              helperText: _signUpViewModel.helperText.value,
              onChanged: (value) {
                _signUpViewModel.nicknameValidate(value!);
              },
              vaild: _signUpViewModel.isVaild.value,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 30,
            ),
            child: Obx(
              () => SButton(
                text: '완료',
                state: _signUpViewModel.isVaild.value
                    ? ButtonState.standard
                    : ButtonState.disabled,
                onCilcked: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
