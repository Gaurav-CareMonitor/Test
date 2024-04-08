import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../utils/ts.dart';

class AppText extends StatelessWidget {
  const AppText(this.text,
      {super.key,
      this.hasAnimation = false,
      this.style,
      this.textAlign,
      this.overflow,
      this.maxLines,
      this.textDirection,
      this.locale,
      this.softWrap,
      this.isRich = false,
      this.padding = EdgeInsets.zero,
      this.spans = const [],
      this.isAutoSize = false});

  final String? text;
  final TextStyle? style;
  final bool isRich;
  final bool isAutoSize;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final EdgeInsets padding;
  final List<TextSpan> spans;

  final bool hasAnimation;

  Widget _wText() {
    if (isRich) {
      return Text.rich(
        TextSpan(
          children: [
            ..._buildTextSpans(text ?? ''),
            ...spans,
          ],
        ),
        softWrap: softWrap ?? true,
        textAlign: textAlign ?? TextAlign.start,
        overflow: overflow ?? TextOverflow.clip,
        maxLines: maxLines,
        textDirection: textDirection,
      );
    }
    if (isAutoSize) {
      return AutoSizeText(
        text ?? '',
        style: style,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        minFontSize: 8,
      );
    }
    return Text(
      text ?? '',
      style: style,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
    );
  }

  List<TextSpan> _buildTextSpans(String text) {
    List<TextSpan> spans = [];
    List<String> words = text.split(' ');

    for (String word in words) {
      if (word.startsWith('/B-')) {
        spans.add(TextSpan(
            text: '${word.substring(3)} ',
            style: style?.copyWith(fontWeight: FontWeight.bold) ?? Ts.black(),
            locale: locale));
      } else {
        spans.add(TextSpan(text: '$word ', style: style, locale: locale));
      }
    }

    return spans;
  }

  Widget _wPadding() {
    return Padding(
      padding: padding,
      child: _wText(),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (hasAnimation) return Hero(tag: text ?? '', child: _wPadding());
    return _wPadding();
  }
}
