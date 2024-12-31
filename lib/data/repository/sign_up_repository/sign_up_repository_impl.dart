import 'package:sym_mvvm_clone/data/repository/sign_up_repository/sign_up_repository.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  @override
  bool nicknameVaildate(String value) {
    if (value.isEmpty || value.length > 5) {
      return false;
    }
    if (RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(value) ||
        RegExp(r'[0-9]').hasMatch(value) ||
        !isFullyValidKoreanOrEnglish(value)) {
      return false;
    }
    return true;
  }

  @override
  bool isFullyValidKoreanOrEnglish(String value) {
    final validKorean = RegExp(r'^[가-힣a-zA-Z\s]*$');
    final invalidParts = RegExp(r'[ㄱ-ㅎㅏ-ㅣㆍᆢᆞᆢ]');
    if (!validKorean.hasMatch(value) || invalidParts.hasMatch(value)) {
      return false;
    }
    return true;
  }

  @override
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
