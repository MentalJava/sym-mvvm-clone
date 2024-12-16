import 'package:flutter/material.dart';
import 'package:sym_mvvm_clone/ui/component/s_color.dart';
import 'package:sym_mvvm_clone/ui/component/s_text.dart';
import 'package:sym_mvvm_clone/ui/component/s_typo.dart';

class STextField extends StatelessWidget {
  final String hintText;
  final void Function(String?)? onChanged;
  final String helperText;
  final bool vaild;
  const STextField({
    super.key,
    required this.hintText,
    this.onChanged,
    required this.helperText,
    required this.vaild,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: TextFormField(
        style: STypo.getStyle(TextType.body2).copyWith(color: SColor.black),
        cursorColor: Colors.blue,
        decoration: InputDecoration(
          filled: true,
          fillColor: SColor.grey1,
          isCollapsed: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            borderSide: BorderSide.none,
          ),
          hintText: hintText,
          hintStyle:
              STypo.getStyle(TextType.body2).copyWith(color: SColor.grey3),
          helper: SText(
            text: helperText,
            type: TextType.body3,
            color: vaild ? SColor.possibility : SColor.buddhism,
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
