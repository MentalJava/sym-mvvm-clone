import 'package:flutter/material.dart';
import 'package:sym_mvvm_clone/ui/component/s_typo.dart';

class SText extends StatelessWidget {
  final String text;
  final TextType type;
  final Color? color;

  const SText({
    required this.text,
    required this.type,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final style = STypo.getStyle(type).copyWith(color: color);
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: style,
    );
  }
}
