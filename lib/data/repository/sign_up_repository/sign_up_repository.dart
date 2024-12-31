abstract class SignUpRepository {
  bool nicknameVaildate(String value);
  bool isFullyValidKoreanOrEnglish(String value);
  String getHelperText(String value);
}
