import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:sym_mvvm_clone/data/repository/sign_in_repository/sign_in_repository.dart';

class SignInRepositoryImpl implements SignInRepository {
  @override
  Future<bool> loginWithKakao() async {
    try {
      if (await isKakaoTalkInstalled()) {
        await UserApi.instance.loginWithKakaoTalk();
      } else {
        await UserApi.instance.loginWithKakaoAccount();
      }

      final user = await UserApi.instance.me();
      print('카카오 로그인 성공 : ${user.kakaoAccount?.profile?.nickname}');
      return true;
    } catch (e) {
      print('카카오 로그인 실패 : $e');
      return false;
    }
  }

  @override
  Future<void> logout() async {
    try {
      await UserApi.instance.logout();
      print('로그아웃 성공');
    } catch (e) {
      print('로그아웃 실패 $e');
    }
  }
}
