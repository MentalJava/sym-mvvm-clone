import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sym_mvvm_clone/ui/component/s_color.dart';
import 'package:sym_mvvm_clone/ui/component/s_typo.dart';

class SNavigation extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  const SNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
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
        child: BottomNavigationBar(
          onTap: onTap,
          currentIndex: currentIndex,
          selectedItemColor: SColor.main,
          unselectedItemColor: SColor.grey3,
          selectedLabelStyle: STypo.getStyle(TextType.body3),
          unselectedLabelStyle: STypo.getStyle(TextType.body3),
          elevation: 0,
          items: [
            _customNaviItem(
              iconPath: 'assets/navigation/emotion_diary.svg',
              label: '감정일기',
              isSelected: currentIndex == 0,
            ),
            _customNaviItem(
              iconPath: 'assets/navigation/my_info.svg',
              label: '내정보',
              isSelected: currentIndex == 1,
            )
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _customNaviItem({
    required String iconPath,
    required String label,
    required bool isSelected,
  }) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.only(
          top: 12,
        ),
        child: SvgPicture.asset(
          iconPath,
          colorFilter: ColorFilter.mode(
              isSelected ? SColor.main : SColor.grey3, BlendMode.srcIn),
        ),
      ),
      label: label,
    );
  }
}
