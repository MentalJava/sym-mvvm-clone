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

  void updateYearMonth(int newSelectedyear, int newSelectedmonth) {
    selectedYear.value = newSelectedyear;
    selectedMonth.value = newSelectedmonth;
    focusedDay.value =
        DateTime(selectedYear.value, selectedMonth.value, focusedDay.value.day);
  }
}
