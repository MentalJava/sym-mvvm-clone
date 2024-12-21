import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sym_mvvm_clone/ui/component/s_color.dart';
import 'package:sym_mvvm_clone/ui/component/s_text.dart';
import 'package:sym_mvvm_clone/ui/component/s_typo.dart';

enum BottomNaviItem {
  emotionDiary,
  mypage,
}

class SNavigation extends StatelessWidget {
  final BottomNaviItem currentItem;
  final ValueChanged<BottomNaviItem> onTap;
  const SNavigation({
    super.key,
    required this.currentItem,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            blurRadius: 3,
            spreadRadius: 1,
          )
        ],
      ),
      child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 56,
                  vertical: 12,
                ),
                child: _customNaviItem(
                  iconPath: 'assets/navigation/emotion_diary.svg',
                  label: '감정일기',
                  isSelected: currentItem == BottomNaviItem.emotionDiary,
                  item: BottomNaviItem.emotionDiary,
                  onTap: onTap,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 56,
                  vertical: 12,
                ),
                child: _customNaviItem(
                  iconPath: 'assets/navigation/my_info.svg',
                  label: '내정보',
                  isSelected: currentItem == BottomNaviItem.mypage,
                  item: BottomNaviItem.mypage,
                  onTap: onTap,
                ),
              ),
            ],
          )),
    );
  }

  GestureDetector _customNaviItem({
    required String iconPath,
    required String label,
    required bool isSelected,
    required BottomNaviItem item,
    required ValueChanged<BottomNaviItem> onTap,
  }) {
    return GestureDetector(
      onTap: () => onTap(item),
      child: Container(
        padding: const EdgeInsets.only(
          bottom: 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              iconPath,
              colorFilter: ColorFilter.mode(
                  isSelected ? SColor.main : SColor.grey3, BlendMode.srcIn),
            ),
            SText(
              text: label,
              type: TextType.body3,
              color: isSelected ? SColor.main : SColor.grey3,
            )
          ],
        ),
      ),
    );
  }
}
