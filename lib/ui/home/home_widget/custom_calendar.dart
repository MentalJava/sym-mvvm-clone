import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sym_mvvm_clone/ui/component/s_button.dart';
import 'package:sym_mvvm_clone/ui/component/s_color.dart';
import 'package:sym_mvvm_clone/ui/component/s_text.dart';
import 'package:sym_mvvm_clone/ui/component/s_typo.dart';
import 'package:table_calendar/table_calendar.dart';

// ignore: must_be_immutable
class CustomCalendar extends StatelessWidget {
  final DateTime focusedDay;
  final DateTime selectedDay;
  int selectedYear;
  int selectedMonth;
  final Function({required DateTime focusedDay, required DateTime selectedDay})
      selectDay;
  final Function({required int year, required int month}) updateYearMonth;

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
      firstDay: DateTime.utc(2000, 1, 1),
      lastDay: DateTime.utc(2100, 1, 1),
      selectedDayPredicate: (days) {
        return isSameDay(selectedDay, days);
      },
      onDaySelected: (selectedDay, focusedDay) {
        selectDay(focusedDay: focusedDay, selectedDay: selectedDay);
      },
      calendarBuilders: CalendarBuilders(
        dowBuilder: (context, days) {
          final isSunday = days.weekday == DateTime.sunday;
          return Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: SText(
                text: DateFormat.E('ko_KR').format(days),
                type: TextType.title2,
                color: isSunday ? SColor.sub : SColor.black,
              ),
            ),
          );
        },
        defaultBuilder: (context, days, focusedDay) {
          final isSunday = days.weekday == DateTime.sunday;
          return Padding(
            padding: const EdgeInsets.only(
              bottom: 11,
            ),
            child: SText(
                text: '${days.day}',
                type: TextType.title2,
                color: isSunday ? SColor.sub : SColor.grey4),
          );
        },
        headerTitleBuilder: (context, days) {
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
                  _showYearMonthPicker(context);
                },
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.keyboard_arrow_down_sharp,
                ),
              ),
            ],
          );
        },
        todayBuilder: (context, days, focusedDay) {
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
                text: '${days.day}',
                type: TextType.title2,
                color: SColor.grey4,
              ),
            ],
          );
        },
        selectedBuilder: (context, days, focusedDay) {
          final bool isToday = isSameDay(days, DateTime.now());
          final isSunday = days.weekday == DateTime.sunday;
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
                              text: '${days.day}',
                              type: TextType.title2,
                              color: isSunday ? SColor.sub : SColor.grey4,
                            ),
                          ],
                        ),
                      )
                    : Center(
                        child: SText(
                          text: '${days.day}',
                          type: TextType.title2,
                          color: isSunday ? SColor.sub : SColor.grey4,
                        ),
                      ),
              ),
            ],
          );
        },
        markerBuilder: (context, days, events) {
          if (focusedDay == days) {
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

  void _showYearMonthPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        int intialYear = selectedYear - 1;
        int intialMonth = selectedMonth;

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
                              initialItem: intialYear),
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
                    updateYearMonth(month: selectedMonth, year: selectedYear);
                    print(selectedYear);
                    print(selectedMonth);
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
