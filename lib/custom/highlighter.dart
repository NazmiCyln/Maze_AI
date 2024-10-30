// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_highlighter/flutter_highlighter.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markdown/markdown.dart' as md;

class Highlight extends MarkdownElementBuilder {
  Highlight();

  @override
  Widget visitElementAfter(md.Element element, TextStyle? preferredStyle) {
    var language = 'python';
    final pattern = RegExp(r'^language-(.+)$');
    if (element.attributes['class'] != null && pattern.hasMatch(element.attributes['class']!)) {
      language = pattern.firstMatch(element.attributes['class']!)?.group(1) ?? 'python';
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: HighlightView(
        element.textContent.trim(),
        language: language,
        padding: const EdgeInsets.all(8),
      ),
    );
  }
}
