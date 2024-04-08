import 'package:flutter/material.dart';

import '../utils/ts.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.onLongPress,
      this.isInProgress = false,
      this.isFullWidth = true,
      this.elevation = 1.0,
      this.textStyle,
      this.bgColor,
      this.borderColor,
      this.borderWidth,
      this.icon,
      this.hasAnimation = true,
      this.borderRadius = 4,
      this.useTextAsHero = true,
      this.height = 55,
      this.textColor});
  final String text;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;

  final bool isInProgress;
  final double elevation;
  final TextStyle? textStyle;
  final Color? bgColor;
  final Color? borderColor;
  final double? borderWidth;
  final bool isFullWidth;
  final IconData? icon;

  final double borderRadius;

  final double? height;
  final Color? textColor;

  /// If true, the button will have a hero animation
  final bool hasAnimation;

  /// only used if [hasAnimation] is true
  /// if true, [text] will be used as the hero tag
  final bool useTextAsHero;

  double get _padHor => 20;

  bool get isDisabled => onPressed == null && onLongPress == null;

  Color _borderColor(BuildContext context) {
    if (isDisabled && !isInProgress) {
      return Theme.of(context).disabledColor;
    }

    return borderColor != null
        ? borderColor!
        : bgColor ?? Theme.of(context).primaryColor;
  }

  double get _borderWidth {
    return borderWidth != null ? borderWidth! : 1;
  }

  Color _textColor(BuildContext context) {
    return textStyle?.color ??
        textColor ??
        Theme.of(context).scaffoldBackgroundColor;
  }

  Color _bgColor(BuildContext context) {
    return (isDisabled && !isInProgress)
        ? Theme.of(context).disabledColor
        : bgColor ?? Theme.of(context).primaryColor;
  }

  ButtonStyle _buttonStyle(BuildContext context) {
    return ButtonStyle(
      elevation: MaterialStateProperty.all<double>(elevation),
      backgroundColor: MaterialStateProperty.all<Color>(_bgColor(context)),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(width: _borderWidth, color: _borderColor(context)),
        ),
      ),
    );
  }

  Widget _wChild(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _padHor),
      child: isInProgress
          ? const CircularProgressIndicator(color: Colors.white)
          : Text(text,
              style: textStyle ?? Ts.bold18(color: _textColor(context))),
    );
  }

  Widget _wButton(BuildContext context) {
    if (icon != null && !isInProgress) {
      return SizedBox(
        width: isFullWidth ? double.infinity : null,
        height: height,
        child: ElevatedButton.icon(
          key: Key(text),
          style: _buttonStyle(context),
          label: _wChild(context),
          icon: Icon(icon, color: _textColor(context)),
          onPressed: onPressed,
          onLongPress: onLongPress,
        ),
      );
    }

    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      height: height,
      child: ElevatedButton(
        key: Key(text),
        style: _buttonStyle(context),
        onPressed: onPressed,
        onLongPress: onLongPress,
        child: _wChild(context),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isInProgress) {
      return Opacity(opacity: 0.4, child: _wButton(context));
    }

    if (!hasAnimation) {
      return _wButton(context);
    }

    return Hero(
      tag: useTextAsHero ? text : "app_button",
      child: _wButton(context),
    );
  }
}
