import 'package:flutter/material.dart';

enum TextType {
  header1,
  header2,
  title1,
  title2,
  title3,
  body1,
  body2,
  body3,
}

class STypo {
  static TextStyle getStyle(TextType type) {
    switch (type) {
      case TextType.header1:
        return const TextStyle(
          fontFamily: 'PretendardBold',
          fontSize: 20,
        );
      case TextType.header2:
        return const TextStyle(
          fontFamily: 'PretendardBold',
          fontSize: 18,
        );
      case TextType.title1:
        return const TextStyle(
          fontFamily: 'PretendardMedium',
          fontSize: 18,
        );
      case TextType.title2:
        return const TextStyle(
          fontFamily: 'PretendardBold',
          fontSize: 17,
        );
      case TextType.title3:
        return const TextStyle(
          fontFamily: 'PretendardBold',
          fontSize: 16,
        );
      case TextType.body1:
        return const TextStyle(
          fontFamily: 'PretendardMedium',
          fontSize: 17,
        );
      case TextType.body2:
        return const TextStyle(
          fontFamily: 'PretendardMedium',
          fontSize: 14,
        );
      case TextType.body3:
        return const TextStyle(
          fontFamily: 'PretendardMedium',
          fontSize: 12,
        );
    }
  }
}
