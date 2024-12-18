import 'package:get/get.dart';

class SplashViewModel extends GetxController {
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    _simulateLoading();
  }

  Future<void> _simulateLoading() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () {
        isLoading.value = false;
      },
    );
  }
}
