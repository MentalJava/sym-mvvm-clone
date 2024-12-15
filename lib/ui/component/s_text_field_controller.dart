import 'package:get/get.dart';

class STextFieldController extends GetxController {
  var inputText = ''.obs;
  var helperText = ''.obs;
  var isVaild = false.obs;

  @override
  void onInit() {
    super.onInit();
    nicknameVaildate('');
  }

  void nicknameVaildate(String value) {
    inputText.value = value;

    if (value.isEmpty || value.length > 5) {
      helperText.value = '한글, 영문을 포함하여 최대 5자까지 입력 가능해요';
      isVaild.value = false;
    } else if (RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(value) ||
        RegExp(r'[0-9]').hasMatch(value) ||
        !isFullyValidKorean(value)) {
      helperText.value = '특수문자와 숫자는 사용이 불가능해요';
      isVaild.value = false;
    } else {
      helperText.value = '사용 가능한 닉네임이에요';
      isVaild.value = true;
    }
  }

  bool isFullyValidKorean(String value) {
    final validKorean = RegExp(r'^[가-힣\s]*$');
    final invalidParts = RegExp(r'[ㄱ-ㅎㅏ-ㅣㆍᆢᆞᆢ]');

    if (!validKorean.hasMatch(value)) {
      return false;
    }
    if (invalidParts.hasMatch(value)) {
      return false;
    }
    return true;
  }
}
