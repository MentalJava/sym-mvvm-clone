import 'package:get/get.dart';
import 'package:sym_mvvm_clone/data/repository/sign_in_repository/sign_in_repository.dart';

class SignInViewModel extends GetxController {
  final SignInRepository _signInRepository;

  var isLoggedIn = false.obs;

  SignInViewModel(this._signInRepository);

  Future<void> loginWithKakao() async {
    final result = await _signInRepository.loginWithKakao();
    if (result) {
      isLoggedIn.value = true;
    } else {
      print('로그인 실패');
    }
  }

  Future<void> logout() async {
    await _signInRepository.logout();
    isLoggedIn.value = false;
  }
}
