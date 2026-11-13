class ThemeTypography {
  final String? fontFamily;
  final double fontSize;
  final double fontWeight;
  final double? letterSpacing;
  final double? lineHeight;

  const ThemeTypography({
    this.fontFamily,
    this.fontSize = 14,
    this.fontWeight = 400,
    this.letterSpacing,
    this.lineHeight,
  });
}
