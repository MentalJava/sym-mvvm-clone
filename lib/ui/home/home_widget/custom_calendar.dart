import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sym_mvvm_clone/ui/component/s_color.dart';
import 'package:sym_mvvm_clone/ui/component/s_text.dart';
import 'package:sym_mvvm_clone/ui/component/s_typo.dart';
import 'package:sym_mvvm_clone/ui/home/home_view_model.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendar extends StatelessWidget {
  const CustomCalendar({
    super.key,
    required HomeViewModel homeViewModel,
  }) : _homeViewModel = homeViewModel;

  final HomeViewModel _homeViewModel;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TableCalendar(
        locale: 'ko_KR',
        focusedDay: _homeViewModel.focusedDay.value,
        firstDay: DateTime.utc(2025, 1, 1),
        lastDay: DateTime.utc(2026, 1, 1),
        selectedDayPredicate: (day) {
          return isSameDay(_homeViewModel.selectedDay.value, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          _homeViewModel.selectDay(selectedDay, focusedDay);
        },
        calendarBuilders: CalendarBuilders(
          dowBuilder: (context, day) {
            final isSunday = day.weekday == DateTime.sunday;
            return Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: SText(
                  text: DateFormat.E('ko_KR').format(day),
                  type: TextType.title2,
                  color: isSunday ? SColor.sub : SColor.black,
                ),
              ),
            );
          },
          defaultBuilder: (context, day, focusedDay) {
            final isSunday = day.weekday == DateTime.sunday;
            return Padding(
              padding: const EdgeInsets.only(
                bottom: 11,
              ),
              child: SText(
                  text: '${day.day}',
                  type: TextType.title2,
                  color: isSunday ? SColor.sub : SColor.grey4),
            );
          },
          headerTitleBuilder: (context, day) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SText(
                  text:
                      '${_homeViewModel.selectedYear.value}년 ${_homeViewModel.selectedMonth}월',
                  type: TextType.title1,
                  color: SColor.black,
                ),
                IconButton(
                  visualDensity: const VisualDensity(
                    horizontal: -4,
                  ),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.keyboard_arrow_down_sharp,
                  ),
                ),
              ],
            );
          },
          todayBuilder: (context, day, focusedDay) {
            return Column(
              children: [
                Transform.translate(
                  offset: const Offset(0, 6),
                  child: const SText(
                    text: '오늘',
                    type: TextType.body3,
                    color: SColor.buddhism,
                  ),
                ),
                SText(
                  text: '${day.day}',
                  type: TextType.title2,
                  color: SColor.grey4,
                ),
              ],
            );
          },
          selectedBuilder: (context, day, focusedDay) {
            final bool isToday = isSameDay(day, DateTime.now());
            final isSunday = day.weekday == DateTime.sunday;
            return Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: SColor.medium,
                  ),
                  child: isToday
                      ? Transform.translate(
                          offset: const Offset(0, -4),
                          child: Column(
                            children: [
                              Transform.translate(
                                offset: const Offset(0, 6),
                                child: const SText(
                                  text: '오늘',
                                  type: TextType.body3,
                                  color: SColor.buddhism,
                                ),
                              ),
                              SText(
                                text: '${day.day}',
                                type: TextType.title2,
                                color: isSunday ? SColor.sub : SColor.grey4,
                              ),
                            ],
                          ),
                        )
                      : Center(
                          child: SText(
                            text: '${day.day}',
                            type: TextType.title2,
                            color: isSunday ? SColor.sub : SColor.grey4,
                          ),
                        ),
                ),
              ],
            );
          },
          markerBuilder: (context, day, events) {
            if (_homeViewModel.selectedDay.value == day) {
              return Padding(
                padding: const EdgeInsets.only(
                  bottom: 4,
                ),
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              );
            }
            return null;
          },
        ),
        headerStyle: const HeaderStyle(
          rightChevronVisible: false,
          leftChevronVisible: false,
          formatButtonVisible: false,
          titleCentered: true,
        ),
        calendarStyle: const CalendarStyle(
          outsideDaysVisible: false,
          tablePadding: EdgeInsets.symmetric(
            horizontal: 6,
          ),
        ),
      ),
    );
  }
}
