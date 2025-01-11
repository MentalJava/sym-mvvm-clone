import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sym_mvvm_clone/ui/component/s_color.dart';
import 'package:sym_mvvm_clone/ui/component/s_text.dart';
import 'package:sym_mvvm_clone/ui/component/s_typo.dart';
import 'package:sym_mvvm_clone/ui/home/home_view_model.dart';
import 'package:sym_mvvm_clone/ui/home/home_widget/custom_calendar.dart';

class HomeView extends StatelessWidget {
  final _homeViewModel = Get.put(HomeViewModel());
  HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -68,
            left: -56,
            child: Container(
              width: 210,
              height: 210,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: SColor.medium,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(
                  top: 60,
                  left: 28,
                  bottom: 4,
                ),
                child: SText(
                  text: '유준유준님, 반가워요!',
                  type: TextType.header2,
                  color: SColor.black,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 28,
                ),
                child: SText(
                  text: '오늘의 기분은 어때요?',
                  type: TextType.header2,
                  color: SColor.main,
                ),
              ),
              Obx(
                () => CustomCalendar(
                  focusedDay: _homeViewModel.focusedDay.value,
                  selectedDay: _homeViewModel.selectedDay.value,
                  selectedMonth: _homeViewModel.selectedMonth.value,
                  selectedYear: _homeViewModel.selectedYear.value,
                  selectDay: ({required focusedDay, required selectedDay}) {
                    _homeViewModel.selectDay(focusedDay, selectedDay);
                  },
                  updateYearMonth: ({required year, required month}) {
                    _homeViewModel.updateYearMonth(year, month);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
