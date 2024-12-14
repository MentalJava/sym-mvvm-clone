import 'package:flutter/material.dart';
import 'package:sym_mvvm_clone/ui/component/s_color.dart';
import 'package:sym_mvvm_clone/ui/component/s_text.dart';
import 'package:sym_mvvm_clone/ui/component/s_typo.dart';

enum ButtonState {
  standard,
  disabled,
}

class SButton extends StatelessWidget {
  final ButtonState state;
  final VoidCallback? onCilcked;
  final String text;
  const SButton({
    super.key,
    this.onCilcked,
    required this.text,
    required this.state,
  });

  Color _getBackgroundColor() {
    switch (state) {
      case ButtonState.standard:
        return SColor.main;
      case ButtonState.disabled:
        return SColor.grey1;
    }
  }

  Color _getTextColor() {
    switch (state) {
      case ButtonState.standard:
        return Colors.white;
      case ButtonState.disabled:
        return SColor.grey5;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEnabled = state != ButtonState.disabled;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      width: double.infinity,
      child: GestureDetector(
        onTap: isEnabled ? onCilcked : null,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: _getBackgroundColor(),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
            ),
            child: Center(
                child: SText(
              text: text,
              type: TextType.body1,
              color: _getTextColor(),
            )),
          ),
        ),
      ),
    );
  }
}
