import 'package:flutter/material.dart';
import 'package:sym_mvvm_clone/ui/component/s_color.dart';

enum ButtonState {
  standard,
  disabled,
}

class SButton extends StatelessWidget {
  final ButtonState state;
  final VoidCallback? onCilcked;
  final Widget text;
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
          child: Center(
            child: text,
          ),
        ),
      ),
    );
  }
}
