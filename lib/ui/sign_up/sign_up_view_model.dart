import 'package:get/get.dart';
import 'package:sym_mvvm_clone/data/repository/sign_up_repository/sign_up_repository.dart';

class SignUpViewModel extends GetxController {
  final SignUpRepository _signUpRepository;

  var inputText = ''.obs;
  var helperText = ''.obs;
  var isVaild = false.obs;

  @override
  void onInit() {
    super.onInit();
    nicknameValidate('');
  }

  SignUpViewModel(this._signUpRepository);

  void nicknameValidate(String value) {
    inputText.value = value;
    isVaild.value = _signUpRepository.nicknameVaildate(value);
    helperText.value = _signUpRepository.getHelperText(value);
  }
}
