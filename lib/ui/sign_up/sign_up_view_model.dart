import 'package:get/get.dart';

class SignUpViewModel extends GetxController {
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
        !isFullyValidKoreanOrEnglish(value)) {
      helperText.value = '특수문자와 숫자는 사용이 불가능해요';
      isVaild.value = false;
    } else {
      helperText.value = '사용 가능한 닉네임이에요';
      isVaild.value = true;
    }
  }

  bool isFullyValidKoreanOrEnglish(String value) {
    final validKorean =
        RegExp(r'^[가-힣a-zA-Z\s]*$'); // 뒤에 유효한 공백이나 완전한 글자가 아니면 안되도록 선언
    final invalidParts = RegExp(
        r'[ㄱ-ㅎㅏ-ㅣㆍᆢᆞᆢ]'); // 아래아 때문에 골치 아팠음 android, iphone 아래아도 다르기도 하고 천지인 키보드를 애초에 생각 안했었음.

    if (!validKorean.hasMatch(value)) {
      return false;
    }
    if (invalidParts.hasMatch(value)) {
      return false;
    }
    return true;
  }

  String getHelperText(String value) {
    if (value.isEmpty || value.length > 5) {
      return '한글, 영문을 포함하여 최대 5자까지 입력 가능해요';
    } else if (RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(value) ||
        RegExp(r'[0-9]').hasMatch(value) ||
        !isFullyValidKoreanOrEnglish(value)) {
      return '특수문자와 숫자는 사용이 불가능해요';
    } else {
      return '사용 가능한 닉네임이에요';
    }
  }
}
