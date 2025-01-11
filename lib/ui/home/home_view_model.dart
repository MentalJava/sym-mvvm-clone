import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  var focusedDay = DateTime.now().obs;
  var selectedDay = DateTime.now().obs;
  var selectedYear = DateTime.now().year.obs;
  var selectedMonth = DateTime.now().month.obs;

  void selectDay(DateTime newFocusedDay, DateTime newSeletedDay) {
    selectedDay.value = newSeletedDay;
    focusedDay.value = newFocusedDay;
  }

  void updateYearMonth(int year, int month) {
    focusedDay.value = DateTime(year, month, focusedDay.value.day);
  }
}
