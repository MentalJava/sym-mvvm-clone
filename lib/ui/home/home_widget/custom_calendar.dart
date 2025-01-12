import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sym_mvvm_clone/ui/component/s_button.dart';
import 'package:sym_mvvm_clone/ui/component/s_color.dart';
import 'package:sym_mvvm_clone/ui/component/s_text.dart';
import 'package:sym_mvvm_clone/ui/component/s_typo.dart';
import 'package:sym_mvvm_clone/ui/home/home_typedef.dart';
import 'package:table_calendar/table_calendar.dart';

// ignore: must_be_immutable
class CustomCalendar extends StatelessWidget {
  final DateTime focusedDay;
  final DateTime selectedDay;
  int selectedYear;
  int selectedMonth;
  final SelectDayCallback selectDay;
  final SelectYearMonthCallback updateYearMonth;

  CustomCalendar({
    super.key,
    required this.focusedDay,
    required this.selectedDay,
    required this.selectedYear,
    required this.selectedMonth,
    required this.selectDay,
    required this.updateYearMonth,
  });

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'ko_KR',
      focusedDay: focusedDay,
      firstDay: DateTime.utc(2024, 1, 1),
      lastDay: DateTime.utc(2025, 12, 31),
      selectedDayPredicate: (dateTime) {
        return isSameDay(selectedDay, dateTime);
      },
      onDaySelected: (selectedDay, focusedDay) {
        final today = DateTime.now();
        final todayTime = DateTime(today.year, today.month, today.day);
        final selectedTime =
            DateTime(selectedDay.year, selectedDay.month, selectedDay.day);

        if (selectedTime.isAfter(todayTime)) {
          Get.dialog(
            Stack(
              children: [
                Positioned(
                  bottom: Get.height * 0.2,
                  left: Get.width * 0.1,
                  right: Get.width * 0.1,
                  child: Material(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: SColor.grey6,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 20,
                              right: 4,
                            ),
                            child: Icon(
                              Icons.dangerous_outlined,
                              color: SColor.buddhism,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              right: 16,
                              left: 4,
                            ),
                            child: SText(
                              text: '미래 날짜는 아직 기록할 수 없어요',
                              type: TextType.body3,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            barrierColor: Colors.transparent,
          );
          Future.delayed(
            const Duration(seconds: 2),
            () {
              if (Get.isDialogOpen ?? false) {
                Get.back();
              }
            },
          );
          return;
        }
        selectDay(focusedDay, selectedDay);
      },
      calendarBuilders: CalendarBuilders(
        dowBuilder: (context, dateTime) {
          final isSunday = dateTime.weekday == DateTime.sunday;
          return Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: SText(
                text: DateFormat.E('ko_KR').format(dateTime),
                type: TextType.title2,
                color: isSunday ? SColor.sub : SColor.black,
              ),
            ),
          );
        },
        defaultBuilder: (context, dateTime, focusedDay) {
          final isSunday = dateTime.weekday == DateTime.sunday;
          return Padding(
            padding: const EdgeInsets.only(
              bottom: 11,
            ),
            child: SText(
                text: '${dateTime.day}',
                type: TextType.title2,
                color: isSunday ? SColor.sub : SColor.grey4),
          );
        },
        headerTitleBuilder: (context, dateTime) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SText(
                text: '$selectedYear년 $selectedMonth월',
                type: TextType.title1,
                color: SColor.black,
              ),
              IconButton(
                visualDensity: const VisualDensity(
                  horizontal: -4,
                ),
                onPressed: () {
                  _showYearMonthSheet(context);
                },
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.keyboard_arrow_down_sharp,
                ),
              ),
            ],
          );
        },
        todayBuilder: (context, dateTime, focusedDay) {
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
                text: '${dateTime.day}',
                type: TextType.title2,
                color: SColor.grey4,
              ),
            ],
          );
        },
        selectedBuilder: (context, dateTime, focusedDay) {
          final bool isToday = isSameDay(dateTime, DateTime.now());
          final isSunday = dateTime.weekday == DateTime.sunday;

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
                              text: '${dateTime.day}',
                              type: TextType.title2,
                              color: isSunday ? SColor.sub : SColor.grey4,
                            ),
                          ],
                        ),
                      )
                    : Center(
                        child: SText(
                          text: '${dateTime.day}',
                          type: TextType.title2,
                          color: isSunday ? SColor.sub : SColor.grey4,
                        ),
                      ),
              ),
            ],
          );
        },
        markerBuilder: (context, dateTime, events) {
          if (focusedDay == dateTime) {
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
    );
  }

  void _showYearMonthSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        int intialYear = DateTime.now().year - 1;
        int intialMonth = DateTime.now().month;

        return SizedBox(
          height: 260,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                        ),
                        child: CupertinoPicker(
                          scrollController: FixedExtentScrollController(
                            initialItem: intialYear,
                          ),
                          onSelectedItemChanged: (value) {
                            selectedYear = intialYear + value;
                          },
                          itemExtent: 40,
                          children: List.generate(
                            2,
                            (index) {
                              return Center(
                                child: Text('${intialYear + index}년'),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: CupertinoPicker(
                          scrollController: FixedExtentScrollController(
                              initialItem: intialMonth - 1),
                          onSelectedItemChanged: (value) {
                            selectedMonth = intialMonth + value;
                          },
                          itemExtent: 40,
                          children: List.generate(
                            12,
                            (index) {
                              return Center(
                                child: Text('${intialMonth + index}월'),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 10,
                ),
                child: SButton(
                  text: '완료',
                  state: ButtonState.standard,
                  onCilcked: () {
                    updateYearMonth(
                      selectedYear,
                      selectedMonth,
                    );
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
