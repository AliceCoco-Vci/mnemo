import 'package:flutter/widgets.dart';

import 'data_space_theme_scope.dart';

enum DataSpaceTextVariant { heading, title, body, caption, tableCell }

class DataSpaceText extends StatelessWidget {
  final String text;
  final DataSpaceTextVariant variant;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const DataSpaceText(
    this.text, {
    super.key,
    this.variant = DataSpaceTextVariant.body,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    final style = DataSpaceThemeScope.of(context);

    final textStyle = switch (variant) {
      DataSpaceTextVariant.heading => style.headingStyle,
      DataSpaceTextVariant.title => style.titleStyle,
      DataSpaceTextVariant.body => style.bodyStyle,
      DataSpaceTextVariant.caption => style.captionStyle,
      DataSpaceTextVariant.tableCell => style.tableCellStyle,
    };

    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: textStyle.copyWith(
        color:
            color ??
            (variant == DataSpaceTextVariant.caption
                ? style.textSecondaryColor
                : style.textPrimaryColor),
      ),
    );
  }
}
