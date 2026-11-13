import 'package:flutter_test/flutter_test.dart';

import 'package:mnemo/features/theme/domain/factories/built_in_theme_factory.dart';

void main() {
  group('BuiltInThemeFactory', () {
    test('should create default App Theme', () {
      final theme = BuiltInThemeFactory.createDefaultAppTheme();

      expect(theme.id, BuiltInThemeFactory.defaultAppThemeId);

      expect(theme.name, 'Mnemo Light');
      expect(theme.isBuiltIn, isTrue);
      expect(theme.version, 1);

      expect(theme.colors, isNotNull);
      expect(theme.typography, isNotNull);
      expect(theme.components, isNotNull);
      expect(theme.decoration, isNotNull);
    });

    test('should create default DataSpace Theme', () {
      final theme = BuiltInThemeFactory.createDefaultDataSpaceTheme();

      expect(theme.id, BuiltInThemeFactory.defaultDataSpaceThemeId);

      expect(theme.name, 'Mnemo Data');
      expect(theme.isBuiltIn, isTrue);
      expect(theme.version, 1);

      expect(theme.colors, isNotNull);
      expect(theme.typography, isNotNull);
      expect(theme.components, isNotNull);
      expect(theme.decoration, isNotNull);
    });

    test('should create default theme binding', () {
      final binding = BuiltInThemeFactory.createDefaultBinding();

      expect(binding.appThemeId, BuiltInThemeFactory.defaultAppThemeId);

      expect(
        binding.dataSpaceThemeId,
        BuiltInThemeFactory.defaultDataSpaceThemeId,
      );
    });

    test('should create independent theme definitions', () {
      final appTheme = BuiltInThemeFactory.createDefaultAppTheme();

      final dataSpaceTheme = BuiltInThemeFactory.createDefaultDataSpaceTheme();

      expect(appTheme.id, isNot(dataSpaceTheme.id));
    });
  });
}
