import 'theme_color.dart';

class ThemeShadow {
  final ThemeColor color;
  final double blurRadius;
  final double spreadRadius;
  final double offsetX;
  final double offsetY;

  const ThemeShadow({
    this.color = const ThemeColor('#00000020'),
    this.blurRadius = 8,
    this.spreadRadius = 0,
    this.offsetX = 0,
    this.offsetY = 2,
  });
}
