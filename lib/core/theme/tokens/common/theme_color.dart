class ThemeColor {
  final String value;

  const ThemeColor(this.value);

  factory ThemeColor.fromHex(String hex) {
    final normalized = hex.replaceFirst('#', '');

    if (!RegExp(r'^[0-9a-fA-F]{6}([0-9a-fA-F]{2})?$').hasMatch(normalized)) {
      throw FormatException('Invalid theme color: $hex');
    }

    return ThemeColor('#${normalized.toUpperCase()}');
  }

  @override
  String toString() => value;
}
